sudo systemctl start --now docker
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl restart docker
