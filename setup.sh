#!/bin/bash

echo "Installing the coolest packages ever"

sudo apt update

# ZSH accomponied with TMUX for losers
sudo apt install zsh terminator 

# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Impacket download
git clone https://github.com/SecureAuthCorp/impacket.git /opt/ 
pip install -r /opt/impacket/requirements.txt

# AutoRecon for CTF things
git clone https://github.com/Tib3rius/AutoRecon.git /opt/
pip install -r /opt/AutoRecon/requirements.txt

# Setup for terminator themes
# https://github.com/EliverLara/terminator-themes
pip install requests
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"

