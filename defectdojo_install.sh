#!/bin/bash

# DefectDojo installation from sources for Debian 12 systems.
# Run as root

if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root."
  exit
fi


# Install Docker
echo "Installing Docker..."
apt-get remove -y docker docker-engine docker.io containerd runc
apt-get install -y ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin



# Install DefectDojo
echo "Installing DefectDojo..."
git clone https://github.com/DefectDojo/django-DefectDojo /django-DefectDojo
docker compose -f /django-DefectDojo/docker-compose.yml build

cat << EOF > defectdojo.service
[Unit]
Description=DefectDojo Service
Requires=docker.service
After=docker.service

[Service]
WorkingDirectory=/django-DefectDojo
ExecStart=/usr/bin/docker compose up
ExecStop=/usr/bin/docker compose down
TimeoutStartSec=0

[Install]
WantedBy=multi-user.target
EOF

cp -v defectdojo.service /etc/systemd/system/

#Instantiating and Starting Services
systemctl daemon-reload
systemctl enable defectdojo.service
systemctl start defectdojo.service
