vagrant plugin install vagrant-gatling-rsync
vagrant plugin install vagrant-docker-compose
vagrant up
nohup vagrant gatling-rsync-auto > /dev/null 2>&1 &
