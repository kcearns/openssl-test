# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-5.11"

	config.vm.provision "shell", inline: <<-SHELL
		yum -y groupinstall 'Development Tools' && yum -y install perl-core libtemplate-perl zlib-devel
	SHELL

end
