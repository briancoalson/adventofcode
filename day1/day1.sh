#!/bin/bash
awk '{ sum += $1 } END { print sum }' $1





#answer=0
#while read num || [[ -n $num ]]; do
#	answer=$(($answer + $num))
#done < $1
#echo $answer
