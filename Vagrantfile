# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "hashicorp/precise64"
  # config.vm.box = "chef/centos-6.5"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.network :forwarded_port, :host => 8080, :guest => 8080


  #Be able to get the artifacts
  #config.vm.synced_folder "../../target/", "/target"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.ssh.forward_x11 = true

  #These network things are nessesary to make ubuntu work fast
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
  end
  config.vm.network :public_network, :nictype => 'virtio', :type => "dhcp", :use_dhcp_assigned_default_route => true

  config.vm.hostname = "jenkins"


end
