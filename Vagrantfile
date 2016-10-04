# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "wp-calypso-1.1" do |node|
    node.vm.box = "ubuntu/wily64"
    node.vm.host_name = "calypso.automattic.com"
    
    node.vm.network :forwarded_port, guest: 3000, host: 3000
  end
  
  # Fixes a 'stdin: is not a tty' error (see http://bit.ly/1nokaAw)
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  
  # Disables default synced folders
  config.vm.synced_folder ".", "/vagrant", disabled: true
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Calypso Bootstrap 1.1"
    vb.cpus = 1
    vb.memory = 2048
    
    vb.customize [
      "modifyvm", :id,
      "--clipboard", "bidirectional",
      "--description", "Virtual machine to develop with WordPress.com Calypso.",
      "--natdnshostresolver1", "on",
      "--natdnsproxy1", "on"
    ]
  end
  
  # Installs the latest versions of Puppet third-party modules
  config.vm.provision "shell", path: "puppet/scripts/setup.sh"
  
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
  end
  
  config.vm.post_up_message = "             _
    ___ __ _| |_   _ _ __  ___  ___
   / __/ _` | | | | | '_ \\/ __|/ _ \\
  | (_| (_| | | |_| | |_) \\__ \\ (_) |
   \\___\\__,_|_|\\__, | .__/|___/\\___/
               |___/|_|

        Calypso is ready to go!
"
end