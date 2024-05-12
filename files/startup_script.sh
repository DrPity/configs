#!/bin/bash


# Kill wireguard
WIREGUARD_CONFIG="/Users/themachine1337/Workspace/01_config/AirVPN_wg/Europe.conf"
sudo wg-quick down $WIREGUARD_CONFIG
# Set DNS servers for Wi-Fi to empty
sudo networksetup -setdnsservers Wi-Fi "Empty"


if [ $? -eq 0 ]; then
    echo "DNS servers for Wi-Fi set to empty"
else
    echo "Error setting DNS servers for Wi-Fi."
fi

check_internet() {
    ATTEMPTS=0
    MAX_ATTEMPTS=400
    while ! ping -c 1 8.8.8.8 &> /dev/null; do
        if [ $ATTEMPTS -ge $MAX_ATTEMPTS ]; then
            echo "Error: No internet connection after $MAX_ATTEMPTS attempts."
            return 1
        fi
        echo "Checking internet connectivity..."
        sleep 2
        ATTEMPTS=$((ATTEMPTS + 1))
    done
    echo "Internet connection established."
    return 0
}

check_internet
if [ $? -ne 0 ]; then
    echo "Error: Unable to establish internet connection."
    exit 1
fi

# Change Mac
INTERFACE="wi-fi"
sudo spoof-mac.py randomize $INTERFACE
if [ $? -eq 0 ]; then
    echo "MAC address for $INTERFACE changed successfully."
else
    echo "Error changing MAC address for $INTERFACE."
    exit 1
fi

# Ensure Wi-Fi interface is up
check_internet


# Start WireGuard VPN
# Ensure 'wg-quick' is installed and configured
sudo wg-quick up $WIREGUARD_CONFIG
if [ $? -eq 0 ]; then
    echo "WireGuard VPN started on interface $WIREGUARD_CONFIG"
else
    echo "Error starting WireGuard VPN on interface $WIREGUARD_CONFIG"
fi