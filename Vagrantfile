# # -*- mode: ruby -*-
# # vi: set ft=ruby :
Vagrant.configure("2") do |config|
config.vm.provider "virtualbox" do |v|
  v.memory = 2048
  v.cpus = 2
end

config.vm.define "app" do |app|
  app.vm.hostname = "rag-dashboard"
  app.vm.box = "bento/ubuntu-16.04"
  # Use rsync to sync to vagrant and then to docker
  app.vm.synced_folder ".", "/sync", type: "rsync",
  rsync__exclude: [
    '.git', 'node_modules', '.vagrant'
  ]
  # provision with docker and docker-compose
  app.vm.provision :docker
  # when running docker compose always rebuild and run
  app.vm.provision :docker_compose,
    yml: "/sync/build-app/docker-compose.yml",
    rebuild: true,
    run: "always"
  # Start automatically Syncing
  app.gatling.rsync_on_startup = false
  # forward ports
  app.vm.network "forwarded_port", guest:8000, host:8000
end

config.vm.define "api" do |api|
  api.vm.hostname = "rag-dashboard"
  api.vm.box = "bento/ubuntu-16.04"
  # Use rsync to sync to vagrant and then to docker
  api.vm.synced_folder ".", "/sync", type: "rsync",
  rsync__exclude: [
    '.git', 'node_modules', '.vagrant'
  ]
  # provision with docker and docker-compose
  api.vm.provision :docker
  # when running docker compose always rebuild and run
  api.vm.provision :docker_compose,
    yml: "/sync/build-api/docker-compose.yml",
    rebuild: true,
    run: "always"
  # Start automatically Syncing
  api.gatling.rsync_on_startup = false
  # forward ports
  api.vm.network "forwarded_port", guest:3080, host:3080
end

# config.vm.define "test" do |test|
#   test.vm.hostname = "rag-dashboard"
#   test.vm.box = "bento/ubuntu-16.04"
#   # Use rsync to sync to vagrant and then to docker
#   test.vm.synced_folder ".", "/sync", type: "rsync",
#   rsync__exclude: [
#     '.git', 'node_modules', '.vagrant'
#   ]
#   # provision with docker and docker-compose
#   test.vm.provision :docker
#   # when running docker compose always rebuild and run
#   test.vm.provision :docker_compose,
#     yml: "/sync/build-test/docker-compose.yml",
#     rebuild: true,
#     run: "always"
#   # Start automatically Syncing
#   test.gatling.rsync_on_startup = true
# end
end
