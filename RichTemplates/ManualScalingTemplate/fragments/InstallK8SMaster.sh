#!/bin/bash

# use an CentOS image with this command $ sudo yum update -y
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

# echo "LANG=en_US.utf-8" >> /etc/environment
# echo "LC_ALL=en_US.UTF-8" >> /etc/environment

setenforce 0
sed -i '/^SELINUX./ { s/enforcing/disabled/; }' /etc/selinux/config

yum install -y docker kubelet kubeadm kubectl kubernetes-cni
systemctl enable docker && systemctl start docker
systemctl enable kubelet && systemctl start kubelet

# initialization with flannel network
# kubeadm init --pod-network-cidr=10.244.0.0/16 --cloud-provider openstack | tee /var/log/kubeadm-init.log
kubeadm init --pod-network-cidr=10.244.0.0/16 | tee /var/log/kubeadm-init.log

# choose network, between: cni, flannel, calico, romana or weave-net after join nodes
# kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml 
# kubectl apply -f https://git.io/weave-kube

# kubeadm join --token=7be2ea.c9e94676795a9144 192.168.100.3
TOKEN_AND_IP=$(cat /var/log/kubeadm-init.log | grep "kubeadm join --token" | sed -e 's/^.*token=\(.*\) \(.*\)$/\1-\2/')

wc_signal="--data-binary '{\"status\":\"SUCCESS\",\"reason\":\"signal1\",\"id\":\"id1\",\"data\":\"$(echo $TOKEN_AND_IP)\"}'"

FileRequest=/tmp/send_request.$$.sh
echo "$wc_notify $wc_signal" > $FileRequest
bash $FileRequest
rm -f $FileRequest

echo "Waiting for junction of the nodes"
NUM_NODES=$num_nodes
NUM_NODES=$(($NUM_NODES +1))
while [ "$(kubectl get nodes | wc -l)" -lt "$NUM_NODES" ]
do
  echo -n "."
  sleep 60
done
echo

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

echo "End of script on boot" > /tmp/boot-user-data.tmp
# end of script
