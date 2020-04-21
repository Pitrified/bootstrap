# FZF
# https://github.com/junegunn/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# EXA
# https://the.exa.website/
mkdir ~/setup
cd ~/setup
wget https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
unzip exa-linux-x86_64-0.9.0.zip
mkdir ~/.local
mkdir ~/.local/bin
mv exa-linux-x86_64 ~/.local/bin/exa
# this might be done in ~/.profile already
echo "export PATH=\$PATH:~/.local/bin" >> ~/.bash_aliases.local

# BAT
# https://github.com/sharkdp/bat
wget https://github.com/sharkdp/bat/releases/download/v0.13.0/bat_0.13.0_amd64.deb
sudo dpkg -i bat_0.13.0_amd64.deb

# HACK FONT
# https://github.com/source-foundry/Hack
sudo apt -y install fonts-hack-ttf

echo ¨Remember to manually do ´source ~/.bashrc´¨
