#/bin/bash
now=$(date +%m_%d_%Y)
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_$now.bak
sudo sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd