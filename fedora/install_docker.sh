echo -e "\e[1;35mConfiguring Docker... \e[0m\n"

sudo dnf -y remove podman runc
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo systemctl start --now docker
sudo systemctl enable --now docker
sudo usermod -aG docker ramonsantos
newgrp docker
sudo systemctl restart docker
