sudo sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update

# packages install
# ubuntu 18.04 must install pass and gnupg2 for prevent dbus error but v20.04 unnecessary.
sudo apt-get install -y vim git net-tools jq sshpass pass gnupg2 python3-pip

# python package install
# These tasks are for ubuntu 18.04 but v20.04 unnecessary.
sudo pip3 install --upgrade pip
sudo pip3 install setuptools_rust docker websocket docker-compose


# Install Ansible
sudo apt install -y ansible

# Install Docker
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Install docker-compose
sudo apt-get install -y docker-compose
sudo curl -sSL "https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# install pip3 and packages
#sudo apt-get install -y python3-pip

# AWX install (only tower)
wget https://github.com/ansible/awx/archive/refs/tags/17.1.0.tar.gz
tar xvf 17.1.0.tar.gz
