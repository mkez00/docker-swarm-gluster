# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	$num_node = 2
	$num_node.times do |n|
		node_vm_name = "gluster#{n+1}"
		hostname = "gluster#{n+1}"
		private_ip = "192.168.56.8#{n+1}"
		config.vm.define node_vm_name do |c|
			c.vm.box = "ubuntu/xenial64"
	  		c.vm.hostname = hostname
	  		c.vm.synced_folder "data", "/data"
	  		c.vm.network "private_network", ip: private_ip
	  		c.vm.provision "shell", inline: <<-SHELL
	  			sudo su
		  		apt-get install -y software-properties-common
		  		add-apt-repository ppa:gluster/glusterfs-3.8
		  		apt-get update
		  		apt-get install -y glusterfs-server
	  		SHELL
		end
	end

	config.vm.define "manager1" do |c|
		c.vm.box = "ubuntu/xenial64"
  		c.vm.hostname = "manager1"
  		c.vm.synced_folder "data", "/data"
  		c.vm.network "private_network", ip: "192.168.56.90"
  		c.vm.provision "shell", inline: <<-SHELL
  			sudo su
	  		apt-get update
	  		apt-get install -y apt-transport-https lsb-release ca-certificates curl software-properties-common
	  		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
	  		add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	  		apt-get update
	  		apt-get install docker-ce -y
	  		rm -rf /data/join-swarm.sh
	  		docker swarm init --advertise-addr 192.168.56.90
	  		docker swarm join-token manager | grep "docker swarm join --token" > /data/join-swarm.sh

	  		apt-get install -y glusterfs-client
	  		mkdir -p /mnt/glusterfs
  		SHELL
	end

	$num_node = 2
	$num_node.times do |n|
		node_vm_name = "worker#{n+1}"
		hostname = "worker#{n+1}"
		private_ip = "192.168.56.9#{n+1}"
		config.vm.define node_vm_name do |c|
			c.vm.box = "ubuntu/xenial64"
	  		c.vm.hostname = hostname
	  		c.vm.synced_folder "data", "/data"
	  		c.vm.network "private_network", ip: private_ip
	  		c.vm.provision "shell", inline: <<-SHELL
	  			sudo su
		  		apt-get update
		  		apt-get install -y apt-transport-https lsb-release ca-certificates curl software-properties-common
		  		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
		  		add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
		  		apt-get update
		  		apt-get install docker-ce -y
		  		sh /data/join-swarm.sh

		  		apt-get install -y glusterfs-client
		  		mkdir -p /mnt/glusterfs
	  		SHELL
		end
	end

end