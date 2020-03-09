#!/bin/bash -x
echo "WEL-COME To Snake And Ladder Game"

declare -A playerPosition

#variable
position=0
dieCount=0

#CONSTANTS
START_POSITION=0
MAX_POSITION=100
NOPLAY=0
LADDER=1
SNAKE=2

function getExactPosition(){
	#if position of player move below zero then restart from zero  
	if [ $position -lt $START_POSITION ]
	then
		position=$START_POSITION
	fi
	if [ $position -gt $MAX_POSITION ]
	then
		position=$((position-randomVariable))
	fi
}

function checkOptions(){
	while [[ $position -lt $MAX_POSITION ]]
	do
		randomVariable=$((RANDOM%6+1))
		((dieCount++))
		case $((RANDOM%3)) in 
			$NOPLAY) position=0 ;;
			$LADDER) position=$((position + $randomVariable)) ;;
			$SNAKE) position=$((position - $randomVariable)) ;;
		esac
		getExactPosition
		playerPosition[$dieCount]=$position
	done
}
checkOptions
