echo -e "\e[1;35m Installing Elixir... \e[0m\n"

ERLANG_VERSION=24
ELIXIR_VERSION=1.12-otp-24

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install erlang $ERLANG_VERSION
asdf global erlang $ERLANG_VERSION

asdf install elixir $ELIXIR_VERSION
asdf global elixir $ELIXIR_VERSION
