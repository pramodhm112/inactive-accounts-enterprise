#!/bin/bash

# curl -L -u "user:token" https://HOSTNAME/stafftools/reports/all_users.csv > userslist

d=$(date -d "now - 14 days" +%Y-%m-%d)
todate=$(date -d $d +%s)

while read line || [ -n "$line" ]
do
        data=$(echo $line | awk -F "," '{print $12}')

        if [[ $data = "No activity" ]] || [[ $data = last_active ]]
        then
                continue

        else
                cdate=$(echo $data | awk '{print $1}')
                decide=$(date -d $cdate +%s)

                if [[ $decide -le $todate ]]
                then
                        echo $line | awk -F "," '{print $4}' >> inactiveusers.csv
                fi
        fi
done < "users.csv"
