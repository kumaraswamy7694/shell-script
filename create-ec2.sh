#!/bin/bash

# Array of instance names
NAMES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
IMAGE_ID=ami-0b4f379183e5706b9
SECURITY_GROUP_ID=sg-0729448b7fb37ace1
INSTANCE_TYPE=""

# Loop through each instance name
for i in "${NAMES[@]}"
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
    aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]"

done
