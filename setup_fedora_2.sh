function install_app_by_snap() {
  sudo snap install postman
  sudo snap install heroku --classic
  sudo snap install sublime-text --classic
  sudo snap install crystal --classic
}

function install_node_packages() {
  sudo npm install --global webpack gulp hexo
}

function install_python_packages() {
  /usr/bin/python3 -m pip install -U autopep8 --user
}

function config_git() {
  cp .gitconfig $HOME
}

function setup_services_by_docker() {
  docker-compose up -d
}

# Main
install_app_by_snap
install_node_packages
install_python_packages
config_git
setup_services_by_docker
