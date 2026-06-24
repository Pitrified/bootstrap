# curl
sudo apt install curl -y

# gpg
sudo apt install -y gpg

# FZF
# https://github.com/junegunn/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

mkdir ~/setup_bootstrap
cd ~/setup_bootstrap

# EXA (now EZA)
# https://github.com/eza-community/eza/blob/main/INSTALL.md
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# BAT
# https://github.com/sharkdp/bat
BAT_V="0.26.1"
wget https://github.com/sharkdp/bat/releases/download/v${BAT_V}/bat_${BAT_V}_amd64.deb
sudo dpkg -i bat_${BAT_V}_amd64.deb
# https://github.com/sharkdp/bat/issues/982 https://github.com/sharkdp/bat/issues/1420
# alias bat='batcat' ? how is this permanent?
ln -s /usr/bin/bat ~/.local/bin/batcat

# HACK FONT
# https://github.com/source-foundry/Hack
sudo apt -y install fonts-hack-ttf

# useful to find files
sudo apt -y install plocate

# # tweak gnome settings
# sudo apt -y install gnome-tweaks

# fancy search tool
sudo apt -y install silversearcher-ag

# 7zip
sudo apt -y install p7zip-full
sudo snap install p7zip-desktop

# clipboard
sudo apt -y install xclip

# vscode
sudo snap install code --classic

# claude
curl -fsSL https://claude.ai/install.sh | bash

echo "Remember to manually do 'source ~/.bashrc'"
