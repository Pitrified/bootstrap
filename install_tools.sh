# FZF
# https://github.com/junegunn/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

mkdir ~/setup_bootstrap
cd ~/setup_bootstrap

# EXA
# https://the.exa.website/
EXA_V="0.10.1"
wget https://github.com/ogham/exa/releases/download/v${EXA_V}/exa-linux-x86_64-v${EXA_V}.zip
unzip exa-linux-x86_64-v${EXA_V}.zip
cp ~/setup_bootstrap/bin/exa ~/.local/bin/

# BAT
# https://github.com/sharkdp/bat
BAT_V="0.23.0"
wget https://github.com/sharkdp/bat/releases/download/v${BAT_V}/bat_${BAT_V}_amd64.deb
sudo dpkg -i bat_${BAT_V}_amd64.deb
# https://github.com/sharkdp/bat/issues/982 https://github.com/sharkdp/bat/issues/1420
alias bat='batcat'
ln -s /usr/bin/bat ~/.local/bin/batcat

# HACK FONT
# https://github.com/source-foundry/Hack
sudo apt -y install fonts-hack-ttf

# useful to find files
sudo apt -y install plocate

# tweak gnome settings
sudo apt -y install gnome-tweaks

# fancy search tool
sudo apt -y install silversearcher-ag

# 7zip
sudo apt -y install p7zip-full
sudo snap install p7zip-desktop

# clipboard
sudo apt -y install xclip

# vscode
sudo snap install code --classic

echo ¨Remember to manually do ´source ~/.bashrc´¨
