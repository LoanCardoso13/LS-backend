#!/usr/bin/bash

counter=0
max=13

until [[ $counter -gt $max ]]
do
	echo $counter
	((counter++))
done
