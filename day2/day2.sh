#!/usr/bin/env bash

#part 1
boxIDs=$(cat input.txt)

printf '%s\n' "${frequencies[@]}"

twice=0
thrice=0

for id in $boxIDs; do
	tmp=$(echo $id | fold -w1 | sort | uniq -c)
	twice=$(($twice + $(echo $tmp | grep 2 | wc -l)))
	thrice=$(($thrice + $(echo $tmp | grep 3 | wc -l)))
done

echo $(($twice * $thrice))

#break the line up into column then do sort | uniq -c