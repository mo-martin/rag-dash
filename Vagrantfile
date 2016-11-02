# # -*- mode: ruby -*-
# # vi: set ft=ruby :
Vagrant.configure("2") do |config|
config.vm.provider "virtualbox" do |v|
  v.memory = 2048
  v.cpus = 2
end

config.vm.define "localvm" do |localvm|
  localvm.vm.hostname = "rag-dashboard"
  localvm.vm.box = "bento/ubuntu-16.04"
  # Use rsync to sync to vagrant and then to docker
  localvm.vm.synced_folder ".", "/sync", type: "rsync",
  rsync__exclude: [
    '.git', '.vagrant'
  ]
  # provision with docker and docker-compose
  localvm.vm.provision :docker
  # when running docker compose always rebuild and run
  localvm.vm.provision :docker_compose,
    yml: "/sync/docker-compose.yml",
    rebuild: true,
    run: "always"
  # Start automatically Syncing
  localvm.gatling.rsync_on_startup = true
  # forward ports
  localvm.vm.network "forwarded_port", guest:8000, host:8000
  localvm.vm.network "forwarded_port", guest:8083, host:8083
  localvm.vm.network "forwarded_port", guest:80, host:80
  localvm.vm.network "forwarded_port", guest:2003-2004, host:2003-2004
  localvm.vm.network "forwarded_port", guest:2023-2024, host:2023-2024
  localvm.vm.network "forwarded_port", guest:8125-8126, host:8125-8126

end
end
