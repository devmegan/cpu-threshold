#!/bin/bash

program_name=$1

echo -e "CPU threshold monitor for $program_name running being written to \e]8;;file://$(pwd)/logfile.txt\alogfile.txt\e]8;;\a"
echo

echo "CPU threshold monitor for $program_name [$(date '+%Y-%m-%d %H:%M:%S')]:" >> logfile.txt
echo >> logfile.txt


while true; do
    echo "$(top -b -n1 | grep -m1 $program_name | awk '{printf "%.2f%%\n", $9}')"

    sleep 60
done