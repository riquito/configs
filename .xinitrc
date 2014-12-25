# Start a D-Bus session
source /etc/X11/xinit/xinitrc.d/00-start-message-bus.sh

# Were the default Home folders have not already been created, generate them
if [ -x /usr/bin/xdg-user-dirs-update ]; then
    /usr/bin/xdg-user-dirs-update
fi

# enable DEL key on st (simple terminal, by suckless.org)
# set enable-keypad on # doesn't seem to work
echo $(tput smkx) >/dev/tty

[[ -f ~/.Xresources ]]  && xrdb -merge ~/.Xresources
[[ -f ~/.urxvt.conf ]]  && xrdb -merge ~/.urxvt.conf
[[ -f ~/.urxvt-theme ]] && xrdb -merge ~/.urxvt-theme

# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# this is probably not needed anymore
# https://www.gnupg.org/faq/whats-new-in-2.1.html#autostart
export GPG_AGENT_INFO

# note: since gnome-keyring-daemon 3.11.92
# these variables do not need to be exposed anymore
# http://ftp.gnome.org/pub/GNOME/sources/gnome-keyring/3.11/gnome-keyring-3.11.92.changes
export GNOME_KEYRING_PID
export GNOME_KEYRING_CONTROL

if [ -f ~/.xmonad/bin/tray ]; then
    ~/.xmonad/bin/tray &
fi

xsetroot -solid "#002b36"

gnome-screensaver&
#gnome-settings-daemon
#if [ -x /usr/bin/gnome-power-manager ] ; then
   #sleep 1
   #gnome-power-manager&
#fi

# Gnome NetworkManager. 
# Note: to work well we may need desktop notifications
# https://wiki.archlinux.org/index.php/NetworkManager#Openbox
if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

#if [ -x /usr/bin/ibus-daemon ] ; then
#   ibus-daemon -r -x -d
#fi

#gnome-sound-applet &
volumeicon&

#dropbox start &
