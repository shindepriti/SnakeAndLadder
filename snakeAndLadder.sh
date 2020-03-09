#!/bin/bash -x
echo "WEL-COME To Snake And Ladder Game"

#variable
position=0

#CONSTANTS
NOPLAY=0
LADDER=1
SNAKE=2

randomVariable=$((RANDOM%6+1))

function checkOptions(){
	case $((RANDOM%3)) in 
		$NOPLAY) position=0 ;;
		$LADDER) position=$((position + $randomVariable)) ;;
		$SNAKE) position=$((position - $randomVariable)) ;;
	esac
}
checkOptions
