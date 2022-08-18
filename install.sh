#! /usr/bin/sh 

sudo apt update
# Install git 
sudo apt install -y git 

# Install pip
sudo apt install -y python3-pip

# Install tmux 
sudo apt install -y tmux tmuxinator

# Install i3
sudo apt install -y i3 i3status

# Install kitty 
sudo apt install -y curl
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/



