sudo apt update
sudo apt -y upgrade
sudo apt -y install chromium-browser
sudo apt -y install python3-pip
sudo apt -y install openjdk-8-jdk

sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt -y install vim-gtk
sudo apt -y install libcanberra-gtk-module
sudo apt -y install libcanberra-gtk3-module

mkdir ~/.myvim
mkdir ~/.myvim/swap
mkdir ~/.myvim/undo
mkdir ~/.myvim/backup

git clone https://github.com/Pitrified/dotfiles.git ~/dotfiles
python3 ~/dotfiles/install.py

vim +PluginInstall +qall
sudo apt -y install build-essential cmake python3-dev
python3 ~/dotfiles/vim.symlink/bundle/YouCompleteMe/install.py \
    --clang-completer \
    --java-completer

sudo apt -y install tmux
source ~/.bashrc 
