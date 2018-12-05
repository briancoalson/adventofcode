#!/bin/bash
awk '{ sum += $1 } END { print sum }' $1

# read -d '/n' -a frequencies < $1
# this is fucked, but I don't know why, seems better than cat into an array
# echo ${#frequencies[@]}

# num_frequencies=$(cat $1 | wc -l)
# echo $num_frequencies

# twice=$FALSE
# # while !($twice); do
# 	for freq in $frequencies; 
# 	do
# 		echo $freq
# 	done
# # done


frequencies=$(cat $1)

declare -a sums

sum=0

for freq in $frequencies
do :
	sum=$(($sum + $freq))
	echo $sum

#WTF?!  Why does $frequencies work but not $sums?
	for i in "${sums[@]}"
	do :
		if [[ $i -eq $sum ]]
		then
			echo "help!"
		fi
	done

	sums=("${sums[@]}" "$sum")

done

echo ${#sums[@]}
