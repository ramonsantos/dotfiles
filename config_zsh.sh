wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
chmod +x install.sh
RUNZSH=no CHSH=yes ./install.sh
chsh -s $(which zsh) $USER
rm install.sh

ZSH_CUSTOM=/home/$USER/.oh-my-zsh/custom

cp .zshrc $HOME

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

mkdir ~/.fonts && unzip resource/Hack.zip -d ~/.fonts

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

zsh
