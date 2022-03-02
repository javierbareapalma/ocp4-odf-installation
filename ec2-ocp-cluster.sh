#!/bin/bash

ACTION="$1"
export AWS_DEFAULT_REGION="$2"

if [ ! -z $1 ] && [ "$1" = "start" ]; then
  echo "Starting instances..."
elif [ ! -z $1 ] && [ "$1" = "stop" ]; then
  echo "Stopping instances..."
elif [ ! -z $1 ] && [ "$1" = "status" ]; then
  echo "Fetching instances status..."
else
  echo "Wrong parameter \n"
  echo "Usage ec2-ocp-cluster.sh start|stop|status region"
  exit 1
fi

INSTANCES=$(aws ec2 describe-instances --output json | jq -r ".Reservations[] | .Instances[] | .InstanceId")
for i in $INSTANCES
do
  if [ "$1" = "start" ]; then
    aws ec2 start-instances --instance-ids $i 2>&1 > /dev/null
  elif [ "$1" = "stop" ]; then
    aws ec2 stop-instances --instance-ids $i 2>&1 > /dev/null
  elif [ "$1" = "status" ]; then
    aws ec2 describe-instances --instance-ids $i --output json | jq -jr '.Reservations[] | .Instances[] | .InstanceId, " -- ",.State.Name,"\n"'
  else
    echo "Unable to start or stop instance"
  fi
done

if [ "$1" != "status" ]; then
  echo "Fetching status:"
  aws ec2 describe-instances --output json | jq -jr '.Reservations[] | .Instances[] | .InstanceId, " -- ",.State.Name,"\n"'
fi