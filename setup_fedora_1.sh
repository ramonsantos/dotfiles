USER=ramonsantos
HOME=/home/ramonsantos

declare -a PACKAGES_TO_INSTALL=(
  # System Utilities
  "dconf-editor"
  "gconf-editor"
  "gnome-tweak-tool"
  "p7zip"
  "unzip"
  "p7zip-plugins"
  "xclip"
  "util-linux-user"
  "grubby"
  "dnf-plugins-core"
  "bluez bluez-tools rfkill blueman"

  # Multimedia Applications
  "vlc"

  # Internet Applications
  "google-chrome-stable"
  "telegram-desktop"
  "transmission-gtk"

  # Graphics and Office Applications
  "libreoffice-langpack-pt-BR"
  "dia"
  "pinta"
  "calibre"

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
  # Redis
  "redis"
  # PostgreSQL
  "postgresql postgresql-devel"
  # Docker
  "docker docker-compose"
  # Zsh
  "zsh"
)

function add_repositories() {
  echo -e "\e[1;35mAdding Repositories... \e[0m\n"

  sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
  sudo dnf config-manager --set-enabled google-chrome
}

function update_repositories() {
  echo -e "\e[1;35mUpdating Repositories... \e[0m\n"

  sudo dnf makecache -y && sudo dnf check-update
}

function update_system() {
  echo -e "\e[1;35mUpdating System... \e[0m\n"

  sudo dnf update -y
}

function install_package_groups() {
  sudo dnf groupinstall -y 'Development Tools' 'C Development Tools and Libraries'
}

function install_packages() {
  echo -e "\e[1;35mInstalling Packages... \e[0m\n"

  INSTALL="sudo dnf install "

  for i in "${PACKAGES_TO_INSTALL[@]}"
  do
    INSTALL="${INSTALL} $i"
  done

  INSTALL="${INSTALL} -y"

  $INSTALL
}

function config_kernel() {
  echo -e "\e[1;35mConfiguring Kernel... \e[0m\n"

  sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0" --make-default
}

function config_language() {
  echo -e "\e[1;35mConfiguring Language... \e[0m\n"

  sudo dnf install system-config-language -y
}

function install_postman() {
  echo -e "\e[1;35mInstalling Postman... \e[0m\n"

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

# Main
add_repositories
update_repositories
update_system
install_package_groups
install_packages
config_kernel

config_language
install_postman

