sudo apt update
sudo apt -y upgrade
sudo apt -y install chromium-browser
sudo apt -y install python3-pip
pip3 install black
sudo apt -y install openjdk-8-jdk

git clone https://github.com/Pitrified/dotfiles.git ~/dotfiles
python3 ~/dotfiles/install.py

sudo add-apt-repository ppa:jonathonf/vim -y
sudo apt update
sudo apt -y install vim-gtk
sudo apt -y install libcanberra-gtk-module
sudo apt -y install libcanberra-gtk3-module

mkdir ~/.myvim
mkdir ~/.myvim/swap
mkdir ~/.myvim/undo
mkdir ~/.myvim/backup

vim +PlugInstall
sudo apt -y install build-essential cmake python3-dev
python3 ~/dotfiles/vim.symlink/plugged/YouCompleteMe/install.py --clang-completer --java-completer

sudo apt -y install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo apt install gnome-tweaks

echo ¨Remember to manually do ´source ~/.bashrc´¨
