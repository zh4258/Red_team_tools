#!/bin/bash
while [ true ]
do
	sleep 1s
	kill $(pidof -s qterminal)
done
