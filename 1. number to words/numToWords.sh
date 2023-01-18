#!/bin/bash

digits=("" "One " "Two " "Three " "Four " "Five " "Six " "Seven " "Eight " "Nine " "Ten " "Eleven " "Twelve " "Thirteen " "Fourteen " "Fifteen " "Sixteen " "Seventeen " "Eighteen " "Nineteen ")
tens=("" "" "Twenty " "Thirty " "Forty " "Fifty " "Sixty " "Seventy " "Eighty " "Ninety ")

echo -n "Enter the number : "
read num

lengthOfNumber() {
  n=$1
  sd=0
  nd=0
  while [ $n -gt 0 ]
  do
    sd=$(( $n % 10 ))
    n=$(( $n / 10 ))
    nd=$(( $nd + 1))
  done
  echo "$nd"
}

digitToWords() {
  if [[ $1 -gt 19 ]]; then
    tens_index=$(($1/10))
    ones_index=$(($1%10))
    echo "${tens[$tens_index]}${digits[$ones_index]}$2 "
  fi
  if [[ $1 -le 19 ]] && [[ $1 -gt 0 ]]; then
    echo "${digits[$1]}$2 "
  fi
}
toWords() {
  declare local numToWords=""
  numToWords+=$(digitToWords $(($1/10000000)) Crore)
  numToWords+=$(digitToWords $(($(($1/100000))%100)) Lakh)
  numToWords+=$(digitToWords $(($(($1/1000))%100)) Thousand)
  declare local tempNum1=$(($(($1/100))%10))
  declare local first1=$(echo $tempNum1 | cut -c 1)
  declare local secFrmLast1=$(echo $tempNum1 | cut -c 2)
  declare local last1=$(echo $tempNum1 | cut -c 3)
  if [[ $1 -gt 100 ]] && [[ $(($1%100)) -eq 0 ]] && [[ $first1 -gt 0 ]] && [[ $secFrmLast1 -eq 0 ]] && [[ $last1 -eq 0 ]]; then
    numToWords+=" and "
  fi
  numToWords+=$(digitToWords $(($(($1/100))%10)) Hundred)
  declare local tempNum2=$(echo $1 | cut -c 2,3)
  if [[ $1 -gt 99 ]] && [[ $tempNum2 -gt 0 ]] && [[ $(($1%100)) -gt 0 ]]; then
    numToWords+=" and "
  fi
  length=$(lengthOfNumber $1)
  if [[ $length -gt 3 ]] && [[ $(($1%10)) -gt 0 ]] && [[ $(($1%10)) -lt 10 ]]; then
    numToWords+=" and "
  fi
  numToWords+=$(digitToWords $(($1%100)))
  echo "$numToWords"
}
numInWords=$(toWords $num)
echo $numInWords