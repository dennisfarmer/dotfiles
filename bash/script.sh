#!/usr/bin/env bash

# bash cookbook 2nd edition O'REILLY
# if list; then list; [ elif list; then; ] ... [ else list; ] fi
# test operators: pg 600

# tests a string to see if it has any length
#VAR="$1"
#if [ -n "$VAR" ]
#then
	#echo has text
#else
	#echo zero length
#fi
#if [ -z "$VAR" ]
#then
	#echo zero length
#else
	#echo has text
#fi


VAR1=" 05 "
VAR2="5"

printf "%s" "do they -eq as equal? "
if [ "$VAR1" -eq "$VAR2" ]
then
	echo YES
else
	echo NO
fi

printf "%s" "do they = as equal? "
if [ "$VAR1" = "$VAR2" ]
then
	echo YES
else
	echo NO
fi
