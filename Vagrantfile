# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "generic/centos8"
  config.vm.network "private_network", ip: "192.168.10.10"

  config.vm.provider "virtualbox" do |vb|
     vb.name = "vgrnt-centos8-ansible"
     vb.gui = false
     vb.memory = "2048"
     vb.cpus = 2
   end

  config.vm.provision "shell", path: "init_scripts/init_vagrant.sh"
end