#!/bin/bash

read input
input=`echo $input | sed "s/","/ /g"`
read -a arr <<< "$input"
length=`echo ${#arr[*]}`

for (( i=1; i<=$length; i++ ))
do
    for (( j=0; j< $(($length -1)); j++ ))
    do
        if [ "${arr[$j]}" -gt "${arr[$(($j + 1))]}" ]
        then
            temp=${arr[$j]}
            arr[$j]=${arr[$(($j+1))]}
            arr[$(($j+1))]=$temp
        fi
    done
done

echo ${arr[*]} 
