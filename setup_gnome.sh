# https://askubuntu.com/a/971577
# look at the output of `dconf watch /`
# manually change the option to see which key to set
# remember the space for the last / when changing / to .

# theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

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
# the ding (desktop icons NG) extension provides these keys
gsettings set org.gnome.shell.extensions.ding show-home false
gsettings set org.gnome.shell.extensions.ding show-trash false

# setup the terminal (Ptyxis)
# size and scrollbar are global keys (not per-profile)
gsettings set org.gnome.Ptyxis default-columns 130
gsettings set org.gnome.Ptyxis default-rows 30
gsettings set org.gnome.Ptyxis scrollbar-policy 'never'
# palette is per-profile; resolve the default profile uuid
PTYXIS_PROFILE=$(gsettings get org.gnome.Ptyxis default-profile-uuid | tr -d \')
gsettings set "org.gnome.Ptyxis.Profile:/org/gnome/Ptyxis/Profiles/$PTYXIS_PROFILE/" palette 'gnome'

# setup default columns on nautilus
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'date_modified_with_time', 'detailed_type']"

# theme for the text editor (GNOME Text Editor)
gsettings set org.gnome.TextEditor style-scheme 'cobalt'

# show hidden files
# set both the GTK3 and GTK4 file chooser schemas
gsettings set org.gtk.Settings.FileChooser show-hidden true
gsettings set org.gtk.gtk4.Settings.FileChooser show-hidden true

# never blank/sleep when on AC power
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'

# break reminders: eyesight + movement, with sounds
gsettings set org.gnome.desktop.break-reminders selected-breaks "['eyesight', 'movement']"
gsettings set org.gnome.desktop.break-reminders.movement interval-seconds 1800
gsettings set org.gnome.desktop.break-reminders.movement duration-seconds 300
gsettings set org.gnome.desktop.break-reminders.movement play-sound true
gsettings set org.gnome.desktop.break-reminders.eyesight play-sound true
