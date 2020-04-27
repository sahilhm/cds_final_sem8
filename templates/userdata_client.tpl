#!/bin/bash
sudo su
useradd -d /home/ansadm -m ansadm
echo "Crest\$123" | passwd --stdin ansadm
passwd -x -1 ansadm
sudo chmod 700 /etc/sudoers
sudo echo "ansadm ALL=NOPASSWD: ALL" >> /etc/sudoers
su - ansadm <<'EOF'
sleep 2m
mkdir .ssh
chmod 700 .ssh/
chown ansadm:ansadm .ssh/
cd .ssh/
touch  authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCesuxDX5VVCLeskPYwqybRZNnPKxVOq5/6vAYeKWVHTlZiGe45rLnCi4ctdluNkk4DCBW10jM13nAhoXy/EpUY/a9bvGHEF867lsd9XCYxg4iImi1dg4j5zMfVVzuE4PqJGF1oKx0DaGM2suPLEO2yvz8/MhGLUziqctU6w/EhyZpW9SFJSMo9FvYq8yhrWdh0F7VcjgvIlD135w4jQZnPMa9c66+9uk7f+/OWYpMRZh90d65upc1W1z+bSeqPI1tmgg66iPv5dz0b6RVOsRAdHXSWbpsBbO7Lf6+JBFd14EtStTb/U6BOQkiePPml5gD/kA+TcSTHW3sdHG+aabGd ansadm@ip-172-31-21-50.us-east-2.compute.internal" >> authorized_keys
chown ansadm:ansadm authorized_keys
chmod 600 authorized_keys
EOF
