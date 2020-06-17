#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run /usr/bin/xsettingsd
# run ~/.config/i3/scripts/bingwallpaper.sh 
run /usr/bin/urxvtd -q -f -o 
run /usr/bin/picom --config ~/.config/compton/compton.conf --experimental-backends 
run /usr/bin/nm-applet --sm-disable
run /usr/lib/pam_kwallet_init
run /usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets
run /usr/bin/flameshot 
run ~/.config/awesome/scripts/nutstore.sh
run pasystray
run /usr/bin/fcitx-autostart
run /usr/bin/fcitx5 -d
