#!/bin/bash

###############################################################################
# Script Name : system_info.sh
# Description : Displays useful Linux system information.
# Author      : Arindrajit Patra
# Version     : 2.0
###############################################################################

#############################
# Color Definitions
#############################

GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[1;33m"
RESET="\033[0m"

#############################
# Utility Function
#############################

# Check whether a command exists on the system.
check_command() {
    command -v "$1" >/dev/null 2>&1
}

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

if check_command free; then
    MEMORY_USAGE=$(free -h)
else
    MEMORY_USAGE="Command 'free' not found."
fi

if check_command lscpu; then
    CPU_INFORMATION=$(lscpu)
else
    CPU_INFORMATION="Command 'lscpu' not found."
fi

if check_command hostname; then
    IP_ADDRESS=$(hostname -I)
else
    IP_ADDRESS="IP address unavailable."
fi

#############################
# Printing Functions
#############################

print_header() {
    echo -e "${GREEN}========================================================${RESET}"
    echo -e "${GREEN}                 LINUX SYSTEM REPORT                     ${RESET}"
    echo -e "${GREEN}========================================================${RESET}"
    echo
}

print_system_info() {
    printf "%-22s : %s\n" "Current User" "$CURRENT_USER"
    printf "%-22s : %s\n" "Hostname" "$HOST_NAME"
    printf "%-22s : %s\n" "Operating System" "$OPERATING_SYSTEM"
    printf "%-22s : %s\n" "Kernel Version" "$KERNEL_VERSION"
    printf "%-22s : %s\n" "Current Directory" "$CURRENT_DIRECTORY"
    printf "%-22s : %s\n" "Current Date & Time" "$CURRENT_DATE_TIME"
    printf "%-22s : %s\n" "System Uptime" "$SYSTEM_UPTIME"

    echo
    echo "Logged-in Users:"
    echo "$LOGGED_IN_USERS"
}

print_disk_info() {
    echo
    echo -e "${BLUE}====================== DISK ======================${RESET}"
    echo "$DISK_USAGE"
}

print_memory_info() {
    echo
    echo -e "${BLUE}===================== MEMORY =====================${RESET}"
    echo "$MEMORY_USAGE"
}

print_cpu_info() {
    echo
    echo -e "${BLUE}======================= CPU ======================${RESET}"
    echo "$CPU_INFORMATION"
}

print_network_info() {
    echo
    echo -e "${BLUE}===================== NETWORK ====================${RESET}"
    printf "%-22s : %s\n" "IP Address" "$IP_ADDRESS"
}

print_footer() {
    echo
    echo -e "${YELLOW}Report generated successfully.${RESET}"
    echo -e "${GREEN}========================================================${RESET}"
}

#############################
# Main Function
#############################

main() {
    print_header
    print_system_info
    print_disk_info
    print_memory_info
    print_cpu_info
    print_network_info
    print_footer
}

main