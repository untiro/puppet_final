# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
#  config.vm.synced_folder "./chef/chef-repo/cookbooks/chef-pkgs", "/vagrant"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.define "puppet" do |puppet|
    puppet.vm.box = "sbeliakou/centos-7.3-x86_64-minimal"
    puppet.vm.network "private_network", ip: "192.168.56.20"
    puppet.vm.hostname = "puppetserver"
    puppet.vm.provider "virtualbox" do |v|
	v.memory = "4096"
	v.name = "puppetserver"
    end
  end

  config.vm.define "node1" do |node1|
    node1.vm.box = "sbeliakou/centos-7.3-x86_64-minimal"
    node1.vm.network "private_network", ip: "192.168.56.21"
    node1.vm.hostname = "node1"
    node1.vm.provider "virtualbox" do |v|
	v.memory = "2048"
	v.name = "node1"
    end
  end

  config.vm.define "node2" do |node2|
    node2.vm.box = "sbeliakou/centos-7.3-x86_64-minimal"
    node2.vm.network "private_network", ip: "192.168.56.22"
    node2.vm.hostname = "node2"
    node2.vm.provider "virtualbox" do |v|
	v.memory = "512"
	v.name = "node2"
    end
  end

end
