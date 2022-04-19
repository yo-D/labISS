#!/bin/bash

# quotes.txt must be in the same folder as this shell script

cp quotes.txt final
sed '/^$/d' final > tmp && cat tmp > final && rm tmp # remove blank lines from quotes.txt
num_lines=`wc -l < final`

for (( i=1; i<=$num_lines; i++ ))
do
    echo Now processing $i out of $num_lines, please wait
    for (( j=$(($i + 1)); j<=$num_lines; j++ ))
    do
        firstLine=`head -$i final | tail -1`
        secondLine=`head -$j final | tail -1`
        if [[ "$firstLine" = "$secondLine" ]]
        then
            sed -i ""$j"s/.*/placeholder/" final
        fi
    done
done

echo
echo

sed -i '/placeholder/d' final
cat final
rm final
