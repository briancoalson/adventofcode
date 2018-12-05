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

sum=0

twice=false

count=0

while [[ "$twice" != true ]]; do
	echo $count
	count=$(($count + 1))
	for freq in $frequencies
	do :
		sum=$(($sum + $freq))
		# echo $sum
		# echo $sums
		# echo ${#sums[@]}

		# echo ${sums[@]} | tr ' ' '/n' | sort -u | wc -l
		# if [[ (${#sums[@]}) = ("${sums[@]}" | tr ' ' '/n' | sort -u | wc -l) ]]; then
		# 	echo $sum
		# 	twice=$TRUE
		# 	break
		# fi
		if [[ $sum -gt -1 ]]; then
			formatted_sum="+$sum "
		else
			sums="$sum "
		fi
		
		# echo $formatted_sum
		
		case "$sums" in
			*"$formatted_sum"* ) 
				echo "found!"
				echo $sum
				twice=true;;
		esac

		if [[ $sum -gt -1 ]]; then
			sums="$sums +$sum"
		else
			sums="$sums $sum"
		fi


	# Will work, will also take a million years
		# for i in "${sums[@]}"
		# do :
		# 	if [ "$i" -eq "$sum" ]
		# 	then
		# 		echo $sum
		# 		twice=true
		# 		break
		# 	fi
		# done

		if [[ "$twice" = true ]]; then
			break
		fi

		# sums=("${sums[@]}" "$sum")

	done
done



# echo ${#sums[@]}
