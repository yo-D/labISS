#!/bin/bash

cp $1 workfile

num_lines=`wc -l < $1`
fsize_bytes=`stat --printf="%s\n" $1`
num_words=`wc -w < $1`
echo This file has $fsize_bytes bytes
echo This file has $num_lines lines
echo This file has $num_words words
echo
echo

for (( i=1; i<=$num_lines; i++ ))
do
    line=`head -$i $1 | tail -1`
    num_words=`echo $line | wc -w `
    echo "Line Number $i : $num_words words"
done


echo
echo
sed -i "s/ /\n/g" workfile #each word on a new line
sed -i "s/[^a-zA-Z']//g" workfile #remove nonletters
sed '/^$/d' workfile > tmp && cat tmp > workfile && rm tmp #remove blank lines
cp workfile wordlist
sed '/^$/d' wordlist > tmp && cat tmp > wordlist && rm tmp #remove blank lines


num_lines_wordlist=`wc -l < wordlist`


for (( i=1; i<=$num_lines_wordlist; i++ ))
do
    for (( j=$(($i + 1)); j<=$num_lines_wordlist; j++ ))
    do
        firstLine=`head -$i wordlist | tail -1`
        secondLine=`head -$j wordlist | tail -1`
        
        if [[ "$firstLine" = "$secondLine" ]]
        then
            sed -i ""$j"s/.*/placeholder/" wordlist
        fi
    done
done

sed -i '/placeholder/d' wordlist

num_lines_wordlist=`wc -l < wordlist`

for (( i=1; i<=$num_lines_wordlist; i++ ))
do
    word=`head -$i wordlist | tail -1`
    num_words=`grep -cw $word workfile`
    echo "$word : $num_words" 
done

rm workfile wordlist
