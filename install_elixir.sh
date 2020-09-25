ASDF_VERSION=v0.8.0
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $ASDF_VERSION


ERLANG_VERSION=22.2.4
ELIXIR_VERSION=1.10.0-otp-22

sudo dnf install ncurses-devel systemtap diffstat doxygen patchutils java-1.8.0-openjdk-devel wxGTK3-devel wxBase3 libiodbc unixODBC.x86_64 erlang-odbc.x86_64

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install erlang $ERLANG_VERSION
asdf global erlang $ERLANG_VERSION

asdf install elixir $ELIXIR_VERSION
asdf global elixir $ELIXIR_VERSION
