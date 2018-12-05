#!/usr/bin/env bash

#part 1
boxIDs=$(cat input.txt)

# twice=0
# thrice=0

# for id in $boxIDs; do
# 	tmp=$(echo $id | fold -w1 | sort | uniq -c)
# 	twice=$(($twice + $(echo $tmp | grep 2 | wc -l)))
# 	thrice=$(($thrice + $(echo $tmp | grep 3 | wc -l)))
# done

# echo $(($twice * $thrice))


#part 2
#assuming same length strings, probably would want error handling
character_difference() {

	diff=0

	for (( i = 0; i < ${#1}; i++ )); do
		if [[ ${1:$i:1} != ${2:$i:1} ]]; then
			diff=$(($diff + 1))
		fi
	done

	echo $diff
}

print_same_characters() {
	same_characters=""
	for (( i = 0; i < ${#1}; i++ )); do
		if [[ ${1:$i:1} == ${2:$i:1} ]]; then
			same_characters="$same_characters${1:$i:1}"
		fi
	done
	echo $same_characters
}

for id in $boxIDs; do
	for id2 in $boxIDs; do
		if [[ $(character_difference $id $id2) -eq 1 ]]; then
			echo "Strings that are off by 1 found!  Here are the same characters:"
			print_same_characters $id $id2
			break 2
		fi
	done
done