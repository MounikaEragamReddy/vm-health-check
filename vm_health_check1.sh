#!/bin/bash

# filepath: /path/to/vm_health_check.sh

# Function to calculate CPU usage
get_cpu_usage() {
  # Get the CPU usage as a percentage
  top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | awk -F. '{print $1}'
}

# Function to calculate memory usage
get_memory_usage() {
  # Get memory usage as a percentage
  free | grep Mem | awk '{print ($3/$2) * 100}' | awk -F. '{print $1}'
}

# Function to calculate disk usage
get_disk_usage() {
  # Get disk usage as a percentage
  df / | tail -1 | awk '{print $5}' | sed 's/%//'
}

# Analyze VM health
cpu_usage=$(get_cpu_usage)
memory_usage=$(get_memory_usage)
disk_usage=$(get_disk_usage)

# Determine health status
if [[ $cpu_usage -le 60 && $memory_usage -le 60 && $disk_usage -le 60 ]]; then
  health_status="HEALTHY"
else
  health_status="NOT HEALTHY"
fi

# Output health status
echo "VM Health Status: $health_status"

# Handle 'explain' argument
if [[ $1 == "explain" ]]; then
  echo "Detailed Analysis:"
  echo "CPU Usage: $cpu_usage%"
  echo "Memory Usage: $memory_usage%"
  echo "Disk Usage: $disk_usage%"
  if [[ $health_status == "NOT HEALTHY" ]]; then
    echo "Reason(s):"
    [[ $cpu_usage -gt 60 ]] && echo "- CPU usage exceeds 60%."
    [[ $memory_usage -gt 60 ]] && echo "- Memory usage exceeds 60%."
    [[ $disk_usage -gt 60 ]] && echo "- Disk usage exceeds 60%."
  fi
fi