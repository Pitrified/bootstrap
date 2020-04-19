# setup desktop environment for WSL
# https://github.com/QMonkey/wsl-tutorial

echo ¨¨ >> ~/.bash_aliases.local
echo ¨# WSL¨ >> ~/.bash_aliases.local
echo ¨export DISPLAY=:0.0¨ >> ~/.bash_aliases.local
echo ¨export LIBGL_ALWAYS_INDIRECT=1¨ >> ~/.bash_aliases.local

sudo apt install xfce4-terminal
sudo apt install xfce4

# fix missing themes
# https://elementaryos.stackexchange.com/a/3208
sudo apt install gtk2-engines-pixbuf

echo ¨Use startxfce4 to launch¨

# for HiDPI screens
# https://superuser.com/a/1370548
# export GDK_SCALE=0.5
# export GDK_DPI_SCALE=2

# set path color to yellow, put this in ~/.bash_aliases.local
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '

