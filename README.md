# vagrant-k8s

# Scripts to create Vagrant VMs install ansible and configure Kubernetes on them
#1 Mgmt and 2 nodes

#Create the ssh-keys in files directory to distribute them across the cluster
ssh-keygen -t rsa -N "" -f ./files/id_rsa
