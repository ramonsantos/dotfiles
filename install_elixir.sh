echo -e "\e[1;35mInstalling Elixir... \e[0m\n"

# zsh
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

cp home_dotfiles/.iex.exs $HOME
cp home_dotfiles/.tool-versions $HOME

ERLANG_VERSION=28.0.1
ELIXIR_VERSION=1.18.4-otp-28

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install erlang $ERLANG_VERSION
asdf global erlang $ERLANG_VERSION

asdf install elixir $ELIXIR_VERSION
asdf global elixir $ELIXIR_VERSION
