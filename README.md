# Dotfiles

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Install Fedora Basic Apps

Run step 1:

```bash
sudo -E ./setup_fedora_1.sh
```

## Install CentOS Basic Apps

Run step 1:

```bash
sudo -E ./setup_centos.sh
```

### Setup Zsh

Run:

```bash
./config_zsh.sh
```

```bash
zsh
```

### Install Ruby

Run:

```bash
./install_ruby.sh
```

### Reboot System

Run:

```bash
reboot
```

### Install Flatpak Packages

Run:

```bash
# Habilitar Flathub
sudo ./install_flatpak_packages.sh
```

### Install Docker (CentOS)

Run:

```bash
sudo ./install_docker.sh
```

### Install Snap Packages

Run:

```bash
sudo ./install_snap_packages.sh
```

## Optional

#### Nvidia driver by RPM Fusion

```bash
sudo dnf install akmod-nvidia
```

#### VirtualBox (CentOS)

```bash
sudo dnf config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
sudo rpm --import https://www.virtualbox.org/download/oracle_vbox.asc
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y

sudo dnf search virtualbox
sudo dnf install VirtualBox-7.0 -y

sudo usermod -aG vboxusers $USER
newgrp vboxusers

wget https://download.virtualbox.org/virtualbox/7.0.2/Oracle_VM_VirtualBox_Extension_Pack-7.0.2.vbox-extpack
sudo /sbin/vboxconfig
sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-7.0.2.vbox-extpack
```

#### Vagrant (CentOS)

```bash
 sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
 sudo yum -y install vagrant
```

#### Elixir

```bash
./install_elixir.sh
```

#### Rubocop

```bash
./install_rubocop.sh
```

#### Audacity

```bash
sudo dnf install audacity
```

#### Soundconverter

```bash
sudo dnf install soundconverter
```

#### Easytag

```bash
sudo dnf install easytag
```

#### Tagtool

```bash
sudo dnf install tagtool
```

#### Simplescreenrecorder

```bash
sudo dnf install simplescreenrecorder
```

#### Youtube DL

```bash
sudo dnf install youtube-dl
```

#### Gimp

```bash
sudo dnf install gimp
```

#### Inkscape

```bash
sudo dnf install inkscape
```

#### Minas

```bash
sudo dnf install gnome-mines
```

#### Node

```bash
sudo dnf install nodejs npm
```

#### SQLite

```bash
sudo dnf install sqlite sqlite-devel sqlite-doc sqlitebrowser
```

#### Yarn

```bash
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo dnf install yarn
```

#### Webpack

```bash
sudo npm install --global webpack
```
