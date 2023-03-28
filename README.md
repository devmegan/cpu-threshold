# CPU Montior

This is a bash script that monitors the CPU usage of a specified process. It logs usage to a logfile if it exceeds a threshold for a minimum of 5 seconds.

I wrote it because teams is often exceeding 100% or 200% for long periods of time, causing my linux machine to take off.

## Usage

To run the script use:

`$ ./cpu-monitor.sh <program_name:str> [threshold:flt]`

Where:
- `<program_name:str>` : name of the program to monitor
- `[threshold:flt]` : optional threshold value for CPU usage (default value is 100, miminum value is 0.01)