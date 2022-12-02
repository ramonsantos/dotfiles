USER=ramonsantos
HOME=/home/ramonsantos

declare -a PACKAGES_TO_INSTALL=(
  # System Utilities
  "gnome-tweak-tool"
  "p7zip"
  "unzip"
  "p7zip-plugins"
  "xclip"
  "util-linux-user"
  "dnf-plugins-core"
  "ntfs-3g"
  "epson-inkjet-printer-escpr"
  "vlc"

  # Graphics and Office Applications
  "dia"

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
  "libffi-devel"
  "openssl-devel"
  "make"
  "bzip2"
  "autoconf"
  "automake"
  "libtool"
  "bison"
  "curl"
  "redhat-rpm-config"
  "ncurses-devel"
  "systemtap"
  "diffstat"
  "doxygen"
  "patchutils"
  "wxGTK3-devel"
  "wxBase3"
  "libiodbc"
  "perl"
  "dkms"

  # VS Code
  "code"
  # Git
  "git-core"
  # Vim
  "vim"
  # Redis
  "redis"
  # PostgreSQL
  "postgresql postgresql-devel"
  # Zsh
  "zsh"
)

function add_repositories() {
  echo -e "\e[1;35mAdding Repositories... \e[0m\n"

  sudo dnf install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E %rhel).noarch.rpm
  sudo dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm -y

  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

  sudo dnf install epel-release -y

  sudo sh -c 'echo -e "[google-chrome]\nname=google-chrome\nbaseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64\nenabled=1\ngpgcheck=1\ngpgkey=https://dl.google.com/linux/linux_signing_key.pub" > /etc/yum.repos.d/google-chrome.repo'
}

function update_system() {
  echo -e "\e[1;35mUpdating System... \e[0m\n"

  sudo dnf upgrade --refresh -y
}

function install_package_groups() {
  sudo dnf groupinstall -y 'Development Tools' 'RPM Development Tools' 'Empacotador do Fedora'
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
update_system
install_package_groups
install_packages
config_kernel
install_postman
