#!/bin/bash

echo "updating"
sudo apt update
sudo apt upgrade
echo "openSSH"
sudo apt install openssh-server -y
echo "mosquitto"
sudo apt install mosquitto -y
echo "mosquitto clients"
sudo apt install mosquitto-clients -y
# need to be able to write to the conf.d dir or the next command will fail
echo "mosquitto conf"
sudo printf 'listener 1883\n listener 1884\n listener 1885\n listener 1886\n listener 1887\n listener 1888\n listener 3000\n listener 3001\n\n listener 9000\n protocol websockets' > /etc/mosquitto/conf.d/r2-mosquitto.conf
echo "---- public ip ----"
curl ipinfo.io/ip
echo "==================="
# how to run this script from terminal
# bash <(curl -s https://raw.githubusercontent.com/RickyVaughn2/scripts/master/i-mosquitto.sh)
