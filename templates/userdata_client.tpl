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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCiGFlWxUlt6vZBFiUQK115M3yKq/DD4xvvcbzGGoOJxQ4h8JZX7i9FyCRYXHbtqaV21aH/YElhyHLtzwWbHvwtZIwOxjJ0dzxFyGngcv6RRaDJSQar8qDaxPeMfZc7pR5kv6zyo9/U3c0towBWJ9Xx8jTPqGAzp8mHkkbrgGDucejklsCZkdHx9bbK4kClUqrEuKbHodWitzxBJeyZCowN7+P9/Y+p+JwqO4JbG5rtUDospWMT0AI5AsppTdVWQsu3mSJkjk9hAzyi5xYPY/vQcjrn2vpCXi5ZPgPc4cJ5Tu1G1+XbDxDShAOrCtqyQyV2IkQjX+u5Gyej8bKRk+oR ansadm@ip-172-31-38-122.us-east-2.compute.internal" >> authorized_keys
chown ansadm:ansadm authorized_keys
chmod 600 authorized_keys
EOF
