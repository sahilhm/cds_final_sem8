#!/bin/bash
sudo su
useradd -d /home/ansadm -m ansadm
echo "Crest$123" | passwd --stdin ansadm
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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCYPEVBzc4dShoakqrNEvI0rAKLxEXWVcKDIeDwpTqvYBoVbOxQ7XtQ7ETWKywOyNmEE2Ttd6qyR6EgmInaUCXnPf4J0mq/UbfRb4HmyPky6o81rCXcEVCFIuq1KqhCXFDqvtn8X56lgbTYmk6wSel4Rz5KN/zc3vyRExDdBsR6zzJTznwCdR+VWjU4fFu0yw9A0jG67hij7/h3qO/AtMDmJc7ZuUlUUaJ6dJ/L9zi2xhQsTxfAb8vRmzL8A9ugx2uSiKrjWAefYHPi2qOXHyxoJC3NfPv7nTq3Bzy6RbpoVlLenmuIS5RdBvewvxbsvHUMDuBDyJtRAAspt4G7Uspx ansadm@ip-172-31-93-138.ec2.internal" >> authorized_keys
chown ansadm:ansadm authorized_keys
chmod 600 authorized_keys
EOF

