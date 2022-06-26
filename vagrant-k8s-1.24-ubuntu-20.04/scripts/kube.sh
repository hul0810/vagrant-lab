# /bin/bash
sudo swapoff -a
sudo sed -i '/swap/d' /etc/fstab
sudo apt-get update
sleep 1

sudo apt-get install -y ca-certificates apt-transport-https curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
sudo apt-get update
sleep 1

sudo apt-get install -y docker-ce=$docker_ver docker-ce-cli=$docker_ver containerd.io
systemctl enable --now docker
systemctl enable --now containerd

# First Permission
sudo mkdir /etc/docker
# sudo chown $USER:docker /etc/docker

# containerd configure to  default
sudo containerd config default > /etc/containerd/config.toml
sudo systemctl restart containerd

# Avoid WARN&ERRO(default endpoints) when crictl run
cat <<EOF | sudo tee /etc/crictl.yaml
runtime-endpoint: unix:///run/containerd/containerd.sock
image-endpoint: unix:///run/containerd/containerd.sock
EOF

sudo mkdir -p /etc/systemd/system/docker.service.d

sudo modprobe br_netfilter
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sleep 1

sudo apt-get install -y kubelet=$k8s_ver kubeadm=$k8s_ver kubectl=$k8s_ver
sudo apt-mark hold kubelet kubeadm kubectl
