# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder '.', '/vagrant', type: 'nfs'

  # VirtualBox.
  # `vagrant up virtualbox --provider=virtualbox`
  config.vm.define "virtualbox" do |virtualbox|
    virtualbox.vm.hostname = "virtualbox-ubuntu1804"
    virtualbox.vm.box = "file://builds/virtualbox-ubuntu1804.box"
    virtualbox.vm.network :private_network, ip: "172.16.3.2"

    config.vm.provider :virtualbox do |v|
      v.gui = false
      v.memory = 1024
      v.cpus = 1
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    config.vm.provision "shell", inline: "echo Hello, World"
  end

  # libvirt
  # `vagrant up libvirt --provider=libvirt`
  config.vm.define "libvirt" do |libvirt|
    libvirt.vm.hostname = "libvirt-ubuntu1804"
    libvirt.vm.box = "file://builds/libvirt-ubuntu1804.box"
    libvirt.vm.network :private_network, :ip => "172.16.3.2"

    config.vm.provider :libvirt do |v|
      v.memory = 1024
      v.cpus = 1
    end

    config.vm.provision "shell", inline: "echo Hello, World"
  end

end
