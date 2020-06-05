#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run /usr/bin/xsettingsd
run /usr/bin/urxvtd
run /usr/bin/picom --config ~/.config/compton/compton.conf --experimental-backends 
run /usr/bin/nm-applet --sm-disable
run /usr/bin/fcitx-autostart
