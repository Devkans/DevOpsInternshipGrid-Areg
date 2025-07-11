#!/bin/bash

# Output file
REPORT_FILE="system_report.txt"

# Collect data
current_datetime=$(date)
current_user=$(whoami)
hostname=$(hostname)
internal_ip=$(hostname -I | awk '{print $1}')
external_ip=$(curl -s ifconfig.me || echo "Unavailable")
distro=$(source /etc/os-release && echo "$NAME $VERSION")
uptime=$(uptime -p)
disk_usage=$(df -h / | awk 'NR==2 {print "Used: "$3", Free: "$4}')
ram_info=$(free -g | awk '/^Mem:/ {print "Total: "$2" GB, Free: "$4" GB"}')
cpu_cores=$(nproc)

# Generate report
cat <<EOF > "$REPORT_FILE"
===== System Report =====

Date and Time       : $current_datetime
Current User        : $current_user
Hostname            : $hostname
Internal IP Address : $internal_ip
External IP Address : $external_ip
Distribution        : $distro
System Uptime       : $uptime

Disk Usage on '/'   : $disk_usage
RAM Info            : $ram_info

CPU Cores           : $cpu_cores

=========================
EOF

echo "System report saved to '$REPORT_FILE'"