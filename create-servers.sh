#!/bin/bash

# Array of instance names
NAMES=$@
IMAGE_ID=ami-0b4f379183e5706b9
SECURITY_GROUP_ID=sg-0729448b7fb37ace1
INSTANCE_TYPE=""
DOMAIN_NAME=kumaraswamy.xyz

# Loop through each instance name
for i in $@
do
    # Set instance type based on name
    if [[ "$i" == "mongodb" || "$i" == "mysql" ]]; then
        INSTANCE_TYPE="t3.medium"
    else
        INSTANCE_TYPE="t2.micro"
    fi 

    # Print instance being created
    echo "Creating $i instance..."

    # Run the AWS CLI command to create the instance
    IP_ADDRESS=$(aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r '.Instances[0].PrivateIpAddress')
  
    echo "created $i instance: $IP_ADDRESS"

    aws route53 change-resource-record-sets --hosted-zone-id Z011735029B6AONSQ3Z1E --change-batch '
{
            "Comment": "CREATE/DELETE/UPSERT a record ",
            "Changes": [{
            "Action": "CREATE",
                        "ResourceRecordSet": {
                                    "Name": "'$i.$DOMAIN_NAME'",
                                    "Type": "A",
                                    "TTL": 300,
                                 "ResourceRecords": [{ "Value": "'$IP_ADDRESS'"}]
}}]
}
'


done
