echo -e "\e[1;35mInstalling Elixir... \e[0m\n"

# zsh
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

cp .iex.exs $HOME
cp .tool-versions $HOME

ERLANG_VERSION=24
ELIXIR_VERSION=1.12-otp-24

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install erlang $ERLANG_VERSION
asdf global erlang $ERLANG_VERSION

asdf install elixir $ELIXIR_VERSION
asdf global elixir $ELIXIR_VERSION
