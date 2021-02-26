# https://askubuntu.com/a/971577
# look at the output of `dconf watch /`
# manually change the option to see which key to set

# theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super>w']"

# alt tab only shows windows in current workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true
# alt tab shows separate windows, not grouped by application
# gsettings set org.gnome.desktop.wm.keybindings switch-applications @as []
# gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward @as []
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
# alt ` to change within same app (not really working)
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>grave']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Alt>grave']"

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

# let modal dialogs move independently from the main windows
gsettings set org.gnome.mutter attach-modal-dialogs false

# hide home and trash folders from the desktop
# gsettings set org.gnome.nautilus.desktop trash-icon-visible false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

# setup the terminal
# https://ncona.com/2019/11/configuring-gnome-terminal-programmatically/
GNOME_TERMINAL_PROFILE=`gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}'`
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ default-size-columns 130
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ default-size-rows 30
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ scrollbar-policy 'never'
