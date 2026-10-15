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

# add path, above the interactivity guard in ~/.bashrc: non-interactive shells
# (ssh commands, Claude sessions) need uv and claude too, and .bashrc returns at
# the guard, before ~/.bash_aliases.local is read
mkdir -p ~/.local/bin
if ! grep -q '# ~/.local/bin (uv, claude) for non-interactive shells' ~/.bashrc; then
    cp ~/.bashrc ~/.bashrc.bak-before-localbin
    python3 - <<'EOF'
import pathlib
p = pathlib.Path.home() / ".bashrc"
s = p.read_text()
block = '''# ~/.local/bin (uv, claude) for non-interactive shells too: .bashrc returns at the
# interactivity guard below, before any alias file is read.
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

'''
anchor = "# If not running interactively"
assert anchor in s, "interactivity guard not found in ~/.bashrc"
p.write_text(s.replace(anchor, block + anchor, 1))
EOF
fi

# misc folders
mkdir ~/ephem
mkdir ~/repos

git clone https://github.com/Pitrified/repomgr.git ~/repos/repomgr

# sudo apt -y install tmux
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# TODO add teamocil install
# https://github.com/remi/teamocil

echo "Remember to manually do 'source ~/.bashrc'"
