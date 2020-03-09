#!/bin/bash -x 
echo "***Wel-Come TO Snake And Laddder Game***"

declare -A playerPositions
#variable
position=0
dieCount=0
player=1

#CONSTANTS
MAX_POSITION=100
START_POSITION=0
NO_PLAY=1
LADDER=2
SNAKE=3	

function checksForOption(){
#repeate player till winning position
while [[ $position -ne $MAX_POSITION ]]
do
		playerMoves
		randomVariable=$((RANDOM%6+1))		
		case $((RANDOM%3+1)) in
		$NO_PLAY)
			position=$position ;;
		$LADDER)
			position=$((position+randomVariable)) ;;
		$SNAKE)
			position=$((position-randomVariable)) ;;
		esac
		getExactPosition
		playerPositions[$player]=$position
		((dieCount++))			

done
	echo "player$player is Win"
}

function getExactPosition() {
# in case player position move below 0 then restart from 0
if [[ $position -lt $START_POSITION ]]
then
	position=0
fi
# case if player move above winning position 100
if [[ $position -gt $MAX_POSITION ]]
then
	position=$((position-randomVariable))
fi
}

function playerMoves(){
if [[ $player -eq 1 ]]
then
	player=2
else
	player=1
fi
}
#game Start Here
checksForOption
