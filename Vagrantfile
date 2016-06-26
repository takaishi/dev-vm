# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"

#  config.vm.network "private_network", ip: "192.168.33.10"

  #config.vm.synced_folder "~/Dropbox", "/srv"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "~/src", "/home/ubuntu/src"
  config.vm.provider "virtualbox" do |vb|
    vb.name = 'develop'
    vb.cpus = 2
    vb.memory = 8192
  end

  config.vm.provision 'ansible_local' do |ansible|
    ansible.playbook = 'provisioning/playbook.yml'
    ansible.verbose  = true
    ansible.install  = true
    ansible.install_mode  = :pip
  end
end
