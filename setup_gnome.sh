# https://askubuntu.com/a/971577
# look at the output of `dconf watch /` and manually change the option to see
# which key to set

# theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys home '<Super>e'
gsettings set org.gnome.settings-daemon.plugins.media-keys www '<Super>w'

# alt tab only shows windows in current workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true
# secondary monitors linked to single workspace
gsettings set org.gnome.mutter workspaces-only-on-primary false

# top bar
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-date true

# enable night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic true

# auto hide dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'

# various
gsettings set org.gnome.mutter attach-modal-dialogs false
gsettings set org.gnome.nautilus.desktop trash-icon-visible false
