# Disable firewalld
#sudo ufw disable

# install docker
sudo apt-get update
sudo apt-get install -y curl
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine
sudo service docker start
# Docker compose
sudo curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
ls -la /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
sudo chown -R vagrant:docker /usr/local/bin/docker-compose
ls -la /usr/local/bin/docker-compose
# groups
sudo usermod -aG docker vagrant
