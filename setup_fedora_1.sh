USER=ramonsantos
HOME=/home/ramonsantos
DROPBOX_DOWNLOAD_LINK="https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2020.03.04-1.fedora.x86_64.rpm"
ASDF_VERSION=v0.7.8

declare -a PACKAGES_TO_INSTALL=(
  # System Utilities
  "dconf-editor"
  "gconf-editor"
  "gnome-tweak-tool"
  "p7zip"
  "unzip"
  "p7zip-plugins"
  "xclip"
  "snapd"
  "util-linux-user"
  "grubby"

  # Multimedia Applications
  "vlc"
  "audacity"
  "soundconverter"
  "easytag"
  "tagtool"
  "simplescreenrecorder"
  "spotify-client"
  "youtube-dl"

  # Internet Applications
  "chromium"
  "telegram-desktop"
  "transmission-gtk"

  # Graphics and Office Applications
  "libreoffice-langpack-pt-BR"
  "gimp"
  "inkscape"
  "dia"
  "pinta"
  "calibre"

  # Games
  "gnome-mines"
  "steam"

  # Development Utilities
  "ImageMagick"
  "graphviz"
  "zlib"
  "zlib-devel"
  "libxslt"
  "libxslt-devel"
  "gcc-c++"
  "patch"
  "readline"
  "readline-devel"
  "libyaml-devel"
  "libffi-devel"
  "openssl-devel"
  "make"
  "bzip2"
  "autoconf"
  "automake"
  "libtool"
  "bison"
  "curl"
  "unixODBC-devel"
  "redhat-rpm-config"

  # Codium
  "codium"
  # Git
  "git-core gitg"
  # Vim
  "vim"
  # Node
  "nodejs npm"
  # SQLite
  "sqlite sqlite-devel sqlite-doc sqlitebrowser"
  # Redis
  "redis"
  # PostgreSQL
  "postgresql postgresql-devel"
  # Docker
  "docker docker-compose"
  # Yarn
  "yarn"
  # Zsh
  "zsh"
)

function add_repositories() {
  sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
  printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo
  sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
  sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo -y
  sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-steam.repo -y
  curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
}

function update_repositories() {
  sudo dnf makecache -y && sudo dnf check-update
}

function update_system() {
  sudo dnf update -y
}

function install_packages() {
  INSTALL="sudo dnf install "

  for i in "${PACKAGES_TO_INSTALL[@]}"
  do
    INSTALL="${INSTALL} $i"
  done

  INSTALL="${INSTALL} -y"

  $INSTALL
}

function config_kernel() {
  sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0" --make-default
}

function setup_snap() {
  sudo ln -s /var/lib/snapd/snap /snap
}

function install_dropbox() {
  wget $DROPBOX_DOWNLOAD_LINK
  sudo dnf localinstall *nautilus-dropbox*.rpm -y
}

function install_atom() {
  wget https://atom.io/download/rpm -O atom.rpm
  sudo dnf localinstall atom.rpm -y
}

function config_language() {
  sudo dnf install system-config-language -y
}

function install_oh_my_zsh() {
  wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
  chmod +x install.sh
  RUNZSH=no CHSH=yes ./install.sh
  chsh -s $(which zsh) $USER
  rm install.sh
}

function install_asdf() {
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $ASDF_VERSION
}

# Main
add_repositories
update_repositories
update_system
install_packages
config_kernel
setup_snap
install_dropbox
install_atom
config_language
install_oh_my_zsh
install_asdf
