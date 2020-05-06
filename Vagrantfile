# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "mds" do |mds|
    mds.vm.box = "lustre_base"
    mds.vm.hostname = 'mds'

    mds.vm.network :private_network, ip: "192.168.56.101"
    mds.vm.network :forwarded_port, guest: 22, host: 10122, id: "ssh"

    mds.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "mds"]

      mdt1 = '/Users/jmiller/project/vagrant/disks/mdt1.vdi'
      unless File.exist?(mdt1)
        v.customize ['createhd', '--filename', mdt1, '--size', 5 * 1024]
      end
      v.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', mdt1]

      mdt2 = '/Users/jmiller/project/vagrant/disks/mdt2.vdi'
      unless File.exist?(mdt2)
        v.customize ['createhd', '--filename', mdt2, '--size', 5 * 1024]
      end
      v.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 1, '--type', 'hdd', '--medium', mdt2]
    end
  end

  config.vm.define "oss1" do |oss1|
    oss1.vm.box = "lustre_base"
    oss1.vm.hostname = 'oss1'

    oss1.vm.network :private_network, ip: "192.168.56.102"
    oss1.vm.network :forwarded_port, guest: 22, host: 10222, id: "ssh"

    oss1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "oss1"]

      ost1 = '/Users/jmiller/project/vagrant/disks/ost1.vdi'
      unless File.exist?(ost1)
        v.customize ['createhd', '--filename', ost1, '--size', 50 * 1024]
      end
      v.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', ost1]

      ost2 = '/Users/jmiller/project/vagrant/disks/ost2.vdi'
      unless File.exist?(ost2)
        v.customize ['createhd', '--filename', ost2, '--size', 50 * 1024]
      end
      v.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 1, '--type', 'hdd', '--medium', ost2]
    end
  end

  config.vm.define "oss2" do |oss2|
    oss2.vm.box = "lustre_base"
    oss2.vm.hostname = 'oss2'

    oss2.vm.network :private_network, ip: "192.168.56.103"
    oss2.vm.network :forwarded_port, guest: 22, host: 10322, id: "ssh"

    oss2.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "oss2"]

      ost3 = '/Users/jmiller/project/vagrant/disks/ost3.vdi'
      unless File.exist?(ost3)
        v.customize ['createhd', '--filename', ost3, '--size', 50 * 1024]
      end
      v.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', ost3]

      ost4 = '/Users/jmiller/project/vagrant/disks/ost4.vdi'
      unless File.exist?(ost4)
        v.customize ['createhd', '--filename', ost4, '--size', 50 * 1024]
      end
      v.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 1, '--type', 'hdd', '--medium', ost4]
    end
  end

  config.vm.define "client1" do |client1|
    client1.vm.box = "lustre_base"
    client1.vm.hostname = 'client1'

    client1.vm.network :private_network, ip: "192.168.56.104"
    client1.vm.network :forwarded_port, guest: 22, host: 10422, id: "ssh"

    client1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 256]
      v.customize ["modifyvm", :id, "--name", "client1"]
    end
  end

  config.vm.define "client2" do |client2|
    client2.vm.box = "lustre_base"
    client2.vm.hostname = 'client2'

    client2.vm.network :private_network, ip: "192.168.56.105"
    client2.vm.network :forwarded_port, guest: 22, host: 10522, id: "ssh"

    client2.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 256]
      v.customize ["modifyvm", :id, "--name", "client2"]
    end
  end

end
