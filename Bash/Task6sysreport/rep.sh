#!/bin/bash

REPORT_FILE="system_report.txt"

# Overwrite the file
echo "===== System Report =====" > "$REPORT_FILE"

echo "Current date and time      : $(date)" >> "$REPORT_FILE"
echo "Current user        : $(whoami)" >> "$REPORT_FILE"
echo "Hostname            : $(hostname)" >> "$REPORT_FILE"
echo "Internal IP address : $(hostname -I | awk '{print $1}')" >> "$REPORT_FILE"
echo "External IP address : $(curl -s ifconfig.me || echo 'Unavailable')" >> "$REPORT_FILE"
echo "Distribution        : $(source /etc/os-release && echo $NAME $VERSION)" >> "$REPORT_FILE"
echo "System Uptime       : $(uptime -p)" >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"

echo "Disk Usage on '/'   : Used: $(df -h / | awk 'NR==2 {print $3}'), Free: $(df -h / | awk 'NR==2 {print $4}')" >> "$REPORT_FILE"
echo "RAM Info            : Total: $(free -h | awk '/^Mem:/ {print $2}'), Free: $(free -h | awk '/^Mem:/ {print $4}')" >> "$REPORT_FILE"
echo "CPU Cores           : $(nproc)" >> "$REPORT_FILE"
echo "CPU mhz            : $(lscpu | grep "CPU MHz"

echo "" >> "$REPORT_FILE"

echo "=========================" >> "$REPORT_FILE"

echo "System report saved to '$REPORT_FILE'"
