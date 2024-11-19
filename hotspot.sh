#!/bin/bash

wifi_iface=$(iw dev | awk '$1=="Interface"{print $2}')

if [ -z "$wifi_iface" ]; then
  echo "wlan interface not found."
  exit 1
fi

/usr/bin/nmcli dev wifi hotspot ifname "$wifi_iface" ssid MyHotspot password 12345678Aa.
