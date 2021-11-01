#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal
#run caffeine
run variety
run wallpaper
run conky -c $HOME/.config/awesome/system-overview
#you can set wallpapers in themes as well
#run applications from startup
#run firefox
#run atom
#run dropbox
#run insync start
#run spotify
#run ckb-next -b
#run discord
run telegram-desktop
run gnome-pie
