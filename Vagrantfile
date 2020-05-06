# LUSTRE_BOXEN = 'bento/centos-7.2'
# CLIENT_BOXEN = 'bento/centos-7.2'
LUSTRE_BOXEN = 'bento/centos-7.6'
CLIENT_BOXEN = 'bento/centos-7.6'

OST_DISKS = ['./disks/OST0.vdi']
MDT_DISKS = ['./disks/MDT0.vdi']

BOX_GROUPING = {
	'lustre-management' => ['lus-mg0-md0'],
	'lustre-metadata' => ['lus-mg0-md0'],
	'lustre-objectstore' => ['lus-oss0'],

	'lustre-clients' => ['client0'],
	'lustre-servers:children' => ['lustre-management', 'lustre-metadata', 'lustre-objectstore']
}

# Provides custom disk operation utils for the Virtualbox provider
require './diskops'

Vagrant.configure("2") do |config|
	# turn off the default `. => /vagrant` share
	config.vm.synced_folder ".", "/vagrant", disabled: true

	# Lustre *combined* metadata and management server (MGS+MDS)
	config.vm.define 'lus-mg0-md0' do |mgmd0|
		mgmd0.vm.box = LUSTRE_BOXEN
		mgmd0.vm.network :private_network, ip: "192.168.143.2"
		mgmd0.vm.provider "virtualbox" do |v|
			provision_disk(v, MDT_DISKS[0], 1*1024) # 1 gig VDI for metadata
		end
	end

	# Lustre object storage server (OSS, single OST vbox vdisk)
	config.vm.define 'lus-obj0' do |lo0|
		lo0.vm.box = LUSTRE_BOXEN
		lo0.vm.network :private_network, ip: "192.168.143.3"
		lo0.vm.provider "virtualbox" do |v|
			provision_disk(v, OST_DISKS[0], 10*1024) # 10 gig VDI for objects
		end
	end

	# a Lustre client box, for testing
	config.vm.define 'client0' do |cl0|
		cl0.vm.box = CLIENT_BOXEN
		cl0.vm.network :private_network, type: :dhcp
	end

	# Install Lustre to all cluster nodes
	config.vm.provision :ansible do |ansible|
		ansible.playbook = 'provisioning/install_lustre.yml'
		ansible.groups = BOX_GROUPING
	end

	# Reboot all nodes
	config.vm.provision :reload

	# Provision the Lustre filesystem
	config.vm.provision :ansible do |ansible|
		ansible.playbook = 'provisioning/provision_lustre.yml'
		ansible.groups = BOX_GROUPING
	end
end
