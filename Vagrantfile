# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  config.vm.define :apache do |apache|
    apache.vm.box = "precise64"
    apache.vm.provision :shell, :path => "provision.sh"
    #apache.vm.network :forwarded_port, guest: 8081, host: 80
    apache.vm.network :private_network, ip: "192.168.100.10"
  end
end
