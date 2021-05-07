#!/bin/bash

read -p 'Enter GitHub Token    : ' token
read -p 'Enter GitHub Hostname : ' hostname

while read line || [ -n "$line" ]
do
  curl -X PUT -H "Accept: application/vnd.github.v3+json" -H "Authorization: token ${token}" "http(s)://${hostname}/api/v3/users/${line}/suspended" -d '{"reason":"inactive"}'
done < "inactiveusers.csv"
