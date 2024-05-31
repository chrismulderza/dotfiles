#!/usr/bin/env bash

echo -e "Shutting down Red Hat VPN connection"
#nmcli connection down Red_Hat_Global_VPN
nmcli connection down Amsterdam-VPN 
