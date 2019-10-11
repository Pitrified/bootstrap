# https://askubuntu.com/a/971577
# look at the output of `dconf watch /` and manually change the option to see
# which key to set

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.nautilus.desktop trash-icon-visible false
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.mutter attach-modal-dialogs false

gsettings set org.gnome.settings-daemon.plugins.media-keys home '<Super>e'
gsettings set org.gnome.settings-daemon.plugins.media-keys www '<Super>w'
