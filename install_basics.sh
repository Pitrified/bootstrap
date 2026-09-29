sudo apt update
sudo apt -y upgrade
sudo apt autoremove -y

sudo apt install curl

# sudo apt -y install python3-pip

# sudo apt -y install chromium-browser
# sudo apt -y install openjdk-8-jdk

# install uv, and make it usable for the rest of *this* script run
# (the installer only persists PATH for future shells via rc-file
# sourcing, not the already-running script)
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"

git clone https://github.com/Pitrified/dotfiles.git ~/dotfiles
uv run --project ~/dotfiles/install ~/dotfiles/install/install.py

# add path
mkdir ~/.local
mkdir ~/.local/bin
echo "export PATH=\$PATH:~/.local/bin" >> ~/.bash_aliases.local

# misc folders
mkdir ~/ephem
mkdir ~/repos

git clone https://github.com/Pitrified/repomgr.git ~/repos/repomgr

# sudo apt -y install tmux
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# TODO add teamocil install
# https://github.com/remi/teamocil

echo "Remember to manually do 'source ~/.bashrc'"
