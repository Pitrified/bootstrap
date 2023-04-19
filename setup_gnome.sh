# https://askubuntu.com/a/971577
# look at the output of `dconf watch /`
# manually change the option to see which key to set
# remember the space for the last / when changing / to .

# theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super>w']"

# alt tab only shows windows in current workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true
# alt tab shows separate windows, not grouped by application
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
# alt ` to change within same app (backward not working)
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>grave']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Alt>grave']"

# secondary monitors linked to single workspace
gsettings set org.gnome.mutter workspaces-only-on-primary false

# top bar
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-weekday true

# enable night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic true

# setup dock
gsettings set org.gnome.shell favorite-apps  "[]"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
# https://askubuntu.com/a/1250030
# https://bugs.launchpad.net/ubuntu/+source/gnome-shell-extension-ubuntu-dock/+bug/1870519
# https://discourse.ubuntu.com/t/ubuntu-dock-add-true-autohide-option-to-default-session/11200/4
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
gsettings set org.gnome.shell.extensions.dash-to-dock pressure-threshold 100
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-only-mounted true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-network false
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false

# let modal dialogs move independently from the main windows
gsettings set org.gnome.mutter attach-modal-dialogs false

# hide home and trash folders from the desktop
# gsettings set org.gnome.nautilus.desktop trash-icon-visible false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
# 22.04
gsettings set org.gnome.shell.extensions.ding show-home false

# setup the terminal
# https://ncona.com/2019/11/configuring-gnome-terminal-programmatically/
GNOME_TERMINAL_PROFILE=`gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}'`
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ default-size-columns 130
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ default-size-rows 30
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ scrollbar-policy 'never'

# setup default columns on nautilus
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'date_modified_with_time', 'detailed_type']"

# theme for gedit
gsettings set org.gnome.gedit.preferences.editor scheme 'cobalt'

# show hidden files
gsettings set org.gtk.settings.file-chooser show-hidden true
