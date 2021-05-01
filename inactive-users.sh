#!/bin/bash

d=2021-05-01
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
                        echo $line | awk -F "," '{print $4}'
                fi
        fi
done < "userslist"
