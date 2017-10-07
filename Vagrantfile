# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create mgmt node
  config.vm.define "k8s-mgmt" do |mgmt_config|
      mgmt_config.vm.box = "centos/7"
      mgmt_config.vm.hostname = "k8s-mgmt"
      mgmt_config.vm.network :private_network, ip: "10.0.15.10"
      mgmt_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
      config.vm.provision "shell", inline: <<-EOC
        sudo sed -i -e "\\#PasswordAuthentication no# s#PasswordAuthentication no#PasswordAuthentication yes#g" /etc/ssh/sshd_config
        sudo systemctl restart sshd
        EOC

  end

  # create some web servers
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..2).each do |i|
    config.vm.define "k8s-node#{i}" do |node|
        node.vm.box = "centos/7"
        node.vm.hostname = "k8s-node#{i}"
        node.vm.network :private_network, ip: "10.0.15.2#{i}"
        node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
        end
	node.vm.provision :shell, path: "bootstrap-nodes.sh"
	config.vm.provision "shell", inline: <<-EOC
        sudo sed -i -e "\\#PasswordAuthentication no# s#PasswordAuthentication no#PasswordAuthentication yes#g" /etc/ssh/sshd_config
        sudo systemctl restart sshd
        EOC
    end
end

end
