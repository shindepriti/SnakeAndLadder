#!/bin/bash -x
echo "WEL-COME To Snake And Ladder Game"

#variable
position=0

#CONSTANTS
MAX_POSITION=100
NOPLAY=0
LADDER=1
SNAKE=2

randomVariable=$((RANDOM%6+1))

function checkOptions(){
	while [[ $position -lt $MAX_POSITION ]]
	do
		case $((RANDOM%3)) in 
			$NOPLAY) position=0 ;;
			$LADDER) position=$((position + $randomVariable)) ;;
			$SNAKE) position=$((position - $randomVariable)) ;;
		esac
		#if position of player move below zero then restart from zero  
		if [ $position -lt 0 ]
		then
			position=0
		fi

	done
}
checkOptions
