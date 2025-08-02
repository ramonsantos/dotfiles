echo -e "\e[1;35mInstalling Flatpak Packages... \e[0m\n"

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo -y

flatpak install flathub org.gnome.Extensions -y
flatpak install flathub com.dropbox.Client -y
flatpak install flathub com.calibre_ebook.calibre -y
