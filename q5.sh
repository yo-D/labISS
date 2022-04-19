#!/bin/bash

next(){
    if [ "$1" == "Z" ]
    then
        echo "A"
        return
    fi
    
    if [ "$1" == "z" ]
    then
        echo "a"
        return
    fi
    
    ascii=`printf "%d" \'$1`
    echo $((ascii + 1)) | awk '{printf("%c",$1)}'
}


read var

reversed=`echo $var | rev`
echo $reversed

for (( i=0; i<${#reversed}; i++ )) 
do
    toPrint=`next "${reversed:$i:1}"`
    echo -n $toPrint
done

echo

length=${#var}
halfLength=$((length / 2))
halfString=${var:0:$halfLength}
halfString=`echo $halfString | rev`
echo -n $halfString
rest=${var:$halfLength:$halfLength}
echo -n $rest
echo






