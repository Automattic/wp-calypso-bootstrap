# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "wp-calypso-1.5" do |node|
    node.vm.box = "bento/ubuntu-18.04"
    node.vm.host_name = "calypso.automattic.com"

    node.vm.network :forwarded_port, guest: 3000, host: 3000
    node.vm.network :forwarded_port, guest: 9898, host: 9898
  end

  # Disables default synced folders
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Calypso Bootstrap 1.5"
    vb.cpus = 2
    vb.memory = 4096

    vb.customize [
      "modifyvm", :id,
      "--clipboard", "bidirectional",
      "--description", "Virtual machine to develop with WordPress.com Calypso.",
      "--natdnshostresolver1", "on",
      "--natdnsproxy1", "on",
      "--cableconnected1", "on"
    ]
  end

  # Installs the latest versions of Puppet third-party modules
  config.vm.provision "shell", path: "puppet/scripts/setup.sh"

  config.vm.provision "puppet" do |puppet|
    puppet.environment = "production"
    puppet.environment_path = "puppet"
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
