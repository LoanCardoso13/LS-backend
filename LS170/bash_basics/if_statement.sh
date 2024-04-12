#!/usr/bin/bash

string1='Simpsons'
string2='Meme'

if [[ $string1 = $string2 ]]
then
	echo $string1 is equal to $string2
else
	echo $string1 is not equal to $string2
fi

if [[ -f ./hello_world.sh ]]
then
	echo 'File does exist'
fi
