# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.ssh.insert_key = false
    
    # STM32 builder
    config.vm.define "stm32-builder" do |app|
        app.vm.hostname = "stm32-builder.dev"
        app.vm.box = "tknerr/baseimage-ubuntu-16.04"
        app.vm.network :private_network, ip: "192.167.60.4"
        # app.vm.synced_folder "./", "/home/vagrant/tmp",
        #         create: true, group: 1000, owner: 1000
    end
    
    config.vm.provision "ansible" do |a|
        a.playbook = "provisioning/setup-cde.yml"
        a.verbose = true
        a.groups = {
            "builders" => ["stm32-builder"],
            "multi:children" => ["builders"],
            "multi:vars" => {
                "ansible_ssh_user" => "vagrant",
                "ansible_ssh_private_key_file" => "~/.vagrant.d/insecure_private_key",
                "ansible_connection" => "ssh"
            }
        }
    end
end