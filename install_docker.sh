echo -e "\e[1;35mConfiguring Docker... \e[0m\n"

# Docker
sudo dnf -y remove podman runc
sudo curl https://download.docker.com/linux/centos/docker-ce.repo -o /etc/yum.repos.d/docker-ce.repo
sudo sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/docker-ce.repo
sudo dnf --enablerepo=docker-ce-stable -y install docker-ce

sudo systemctl start --now docker
sudo systemctl enable --now docker
sudo usermod -aG docker ramonsantos
newgrp docker
sudo systemctl restart docker

# Docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
