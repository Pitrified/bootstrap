sudo apt update
sudo apt -y upgrade
# sudo apt -y install chromium-browser
sudo apt -y install python3-pip
# pip3 install black
# sudo apt -y install openjdk-8-jdk

git clone https://github.com/Pitrified/dotfiles.git ~/dotfiles
python3 ~/dotfiles/install.py

# add path
mkdir ~/.local
mkdir ~/.local/bin
# this might be done in ~/.profile already
echo "export PATH=\$PATH:~/.local/bin" >> ~/.bash_aliases.local

# misc folders
mkdir ~/ephem
mkdir ~/repos

# sudo apt -y install tmux
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# TODO add teamocil install
# https://github.com/remi/teamocil

echo ¨Remember to manually do ´source ~/.bashrc´¨
