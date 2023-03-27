#!/bin/bash

program_name=$1

logfile="logfile.txt"

echo -e "CPU threshold monitor for $program_name running being written to \e]8;;file://$(pwd)/$logfile\a$logfile\e]8;;\a"
echo

echo "CPU threshold monitor for $program_name [$(date '+%Y-%m-%d %H:%M:%S')]:" >> $logfile
echo >> $logfile


while true; do
    top -b -n 1 | grep -m1 $program_name | awk '{printf "%.2f%%\n", $9}' >> logfile.txt

    sleep 60
done
