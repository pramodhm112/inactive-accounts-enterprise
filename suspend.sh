#!/bin/bash

read -p 'Enter GitHub Token    : ' token
read -p 'Enter GitHub Hostname : ' hostname

while read line || [ -n "$line" ]
do

  data=$(echo $line | awk -F "," '{print $1}')
  echo $data
  curl -X PUT -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${token}" "https://${hostname}/api/v3/users/${data}/suspended" -d '{"reason":"inactive"}'
done < "inactiveusers.csv"
