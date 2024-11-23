#!/bin/bash

NAMES=("mongodb redis" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
for in in "${NAMES[@]}"
do
    echo "NAME: $1"
done