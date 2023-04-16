sudo add-apt-repository ppa:jonathonf/vim -y
sudo apt update
sudo apt -y install vim-gtk
sudo apt -y install libcanberra-gtk-module
sudo apt -y install libcanberra-gtk3-module

mkdir ~/.myvim
mkdir ~/.myvim/swap
mkdir ~/.myvim/undo
mkdir ~/.myvim/backup

# black needs this to create its venv
sudo apt install python3-venv -y
# YouCompleteMe needs these
sudo apt install build-essential cmake python3-dev -y
# vim needs this to clone Plug
sudo apt install curl -y
# TODO this needs to be manually closed
vim +PlugInstall
# compile YouCompleteMe
python3 ~/dotfiles/vim.symlink/plugged/YouCompleteMe/install.py --clang-completer --go-completer

