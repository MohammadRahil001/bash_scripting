#!/bin/bash

#print text on terminal - echo
echo "Hello Bro!"


#variables

first_var=10 
sec_var="string"
third_var=10.5

declare -i fourth_var=999 #store  integer
declare -r fifth_var="const" #constant variable
readonly constant="constant value" # also constant variable

#print variables values
echo "first_var store $first_var"
echo "sec_var store $sec_var"
echo "third_var store $third_var"
echo "forth_var store $fourth_var"
echo "fifth_var store $fifth_var"


#Environment variables
env | head -2 #print environment variables 2 rows
echo $HISTSIZE #print give env varible
echo $PATH

#create env variables
NAME="RAHIL" #create a variable
export NAME #make variable permanent
echo $NAME



#conditional statements

#if-else
x=1
if [[ $x -eq 1 ]]
then
	echo "yes x equal to 1"
else
	echo "no x not equal to 1"
fi # finish if statement

#if-elif-else
mark=75
if [[ mark -gt 90 ]]
then
	echo "pass with 1st division"
	echo "great!!!"
elif [[ mark -gt 60 ]]
then
	echo "pass with 2nd division"
elif [[ mark -gt 40 ]]
then
	echo "pass with 3rd division"
else
	echo "failed"
fi #finish here!

#multiline comments 
<<comment
--some numerical operators--
1 -eq -- equal
2 -ne -- not equal
3 -gt -- greater than
4 -ge -- greater than or equal to
5 -lt -- less than
6 -le -- less than or equal to
7 -e file.txt -- check file exit
8 -z variable -- check varible exit
comment

<<comment
--some sring operators--
1 = -- equal
2 == -- equal
3 -z -- is null
4 -n -- is not null
5 < -- is less than in ascii 
6 > -- is grester than in ascii
comment

<<comment
--logical operators--
1 && -- AND
2 || -- OR
3 ! -- NOT
comment

<<comment
--boolean operators--
1 $file.txt -- ture
2 !file.txt -- false
comment

#Inline if statement
[[ $x = 1 ]] && echo "yes x is 1" || echo "x is not 1"
[[ $NAME = "RAHIL" ]] && echo "$(whoami) is user" || echo "user is not rahil"


#Case statement
weather="sunny"

case $weather in

	sunny )
		echo "sunny weather";;
	rainy )
		echo "rainy";;
	cloudy )
		echo "cloudy";;
esac #case:start esac:end

choice=1
case $choice in
	1 )
		echo "it 1 do these stuff"
		echo "then do this";;
	2 )
		echo "it is 2 do that";;
	3 )
		echo "it is 3 do it ";;
	* )
		echo "else case not match then do this";;
esac #case end here

#Loops
#for loop : method 1
for x in 1 2 3
do
	echo hello:$x
done

#method 2
for i in {1..10}
do
	echo "loop no : $i"
done

#odd loop {start..end..jump}
for j in {1..20..2}
do
	echo $j
done

#infinte for loop : for ((;;))

#while loop :

#infite loop
<<comment
while true
do
	#do the job
	pass
done
comment

y=0
while [[ y -le 10 ]]
do
	echo $y
	((y++))

done

#Functions in bash

greet(){
	
	echo "Enter your name : "
	read name # ask for user input & store in var name
	echo "Hello $name"
}
greet #calling greet function

sum(){
	read -p "enter first number : " num1
	read -p "enter second number : " num2
	let add=$num1+$num2 # let use to define it is arithmetic opretion
	echo "$num1 + $num2 = $add"
}
sum # calling sum function

#parameters in functions
parameters_func(){
	local first_var="local variable"
	echo "this is $first_var first_var"
	echo "this is parameter one $1"
	echo "this is paramenter two $2"
	echo "all parameters $@"
	echo "total parameters $#"
}
parameters_func first_parameter second_parmeter

<<comment
--exit codes--
exit 0 -- Exit script successfully
exit 1 -- Exit script unsuccsessfully

echo $? -- give last command status code --> 0:if success 1:if not success

!! -- run last command
!$ -- last argument of last command
1> -- redirect standerd output into file
2> -- redirect only error to a file
2>&1 > file.txt redirect both output & error to file.txt
comment



#array in bash
arr=("1" "2" "3" "4") #array creation 
echo "${arr[0]}" # get 0 index element
arr2=("a" "b" "c" "d")
echo "${arr2[@]}" # get all elements
echo "${#arr[@]}" # get length of array
echo "${!arr[@]}" #get indice of array 0 1 2 3 ....

