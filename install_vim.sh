sudo apt -y install vim-gtk3
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
# TODO this needs to be manually closed
vim +PlugInstall
# # compile YouCompleteMe
# python3 ~/dotfiles/vim.symlink/plugged/YouCompleteMe/install.py --clang-completer --go-completer

