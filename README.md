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
sudo -E ./setup_centos.sh.sh
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
./install_flatpak_packages.sh
```

### Setup Docker

Run:

```bash
sudo ./config_docker.sh
```

### Install Docker (CentOS)

Run:

```bash
sudo ./install_docker.sh.sh
```

## Optional

#### Nvidia driver by RPM Fusion

```bash
sudo dnf install akmod-nvidia
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

#### Aton

```bash
wget https://atom.io/download/rpm -O atom.rpm
sudo dnf localinstall atom.rpm -y
```
