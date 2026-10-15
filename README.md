# Ubuntu setup

## Bootstrap

download [bootstrap.sh](bootstrap.sh), run it, you get this repo

```bash
sudo apt install curl
curl -O https://raw.githubusercontent.com/Pitrified/bootstrap/master/bootstrap.sh
bash bootstrap.sh
```

## Install

### Minimal

Run in this order: `install_tools.sh` expects `~/.local/bin`, which `install_basics.sh` creates.

```bash
bash install_basics.sh
bash install_tools.sh
bash setup_gnome.sh
```

### History

Add useful history for `Ctrl+R` search in bash:

```
cat ~/bootstrap/useful_bash_history.txt >> ~/.bash_history
```

### `install_basics`

* python
* uv
* vim
* dotfiles
* tmux
* gnome tweaks
* silversearcher-ag
* 7zip

### `install_tools`

* fzf
* eza (was exa)
* bat
* hack fonts
* xtermcontrol, shellcheck, zellij

### `install_backup`

* rclone

### `install_git_lfs`

* git-lfs (via packagecloud apt repo, so `apt` tracks the latest release)

### `install_python`

* virtualenv
* black
* pytest

### `install_go`

* golang

### `install_cuda_dep`

* various libs for cuda

### `install_wsl`

* export magic to use the graphical desktop
