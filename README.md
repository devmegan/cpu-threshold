# [CPU Threshold Montior](https://github.com/devmegan/cpu-threshold)

This is a bash script that monitors the CPU usage of a specified process. It logs usage to a logfile if it exceeds a threshold for a minimum of 5 seconds.

I wrote it because teams is often exceeding 100% or 200% for long periods of time, causing my linux machine to take off.

- [Usage](#usage)
- [Example logfile](#example-logfile)
- [Releases](#releases)
    - [v1](#v1)

## Usage

To run the script use:

`$ ./cpu-monitor.sh <program_name:str> [threshold:flt]`

Where:
- `<program_name:str>` : name of the program to monitor
- `[threshold:flt]` : optional threshold value for CPU usage (default value is 100, miminum value is 0.01)

## Example logfile

Here's an example of the logfile it generates. A dynamic link to the logfile is echoed to the terminal when the script is executed.

```
logfile.txt

CPU threshold monitor for teams-for-linux [2023-03-28 12:02:01]:
Usage will be logged where it exceeds 100% for a minimum of 5 seconds

[2023-03-28 12:02:09] CPU usage over 100% for more than 5 seconds
[2023-03-28 12:02:14] CPU usage over 100% for more than 10 seconds
[2023-03-28 12:02:20] CPU usage over 100% for more than 15 seconds
[2023-03-28 12:02:26] CPU usage over 100% for more than 20 seconds
[2023-03-28 12:02:32] CPU usage dropped below 100%

[2023-03-28 12:04:42] CPU usage over 100% for more than 5 seconds
[2023-03-28 12:04:47] CPU usage over 100% for more than 10 seconds
[2023-03-28 12:04:52] CPU usage dropped below 100%

```

## Releases

### v1

- [v1.0.0 CPU Threshold Monitor Initial Script Release](https://github.com/devmegan/cpu-threshold/releases/tag/v.1.0.0) (23-03-28)
