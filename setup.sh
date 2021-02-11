#!/bin/bash

echo "Updating apt"
sudo apt update

echo "Installing the coolest packages ever"

sudo apt install -y python3-pip gobuster zsh terminator

# Pip installations
#wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
#python /tmp/get-pip.py
#rm /tmp/get-pip.py

echo "Making directories in /opt"
mkdir /opt/impacket
mkdir /opt/ptf
mkdir -p $HOME/.config/terminator/plugins
mkdir /opt/pwncat
mkdir /opt/ffuf

echo "Cloning git repos"
# Impacket 
git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacket
# Pentester Framework
git clone https://github.com/trustedsec/ptf.git /opt/ptf
# AutoRecon
git clone https://github.com/Tib3rius/AutoRecon.git /opt/AutoRecon
# Color themes for Terminator
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
# ZSH Autosuggestion plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# Pwncat
git clone https://github.com/calebstewart/pwncat.git /opt/pwncat
# FFUF
git clone https://github.com/ffuf/ffuf.git /opt/ffuf

echo "Installing dependencies"
python3 /opt/impacket/setup.py install
pip3 install -r /opt/impacket/requirements.txt
pip install -r /opt/ptf/requirements.txt 
pip3 install -r /opt/AutoRecon/requirements.txt
pip3 install pysmb
pip install requests


echo "Linking syms"
# Symlink ZSH config for root user
ln -s $HOME/.oh-my-zsh           /root/.oh-my-zsh
ln -s $HOME/.zshrc               /root/.zshrc



echo "Changing default shell to zsh"
sudo chsh -s $(which zsh)

# Docker
curl -fsSL https://get.docker.com | bash
# Docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose





