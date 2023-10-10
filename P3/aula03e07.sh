#!/bin/bash
# Calculate the sum of a series of numbers.
SCORE="0"
SUM="0"
MEDIUM="0"
N="0"
while true; do
	echo -n "Enter your score [0-10] ('q' to quit) ('r' to restart): "
	read SCORE;
	if (("$SCORE" < "0")) || (("$SCORE" > "10")); then
		echo "Try again: "
	elif [[ "$SCORE" == "q" ]]; then
		echo "Sum: $SUM."
		echo "Medium: $MEDIUM."
		break
	elif [[ "$SCORE" == "r" ]]; then
		N="0"
		MEDIUM="0"
		SUM="0"
		echo "Game restarted."
	else
		N=$((N+1))
		SUM=$((SUM + SCORE))
		MEDIUM=$((SUM / N)) 
	fi
done
echo "Exiting."
