#!/bin/bash
name=Ray
game=Number\ Guessing
echo "Hello, $name! Welcome to play $game."

# 0) 生成随机数字
number=$(shuf -i 1-10 -n 1)
echo "The ground truth is: $number"

# 开始游戏
while true
do

# 1) 随机猜测数字
echo "Please guess a number from 1 to 10:"
read guess

# 2) 比较数字大小
if [[ $guess -eq $number ]]; then
	echo "You are right!"
	echo "Continue to play? (y/n)"
	read choice
	if [[ $choice = 'y' || 'Y' ]]; then
		number=$((RANDOM % 10 + 1))
		echo ""
		echo "The ground truth is: $number"
		continue
	else
		break
	fi

elif [[ $guess -lt $number ]]; then
	echo "Your guess is small."
else
	echo "Your guess is large."
fi

done

