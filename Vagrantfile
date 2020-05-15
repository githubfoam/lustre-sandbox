# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  config.vm.define "master" do |master|
    master.vm.box = "debian/stretch64"
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "172.16.1.11"
    master.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
    end
    # master.vm.provision "ansible/master", type: "ansible" do |ansible|
    master.vm.provision "ansible/master", type: "ansible_local" do |ansible|
        ansible.playbook = "ansible/provision-master.yml"
        ansible.compatibility_mode = "2.0"
        ansible.version = "2.2.1.0"
        ansible.verbose = "v"
        ansible.extra_vars = {
            "target" => "master",
            "master_ip" => "172.16.1.11",
            "join_file" => "join.txt"
        }
    end
  end

  config.vm.define "node1" do |node1|
    node1.vm.box = "debian/stretch64"
    node1.vm.hostname = "node1"
    node1.vm.network "private_network", ip: "172.16.1.12"
    node1.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
    end
    # node1.vm.provision "ansible/node1", type: "ansible" do |ansible|
    node1.vm.provision "ansible/node1", type: "ansible_local" do |ansible|
        ansible.playbook = "ansible/provision-node.yml"
        ansible.compatibility_mode = "2.0"
        ansible.version = "2.2.1.0"
        ansible.verbose = "v"
        ansible.extra_vars = {
            "target" => "node1",
            "node_ip" => "172.16.1.12",
            "master_ip" => "172.16.1.11",
            "join_file" => "join.txt"
        }
    end
  end

  config.vm.define "node2" do |node2|
    node2.vm.box = "debian/stretch64"
    node2.vm.hostname = "node2"
    node2.vm.network "private_network", ip: "172.16.1.13"
    node2.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
    end
    # node2.vm.provision "ansible/node2", type: "ansible" do |ansible|
    node2.vm.provision "ansible/node1", type: "ansible_local" do |ansible|
        ansible.playbook = "ansible/provision-node.yml"
        ansible.compatibility_mode = "2.0"
        ansible.version = "2.2.1.0"
        ansible.verbose = "v"
        ansible.extra_vars = {
            "target" => "node2",
            "node_ip" => "172.16.1.13",
            "master_ip" => "172.16.1.11",
            "join_file" => "join.txt"
        }
    end
  end


end
