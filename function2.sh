#!/bin/bash

sum(){
	sum=0
	for num in "$@";do
		(( sum+=num ))
	done
	echo "the sum is $sum"
}
subtract(){
	first_num=$1
	shift
	result=$first_num
	for num in "$@";do
		(( result-=num ))
	done
	echo "difference is $result"
}
product(){
	result=$1
	shift
	for num in "$@";do
		(( result*=num ))
	done
	echo "product is $result"
}
quotient(){
	result=$1
	shift
	for num in "$@";do
		if (( num==0 ));then
			echo "error: division by zero"
			return
		fi
		(( result/=num ))
	done
	echo "quotient is $result"
}

echo "you are welcome to Ab cal"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiply"
echo "4. Division"
read -p "Enter ur choice(1-4):" choice

read -p "enter the number of numbers (separated by space): " numbers

case $choice in
	1) result=$(sum $numbers);
	operation="Addition";;
	2) result=$(subtract $numbers);
	operation="Subtraction";;
	3) result=$(product $numbers);
        operation="Multiply";;
        4) result=$(quotient $numbers);
        operation="Division";;
	*) echo "invalid choice"; exit 1;;
esac
echo "$operation result: $result"
