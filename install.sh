#!/bin/bash
#
# Installs dnsthing. Adds dependencies and the installs as a daemon.
#
# NOTE: Requires root access or sudo to install the systemd service
#
name=dnsthing
service_name=$name.service

# Primeing sudo cache so the password is only asked at the beginning.
sudo ls 1>/dev/null

pip install -r requirements.txt

sudo cp $name.py /usr/local/bin/$name
sudo chmod +x /usr/local/bin/dnsthing
sudo cp ${service_name} /lib/systemd/system

sudo systemctl enable ${service_name}
sudo systemctl start ${service_name}

# Show status
sudo systemctl status ${service_name}
