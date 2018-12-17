#!/usr/bin/env bash

# [1518-10-05 00:10] falls asleep
# [1518-07-22 23:53] Guard #1949 begins shift
# [1518-07-06 00:55] wakes up

# https://stackoverflow.com/questions/16831429/when-setting-ifs-to-split-on-newlines-why-is-it-necessary-to-include-a-backspac
IFS=$'\n' sortedInput=$(sort input.txt)

declare -A -i timeAsleep
declare -A -i asleepDuringMinute

# Returns time (in minutes) without a preceding 0
getTime () {
	# lessons learned, parameter expansion https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
	# can expand a string up to some search string using #(string)
	# can get all the text before 1st match using %%(string)
	# both use wildcard expressions like *
	t=${1#*:}
	t=${t%%]*}
	echo ${t#0}
}

for line in $sortedInput; do
	if [[ "$line" == *"Guard"* ]]; then
		ID=${line#*#}
		ID=${ID%%\ *}
		# echo $ID
		currentID=$ID
	fi

	if [[ "$line" == *"falls asleep"* ]]; then
		# asleep=true
		time=$(getTime $line)
	fi

	if [[ "$line" == *"wakes up"* ]]; then

		if [[ $timeAsleep[$ID] == '' ]]; then
			timeAsleep[$ID]=$(($getTime $line - $time))
		else
			timeAsleep[$ID]=$((${timeAsleep[$ID]} + $(getTime $line) - $time ))
		fi

		for (( i = $time; i < $(getTime $line); i++ )); do

			if [[ ${asleepDuringMinute[$ID,$i]} == '' ]]; then
				asleepDuringMinute[$ID,$i]=1
			else
				asleepDuringMinute[$ID,$i]=$((${asleepDuringMinute[$ID,$i]} + 1))
			fi
		done
	fi
done

maxTimeAsleep=0
for id in "${!timeAsleep[@]}"; do
	if [[ ${timeAsleep[$id]} -gt $maxTimeAsleep ]]; then
		maxTimeAsleep=${timeAsleep[$id]}
		sleepyWorker=$id
	fi
done

max=0
for (( i = 0; i < 60; i++ )); do
	if [[ ${asleepDuringMinute[$sleepyWorker,$i]} -gt $max ]]; then
		max=${asleepDuringMinute[$sleepyWorker,$i]}
		minute=$i
	fi
done

echo -e "ID:$sleepyWorker\nMinute: $minute\nAnswer: $(($sleepyWorker * $minute))"


max=0
#Part 2, which guard is asleep most frequently during same minute?
for id_time in "${!asleepDuringMinute[@]}"; do
	if [[ ${asleepDuringMinute[$id_time]} -gt $max ]]; then
		max=${asleepDuringMinute[$id_time]}
		frequent_sleeper=$id_time
	fi
done

echo $frequent_sleeper