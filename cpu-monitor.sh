#!/bin/bash

usage="Usage: $0 <program_name:str> [threshold:flt]"

if [[ $# -lt 1 ]]; then
    echo "$0 requires at least 1 argument"
    echo
    echo $usage

    exit 1
fi

if ! pgrep "$1" > /dev/null; then
  echo "Error: Can't find an active process named '$1'"

  exit 1
fi

if [[ -n "$2" ]] && (( $(echo "$2 <= 0.009" | bc -l) )); then
    echo "Error: Threshold value must be at least 0.01"
    echo
    echo $usage

    exit 1
fi

program_name=$1
threshold=${2:-100}
logfile="logfile.txt"

if [ -e "$logfile" ]; then
    echo "-----" >> $logfile
    echo >> $logfile
fi

echo -e "CPU threshold monitor for $program_name running being written to \e]8;;file://$(pwd)/$logfile\a$logfile\e]8;;\a"
echo "Usage will be logged where it exceeds $threshold% for a minimum of 5 seconds"

echo "CPU threshold monitor for $program_name [$(date '+%Y-%m-%d %H:%M:%S')]:" >> $logfile
echo "Usage will be logged where it exceeds $threshold% for a minimum of 5 seconds" >> $logfile
echo >> $logfile

count=0
over_threshold=false

while true; do
    cpu_usage=$(top -b -n 1 | grep -m1 $program_name | awk '{printf $9}')

    if (( $(echo "$cpu_usage >= $threshold" | bc -l) )); then
        ((count++))

        if (( $count % 5 == 0 && !$over_threshold )); then
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] CPU usage over $threshold% for more than $count seconds" >> logfile.txt
            over_threshold=true
        fi
    else
        count=0

        if $over_threshold; then
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] CPU usage dropped below $threshold%" >> logfile.txt
            echo >> logfile.txt
            over_threshold=false
        fi
    fi

    sleep 1
done
