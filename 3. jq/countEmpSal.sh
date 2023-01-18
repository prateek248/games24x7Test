#!/bin/bash

url="https://dummy.restapiexample.com/api/v1/employees"
headers="Accept: application/json"

countEmp=$(curl -s -H "$headers" $url | jq '.data[] | select(.employee_salary > 100000) | select (.employee_salary < 200000).id' | wc -l)
echo "Number of employees with salary in between 100000 and 200000 are $countEmp"