#!/bin/bash

echo ""
echo "Getting on work for zsh"
echo ""

sudo apt update
sudo apt upgrade
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -n 'alias pgstart="pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres start"' >> ~/.zshrc
echo -n 'alias pgstop="pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres stop"' >> ~/.zshrc
chsh -s /bin/zsh
source ~/.zshrc

brew install postgres
psql postgres -c "CREATE USER postgres WITH PASSWORD 'postgres';"
psql postgres -c "ALTER USER postgres WITH SUPERUSER;"
pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgres start
brew install rbenv
brew install ruby
brew install elixir
brew install node

echo ""
echo "You are set to go"
echo ""
echo "I've fixed some aliases for you"
echo ""
echo "psgstart  => to start your postgres server"
echo "pgstop    => to stop your postgres server"
echo ""
echo ""
echo "You should be able to start your development right away with the following"
echo ""
echo ""
echo "======== Elixir ========"
echo ""
echo "Version: $(elixir -v)"
echo "Path   : $(which elixir)"
echo ""
echo "======== Ruby ========"
echo ""
echo "Version: $(ruby -v)"
echo "Path : $(which ruby)"
echo ""
echo "======== Rbenv ========"
echo ""
echo "Version: $(rbenv -v)"
echo "Path : $(which rbenv)"
echo ""
echo "======== Postgres ========"
echo ""
echo "Version: $(postgres -V)"
echo "Path   : $(which postgres)"
echo ""
echo "======== Node ========"
echo ""
echo "Version: $(node -v)"
echo "Path   : $(which node)"
echo ""
echo "Happy Hacking!"
