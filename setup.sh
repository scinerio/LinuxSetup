#!/bin/bash

echo "Installing the coolest packages ever"

sudo apt update

sudo apt install -y python3-pip gobuster zsh 

# Pip installations
wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
python /tmp/get-pip.py
rm /tmp/get-pip.py

# Impacket download
mkdir /opt/impacket
git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacket
pip install -r /opt/impacket/requirements.txt
python /opt/impacket/setup.py install

# Pentester Framework
mkdir /opt/ptf
git clone https://github.com/trustedsec/ptf.git /opt/ptf
pip install -r /opt/ptf/requirements.txt 

# AutoRecon for CTF things
git clone https://github.com/Tib3rius/AutoRecon.git /opt/AutoRecon
pip install -r /opt/AutoRecon/requirements.txt

# Color themes
sudo apt install -y terminator
pip install requests
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Set ZSH as default shell
sudo chsh -s $(which zsh)
