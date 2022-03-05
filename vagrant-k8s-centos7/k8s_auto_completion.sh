#/bin/bash

sudo yum install -y bash-completion

source /usr/share/bash-completion/bash_completion

echo 'source <(kubectl completion bash)' >>~/.bashrc

kubectl completion bash >/etc/bash_completion.d/kubectl

echo 'alias k=kubectl' >>~/.bashrc

echo 'complete -F __start_kubectl k' >>~/.bashrc