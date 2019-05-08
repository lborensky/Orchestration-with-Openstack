#!/bin/bash
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://yum.kubernetes.io/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

# echo "export LC_ALL=en_US.UTF-8" >> /etc/profile
# echo "LC_ALL=en_US.UTF-8" >> /etc/environment

setenforce 0
yum install -y docker kubelet kubeadm kubectl kubernetes-cni
systemctl enable docker && systemctl start docker
systemctl enable kubelet && systemctl start kubelet

# INFO_MASTER_IP="2a587b.a7a06852512a0762-192.168.100.5"
INFO_MASTER=$TOKEN_AND_IP_MASTER

TOKEN_MASTER=$(echo $INFO_MASTER | awk -F'-' '{ print $1 }')
IP_MASTER=$(echo $INFO_MASTER | awk -F'-' '{ print $2 }')

kubeadm join --token=$TOKEN_MASTER $IP_MASTER
