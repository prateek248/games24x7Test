#!/bin/bash
count=0
cat ./regex.txt | while read -r line
do
        if [[ $line =~ ^([h,t,p]{4}).*(games24x7.com).* ]]; then
                count=$(($count+1))
                echo "$count matches with $line"
        fi
done