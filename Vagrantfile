# # -*- mode: ruby -*-
# # vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end
  config.vm.hostname = "rag-dashboard"

  # Choose host
  config.vm.box = "bento/ubuntu-16.04"

  # Use rsync to sync to vagrant and then to docker
  config.vm.synced_folder ".", "/sync", type: "rsync",
  rsync__exclude: [
    '.git', 'node_modules'
  ]
  # provision with docker and docker-compose
  config.vm.provision :docker

  # when running docker compose always rebuild and run
  config.vm.provision :docker_compose,
    yml: "/sync/docker-compose.yml",
    rebuild: true,
    run: "always"

  # Start automatically Syncing
  config.gatling.rsync_on_startup = false

  # forward ports
  config.vm.network "forwarded_port", guest:80, host:80
  config.vm.network "forwarded_port", guest:443, host:443
  config.vm.network "forwarded_port", guest:3080, host:3080
end
