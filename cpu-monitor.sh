#!/bin/bash

program_name=$1

logfile="logfile.txt"

if [ -e "$logfile" ]; then
    echo "-----" >> $logfile
    echo >> $logfile
fi

echo -e "CPU threshold monitor for $program_name running being written to \e]8;;file://$(pwd)/$logfile\a$logfile\e]8;;\a"

echo "CPU threshold monitor for $program_name [$(date '+%Y-%m-%d %H:%M:%S')]:" >> $logfile
echo >> $logfile

count=0
threshold=100
over_threshold=false

for (( ; ; )); do
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
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] CPU usage dropped below 100%" >> logfile.txt
            echo >> logfile.txt
            over_threshold=false
        fi
    fi

    sleep 1
done