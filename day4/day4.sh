#!/usr/bin/env bash

# https://stackoverflow.com/questions/16831429/when-setting-ifs-to-split-on-newlines-why-is-it-necessary-to-include-a-backspac
IFS=$'\n' sortedInput=$(sort input.txt)

# echo $sortedInput

for line in $sortedInput; do
	echo $line
done