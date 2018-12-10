#!/usr/bin/env bash

#1 @ 808,550: 12x22

declare -A -i cloth
count=0

while IFS='' read -r line || [[ -n "$line" ]]; do

	# line=$(cat input.txt | tail -n1)

	echo $count
	count=$(($count+1))

	IFS=' ' read id at start size <<< $line
	IFS=',' read left top <<< $start
	top=${top::-1}
	IFS='x' read width height <<< $size

	for (( x = $left; x < $(($left+$width)); x++ )); do
		for (( y = $top; y < $(($top+$height)); y++ )); do
			if [[ ${cloth[$x,$y]} == '' ]]; then
				cloth[$x,$y]=1
			else
				cloth[$x,$y]=$((${cloth[$x,$y]} + 1))
			fi
		done
	done
    
done < input.txt

answer=0
for claim in "${cloth[@]}"; do
	if [[ $claim -gt 1 ]]; then
		answer=$(($answer+1))
	fi
done

echo $answer