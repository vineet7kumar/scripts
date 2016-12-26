#!/bin/bash

# This script is modified from the original one in the accepted answer
# at http://askubuntu.com/questions/766110/adjusting-an-nvidia-gpus-fan-curve


nvidia-settings -a [gpu:0]/GPUFanControlState=1 > /dev/null

while true
do
	curr_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
	if (( $curr_temp > 75 )); then
		notify-send "Warning: GPU running at $curr_temp C"
	fi

	target_speed=$(( $curr_temp ** 2 / 50 ))
	target_speed=$(( $target_speed < 100 ? $target_speed : 100 ))

	nvidia-settings -a [fan:0]/GPUTargetFanSpeed=$target_speed > /dev/null

	sleep 7
done
