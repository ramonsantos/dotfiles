echo -e "\e[1;35mInstalling Ruby... \e[0m\n"

RUBY_VERSION=3.4.6

function install_rbenv() {
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
}

function install_ruby() {
  rbenv install $RUBY_VERSION
  rbenv global $RUBY_VERSION
}

install_rbenv
install_ruby
