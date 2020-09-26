echo -e "\e[1;35m Configuring Docker... \e[0mww\n"

sudo systemctl start --now docker
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl restart docker
