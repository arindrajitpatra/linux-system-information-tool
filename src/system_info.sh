#!/bin/bash

###############################################################################
# Script Name : system_info.sh
# Description : Displays basic Linux system information.
# Author      : Arindrajit Patra
# Version     : 1.0
###############################################################################

#############################
# Collect System Information
#############################

CURRENT_USER=$(whoami)
HOST_NAME=$(hostname)
OPERATING_SYSTEM=$(uname -o)
KERNEL_VERSION=$(uname -r)
CURRENT_DIRECTORY=$(pwd)
CURRENT_DATE_TIME=$(date)
SYSTEM_UPTIME=$(uptime -p)
LOGGED_IN_USERS=$(who)

DISK_USAGE=$(df -h)

MEMORY_USAGE=$(free -h)

CPU_INFORMATION=$(lscpu)

IP_ADDRESS=$(hostname -I)

#############################
# Print Report
#############################

echo "======================================================="
echo "                 SYSTEM REPORT"
echo "======================================================="
echo

echo "Current User      : $CURRENT_USER"
echo "Hostname          : $HOST_NAME"
echo "Operating System  : $OPERATING_SYSTEM"
echo "Kernel Version    : $KERNEL_VERSION"
echo "Current Directory : $CURRENT_DIRECTORY"
echo "Current Date Time : $CURRENT_DATE_TIME"
echo "System Uptime     : $SYSTEM_UPTIME"
echo "Logged-in Users   :"
echo "$LOGGED_IN_USERS"

echo
echo "==================== DISK ===================="
echo
echo "$DISK_USAGE"

echo
echo "=================== MEMORY ==================="
echo
echo "$MEMORY_USAGE"

echo
echo "==================== CPU ====================="
echo
echo "$CPU_INFORMATION"

echo
echo "================== NETWORK ==================="
echo
echo "IP Address : $IP_ADDRESS"

echo
echo "======================================================="
echo "             End of System Report"
echo "======================================================="