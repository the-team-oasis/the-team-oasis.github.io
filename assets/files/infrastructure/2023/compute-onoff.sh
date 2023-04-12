#!/bin/bash
set -e

action=$1
compartmentId=$2

if [ "$action" == "START" ]; then
  echo "START command received"
elif [ "$action" == "STOP" ]; then
  echo "STOP command received"
else
  echo "Invalid parameter. Please enter 'START' or 'STOP'"
  echo "./compute-onoff.sh [START or STOP] [enter CompartmentID]"
  exit 1
fi
echo "action: $action"

if [ -z "$compartmentId" ]; then
  echo "Error: compartmentId parameter is required"
  echo "./compute-onoff.sh [START or STOP] [enter CompartmentID]"
  exit 1
fi

# compartmentId parameter is present, continue with the script
echo "compartmentId: $compartmentId"

computeList=$(eval "oci compute instance list --compartment-id $compartmentId")

for i in $(echo "$computeList" | jq '.data | keys | .[]'); do
  echo "loop: $i"

  ID=$(echo "$computeList" | jq -r ".data[$i].\"id\"")
  displayName=$(echo "$computeList" | jq -r ".data[$i].\"display-name\"")
  lifecycleState=$(echo "$computeList" | jq -r ".data[$i].\"lifecycle-state\"")

  echo "ID: $ID"
  echo "displayName: $displayName"
  echo "lifecycleState: $lifecycleState"
  echo "****"

  if [ "$displayName" == "compute-onoff" ]; then
    echo "skip compute-onoff instance"
    continue
  fi
  if [ "$1" == "START" ] && [ "$lifecycleState" == "STOPPED" ]; then
    echo "start instance $displayName"
    oci compute instance action --action START --instance-id $ID
  elif [ "$1" == "STOP" ] && [ "$lifecycleState" == "RUNNING" ]; then
    echo "stop instance $displayName"
    oci compute instance action --action STOP --instance-id $ID
  else
    echo "Nothing to do"
  fi
done
