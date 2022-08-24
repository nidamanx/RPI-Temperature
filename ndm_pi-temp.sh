#!/usr/bin/env bash

# ----------------------------------------------------------------
# Script: ndm_pi-temp.sh
# Purpose: Display the ARM CPU and GPU temperature of Raspberry Pi
# ----------------------------------------------------------------

header="$(date) @ $(hostname)"
count=${#header}

f_print-header() {
	printf "%0.s-" $(seq 1 $count); echo
	echo $header
	printf "%0.s-" $(seq 1 $count); echo
}

f_print_temp() {
	cpu=$(</sys/class/thermal/thermal_zone0/temp)
	echo "GPU => $(/opt/vc/bin/vcgencmd measure_temp | grep -o -E '[[:digit:]].*')"
	printf "CPU => %.1f'C" $((cpu/1000)); echo
}

f_print-footer() {
	printf "%0.s-" $(seq 1 $count); echo
}

main() {
	f_print-header
	f_print_temp
	f_print-footer
	exit 0
}

main
