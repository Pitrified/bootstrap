# I have no idea where this should be, but I don't really like it here
mkdir ~/.local
mkdir ~/.local/bin
# this might be done in ~/.profile already
echo "export PATH=\$PATH:~/.local/bin" >> ~/.bash_aliases.local

# FZF
# https://github.com/junegunn/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# EXA
# https://the.exa.website/
# since Ubuntu 20.10
sudo apt install exa
# mkdir ~/setup_bootstrap
# cd ~/setup_bootstrap
# wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-0.10.0.zip
# unzip exa-linux-x86_64-0.10.0.zip
# mv exa-linux-x86_64 ~/.local/bin/exa

# BAT
# https://github.com/sharkdp/bat
# since Ubuntu 19.10
sudo apt install bat
# wget https://github.com/sharkdp/bat/releases/download/v0.21.0/bat_0.21.0_amd64.deb
# sudo dpkg -i bat_0.21.0_amd64.deb

# HACK FONT
# https://github.com/source-foundry/Hack
sudo apt -y install fonts-hack-ttf

echo ¨Remember to manually do ´source ~/.bashrc´¨
