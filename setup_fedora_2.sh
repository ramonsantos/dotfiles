function install_app_by_snap() {
  sudo snap install heroku --classic
  sudo snap install sublime-text --classic
  snap install spotify
}

function install_node_packages() {
  sudo npm install --global webpack
}

function config_git() {
  cp .gitconfig $HOME
}

# Main
install_app_by_snap
install_node_packages
config_git
