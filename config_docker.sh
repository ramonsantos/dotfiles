sudo systemctl start --now docker
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
sudo systemctl restart docker

docker-compose up -d
