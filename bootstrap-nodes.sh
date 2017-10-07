#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
yum -y update

# copy examples into /home/vagrant (from inside the mgmt node)
#cp -a /vagrant/files/* /home/vagrant
#chown -R vagrant:vagrant /home/vagrant

# configure hosts file for our internal network defined by Vagrantfile

cat >> /etc/hosts <<EOL
# vagrant environment nodes
10.0.15.10  k8s-mgmt
10.0.15.21  k8s-node1
10.0.15.22  k8s-node2
10.0.15.23  k8s-node3
10.0.15.24  k8s-node4
10.0.15.25  k8s-node5
10.0.15.26  k8s-node6
10.0.15.27  k8s-node7
10.0.15.28  k8s-node8
10.0.15.29  k8s-node9
EOL

mkdir -p /home/vagrant/.ssh
#runuser -u vagrant "ssh-keyscan k8s-node1 k8s-node2 k8s-mgmt >> ~/.ssh/known_hosts"
cp /vagrant/files/id_rsa* /home/vagrant/.ssh/
cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chown vagrant:vagrant /home/vagrant/.ssh/*


#reboot
