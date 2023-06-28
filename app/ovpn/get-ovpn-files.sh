#!/bin/bash

. /app/date.sh --source-only

echo "$(adddate) INFO: Download and extract ovpn files" 

#Create directory if no volume is done
mkdir -p ${OVPN_CONFIG_DIR}
cd ${OVPN_CONFIG_DIR}

#First remove files if exists
rm -rf ovpn*

#Download the files
wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip

#Unzip files
unzip -q ovpn.zip

#Remove current zip
rm -rf ovpn.zip