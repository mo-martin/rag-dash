# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "ragdash" do |ragdash|
    ragdash.vm.box = "bento/ubuntu-16.04"
    ragdash.vm.hostname = "rag-dashboard"
    ragdash.vm.network "forwarded_port", guest:80, host:80
    ragdash.vm.network "forwarded_port", guest:443, host:443
    ragdash.vm.network "forwarded_port", guest:3080, host:3080
    ragdash.vm.provision "shell", path: "scripts/docker.sh"
    ragdash.vm.synced_folder "~/rag-dashboard/dev/docker", "/home/vagrant/synced/docker", type: "rsync",
    rsync__exclude: [
    '.git', 'node_modules'
    ]

  end
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.name = "rag-dashboard"
end
end
