#!/bin/bash

# ascii-bouncer.sh - A simple ASCII bouncing ball animation
# Author: Zedgge

cols=$(tput cols)
rows=$(tput lines)

x=1
y=1
dx=1
dy=1

delay=0.05

trap "tput cnorm; clear; exit" SIGINT

tput civis 
clear

while true; do
    tput cup 0 0
    clear

    tput cup $y $x
    echo -n "⚽"  

    ((x += dx))
    ((y += dy))

    ((x <= 0 || x >= cols - 1)) && dx=$(( -dx ))
    ((y <= 0 || y >= rows - 1)) && dy=$(( -dy ))

    sleep $delay
done
