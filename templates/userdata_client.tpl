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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWT/vgrC/vmJU3/U2hEZRUJdI5fV186HrVpa/k9hl5F3Hx5HF6Sk0MsJyn1x69ACvqgMdAHlxt/cErjPld1tsQriqD6OaxKgQhQYOU9gyEeYia4+xvAKhjeZpess3Q7OdNEtaqpgENyFJOY8Bws9uth5GoWbfN5lH29tQ6Tm1vXaMWHNNzHmcli6wK7E6rqvNbYPQZskcsvhDxuH+Op+dBzArjNc7YUc+3fo0+dV4zv0uDJmR3AwSscwJOf9pT01JyPO0ZKpvJSa7LRoHIimEVbBZ8bZkEU7SJ3WN04eqUeXhfJQiXPslD7cXdhX40cpOHEl2VdxY47yO0YAKgb+Yn ansadm@ip-172-31-89-5.ec2.internal" >> authorized_keys
chown ansadm:ansadm authorized_keys
chmod 600 authorized_keys
EOF

