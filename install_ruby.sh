echo -e "\e[1;35m Installing Ruby... \e[0mww\n"

RUBY_VERSION=2.7.1

declare -a GEMS_TO_INSTALL=(
  "amazing_print"
  "bundler"
  "pry"
  "rubocop"
  "rubocop-performance"
  "rubocop-rails"
  "rubocop-rspec"
)

function install_rbenv() {
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  git clone https://github.com/rbenv/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
}

function build_default_gems() {
  for i in "${GEMS_TO_INSTALL[@]}"
  do
    echo "$i" >> ~/.rbenv/default-gems
  done
}

function install_ruby() {
  rbenv install $RUBY_VERSION
  rbenv global $RUBY_VERSION
  ruby -v
}

install_rbenv
build_default_gems
install_ruby
