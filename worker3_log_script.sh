#!/bin/bash

CURRENT_TIME=$(date +"%Y%m%d_%H%M%S")

LOG_FILE="/root/log/${CURRENT_TIME}_system_usage_worker3.log"

# Get memory usage and append to log file
free -h >> "$LOG_FILE"

# Get CPU usage and append to log file
top -bn1 | grep "Cpu(s)" >> "$LOG_FILE"

# Securely copy the log file to the remote server
scp "$LOG_FILE" storage@172.21.0.7:/home/storage/log/worker3/

# Optionally, remove the local log file after it's been copied
rm "$LOG_FILE"
