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
run 'variety'
run '~/.config/awesome/wallpaper.sh'
#run conky -c $HOME/.config/awesome/system-overview
run 'nm-applet --indicator'
#run 'pnmixer'
run '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)'
run 'xfce4-power-manager'
#run 'flameshot',
#run 'synology-drive -minimized',
#run 'steam -silent',
#run  'feh --randomize --bg-fill ~/.wallpapers/*',
run 'gnome-pie'
run 'picom'
#run 'telegram-desktop'
#run 'pamac-tray'
#you can set wallpapers in themes as well
#run applications from startup
#run firefox
#run atom
#run dropbox
#run insync start
#run spotify
#run ckb-next -b
#run discord
