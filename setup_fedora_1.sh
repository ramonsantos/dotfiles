USER=ramonsantos
HOME=/home/ramonsantos
DROPBOX_DOWNLOAD_LINK="https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2020.03.04-1.fedora.x86_64.rpm"

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
  "dnf-plugins-core"
  "bluez bluez-tools rfkill"

  # Multimedia Applications
  "vlc"
  "audacity"
  "soundconverter"
  "easytag"
  "tagtool"
  "simplescreenrecorder"
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

  # Development Utilities
  "ImageMagick"
  "graphviz"
  "zlib"
  "zlib-devel"
  "libxslt"
  "libxslt-devel"
  "fop"
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
  "ncurses-devel"
  "systemtap"
  "diffstat"
  "doxygen"
  "patchutils"
  "java-1.8.0-openjdk-devel"
  "wxGTK3-devel"
  "wxBase3"
  "libiodbc"
  "unixODBC.x86_64"
  "erlang-odbc.x86_64"


  # VS Code
  "code"
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
  echo -e "\e[1;35m Adding Repositories... \e[0mww\n"

  sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
  curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
}

function update_repositories() {
  echo -e "\e[1;35m Updating Repositories... \e[0mww\n"

  sudo dnf makecache -y && sudo dnf check-update
}

function update_system() {
  echo -e "\e[1;35m Updating System... \e[0mww\n"

  sudo dnf update -y
}

function install_package_groups() {
  sudo dnf groupinstall -y 'Development Tools' 'C Development Tools and Libraries'
}

function install_packages() {
  echo -e "\e[1;35m Installing Packages... \e[0mww\n"

  INSTALL="sudo dnf install "

  for i in "${PACKAGES_TO_INSTALL[@]}"
  do
    INSTALL="${INSTALL} $i"
  done

  INSTALL="${INSTALL} -y"

  $INSTALL
}

function config_kernel() {
  echo -e "\e[1;35m Configuring Kernel... \e[0mww\n"

  sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0" --make-default
}

function setup_snap() {
  echo -e "\e[1;35m Configuring Snap... \e[0mww\n"

  sudo ln -s /var/lib/snapd/snap /snap
}

function install_atom() {
  echo -e "\e[1;35m Installing Atom... \e[0mww\n"

  wget https://atom.io/download/rpm -O atom.rpm
  sudo dnf localinstall atom.rpm -y
}

function config_language() {
  echo -e "\e[1;35m Configuring Language... \e[0mww\n"

  sudo dnf install system-config-language -y
}

function install_postman() {
  echo -e "\e[1;35m Installing Postman... \e[0mww\n"

  wget https://dl.pstmn.io/download/latest/linux64
  sudo mv linux64 /opt
  cd /opt
  sudo tar xzvf linux64
  sudo rm linux64
  sudo ln -s /opt/Postman/Postman /usr/local/bin/postman

  cat > ~/.local/share/applications/postman.desktop <<EOT
[Desktop Entry]
Name=Postman
GenericName=API Client
X-GNOME-FullName=Postman API Client
Comment=Make and view REST API calls and responses
Keywords=api;
Exec=/usr/local/bin/postman
Terminal=false
Type=Application
Icon=/opt/Postman/app/resources/app/assets/icon.png
Categories=Development;Utilities;
EOT
}

function install_node_packages() {
  echo -e "\e[1;35m Installing NodeJS Packages... \e[0mww\n"

  sudo npm install --global webpack
}

function install_dropbox() {
  echo -e "\e[1;35m Installing Dropbox... \e[0mww\n"

  wget $DROPBOX_DOWNLOAD_LINK
  sudo dnf localinstall *nautilus-dropbox*.rpm -y
}

# Main
add_repositories
update_repositories
update_system
install_package_groups
install_packages
config_kernel
setup_snap
install_atom
config_language
install_postman
install_node_packages
install_dropbox
