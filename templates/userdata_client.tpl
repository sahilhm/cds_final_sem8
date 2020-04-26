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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3bVJfHJNjyj9KiRUme+fxB67c46n+Q9M6dRF44ayTMuypcPZlJxBGLJTjUb2cpIUxb/Db71JRU1UicM64boPJrXaTpWQgFB6eI48leuY+4IfPSN+Q9TbSi5X+qg/vdv1Jj6WV7BKUzzXwiHOLTcf2UNsYuQWOEXFr/Gi6a16pNUg8WvjeIk7Hb4kIgfpSJVKi6jIYg0ArfLrCX5+GlbPzZlZLaR0cdjs1smgNczwC86yteRjGKOckKCE38BrusvyEgfdqWBLgpXgMbXU8V0plxIIbQmpgXM0TgwcWAUEHqRPmLw0IRW/+ILhOYuLX0AkdO4FgxK+nJ5GV439ef3W7 jenkins@ip-172-31-95-131" >> authorized_keys
chown ansadm:ansadm authorized_keys
chmod 600 authorized_keys
EOF

