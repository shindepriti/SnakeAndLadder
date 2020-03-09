#!/bin/bash -x
echo "WEL-COME To Snake And Ladder Game"

declare -A playerPosition

#variable
position=0
dieCount=0
player=1

#CONSTANTS
START_POSITION=0
MAX_POSITION=10
NOPLAY=0
LADDER=1
SNAKE=2

function getExactPosition(){
	#if position of player move below zero then restart from zero  
	if [ $position -lt $START_POSITION ]
	then
		position=$START_POSITION
	fi
	#ensure player position not greater than 100
	if [ $position -gt $MAX_POSITION ]
	then
		position=$((position-randomVariable))
	fi
}

function switchPlayer(){
	if [ $player -eq 2 ]
	then
		player=1
	else
		player=2
	fi	
}

function playWin(){
	while [[ $position -ne $MAX_POSITION ]]
	do
		checkOptions
	done
	echo "player $player Win	"
}

function checkOptions(){
	switchPlayer
	randomVariable=$((RANDOM%6+1))
	case $((RANDOM%3)) in 
		$NOPLAY) position=0 ;;
		$LADDER) position=$((position + $randomVariable)) ;;
		$SNAKE) position=$((position - $randomVariable)) ;;
	esac
	getExactPosition
	playerPosition[$player]=$position,$dieCount
	((dieCount++))
}

#Game Start here
playWin
