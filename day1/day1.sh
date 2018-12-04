nums=$(cat $1)

answer=0

for num in $nums
do
	answer=$(($answer + $num))
done

echo $answer
