#!/usr/bin/env bash

#stop trying to optimize this, but check out $ echo 'foo.c:41:switch (color) {' | { IFS=: read file line text && echo "$file | $line | $text"; }. Maybe put this in a while loop to read the whole file into array values?
#also might want to get rid of all the cuts and use regex instead

starting_points=$(cut -d" " -f3 input.txt | cut -d: -f1)

max_right_edge=$(printf '%s\n' "${starting_points[@]}" | cut -d, -f1 | sort -n | tail -n1)
max_bottom_edge=$(printf '%s\n' "${starting_points[@]}" | cut -d, -f2 | sort -n | tail -n1)

#get the size dimentions using IFS=x read width height or:
#width=${sizes%x*}
#height=${sizes#*x}
#https://stackoverflow.com/questions/10520623/how-to-split-one-string-into-multiple-variables-in-bash-shell
sizes=$(cut -d" " -f4 input.txt)

max_width=$(printf '%s\n' "${sizes[@]}" | cut -dx -f1 | sort -n | tail -n1)
max_height=$(printf '%s\n' "${sizes[@]}" | cut -dx -f2 | sort -n | tail -n1)

cloth_width=$(($max_right_edge + $max_width))
cloth_height=$(($max_bottom_edge + $max_height))

echo $cloth_width
echo $cloth_height

for (( i = 0; i < $((cloth_height+1)); i++ )); do
	cloth[$i]=$(printf ".%.0s" $(seq 1 $cloth_width))
done

#let's mark up the cloth for cutting, index being used for height, in case we want to print out the results

starting_left_edge0=808
width0=12
starting_top_edge0=550
height0=22

echo "${cloth[@]:$starting_top_edge0:$height0}"