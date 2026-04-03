echo -e "\e[1;35mConfiguring Docker... \e[0m\n"

# Docker

# Centos
sudo dnf -y remove podman runc
sudo curl https://download.docker.com/linux/centos/docker-ce.repo -o /etc/yum.repos.d/docker-ce.repo
sudo sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/docker-ce.repo
sudo dnf --enablerepo=docker-ce-stable -y install docker-ce

# Fedora
sudo dnf -y remove podman runc
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Geral
sudo systemctl start --now docker
sudo systemctl enable --now docker
sudo usermod -aG docker ramonsantos
newgrp docker
sudo systemctl restart docker
