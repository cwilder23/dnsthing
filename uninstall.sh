#!/bin/bash
#
# Uninstalls dnsthing
#
# NOTE: Requires root access or sudo to install the systemd service
#
name=dnsthing
service_name=$name.service

# Primeing sudo cache so the password is only asked at the beginning.
sudo ls 1>/dev/null

sudo systemctl disable ${service_name}
sudo systemctl stop ${service_name}
sudo rm /lib/systemd/system/${service_name} /usr/local/bin/$name

