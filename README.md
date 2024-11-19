# Hotspot enabler - ubuntu like distros

Simple script to enable and activate hotspot for ubuntu based distros

## Configuration

In each home of every user there is a folder named **.config**, which has inside an ***autostart*** directory.
```bash
Silver@localhost:~/home/Silver/.config/autostart#
```
All the scripts inside the *autostart* directory will  be executed when user starts a new session.


To run the script, we need to install the iw command if able:
```bash
Silver@localhost:~# sudo apt install iw -y 
```
## Making the script

To make the script, we using any editor (i personally use vim):
```bash
Silver@localhost:~/home/Silver/.config/autostart# vim hotspot.sh
```
And the script will looks like this:
```bash
#!/bin/bash

wifi_iface=$(iw dev | awk '$1=="Interface"{print $2}') # gets the name of wlan interface

if [ -z "$wifi_iface" ]; then
  echo "wlan interface not found."
  exit 1
fi

# Create the hotspot using the wlan interface
/usr/bin/nmcli dev wifi hotspot ifname "$wifi_iface" ssid MyHotspot password 12345678Aa.
```

After the script is saved, we have to give execution privileges to the file:
```bash
Silver@localhost:~/home/Silver/.config/autostart# sudo chmod +x hotspot.sh
```

And thats all :)
