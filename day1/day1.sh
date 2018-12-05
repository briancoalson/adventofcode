#!/usr/bin/env bash
#Part 1
echo "Sum of frequencies:"
awk '{ sum += $1 } END { print sum }' $1

#Part 2
echo "First repeated frequency:"
frequencies=$(cat $1)

sum=0
twice=false
declare -A sums

while [[ "$twice" != true ]]; do
	for freq in $frequencies
	do :
		sum=$(($sum + $freq))

		if [[ -n "${sums[$sum]}" ]]; then
			echo $sum
			twice=true
			break
		fi

		sums[$sum]+="1"
	done
done