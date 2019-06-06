# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
source ~/.bashrc 

# EXA
mkdir ~/setup
cd ~/setup
wget https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
unzip exa-linux-x86_64-0.8.0.zip

mkdir ~/.local
mkdir ~/.local/bin
mv exa-linux-x86_64 ~/.local/bin/exa
echo "export PATH=\$PATH:~/.local/bin" >> ~/.bash_aliases.local

# BAT
wget https://github.com/sharkdp/bat/releases/download/v0.11.0/bat_0.11.0_amd64.deb
sudo dpkg -i bat_0.11.0_amd64.deb
source ~/.bashrc 

sudo apt -y install fonts-hack-ttf
