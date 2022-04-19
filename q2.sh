#!/bin/bash

touch speech.txt

num_lines=`wc -l < quotes.txt`

for (( i=1; i<=$num_lines; i++ ))
do
    line=`head -$i quotes.txt | tail -1`
    author=`echo $line | sed "s/.*~//"`
    quote=`echo $line | sed "s/~.*//"`
    echo "$author once said,\"$quote\"" >> speech.txt
    
done

