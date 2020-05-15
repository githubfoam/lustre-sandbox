# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/fedora-31"
  config.vm.host_name = "bazelhost"
  config.vm.network "private_network", ip: "192.168.66.99"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.cpus = 1
  end

  # config.vm.synced_folder "airflow/", "/home/ubuntu/airflow"
  config.vm.provision "shell", path: "bootstrap.sh"
  # config.vm.provision "ansible_local" do |ansible|
  #   ansible.playbook = "playbook.yml"
  # end
end
