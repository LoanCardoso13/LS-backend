#!/usr/bin/bash

counter=0
max=13

while [[ $counter -le $max ]]
do
	echo $counter
	((counter++))
done
