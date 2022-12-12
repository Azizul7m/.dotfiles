#!/bin/bash

function run {
  if ! pgrep $1; then
    $@ &
  fi
}
#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
# run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
run xrandr --output LVDS1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --mode 1360x768 --pos 1366x0 --rotate normal --output HDMI2 --off --output HDMI3 --off --output VGA1 --off --output VIRTUAL1 --off

#autorandr horizontal
#run caffeine
#run 'variety'
#run '~/.config/awesome/wallpaper.sh'
#run conky -c $HOME/.config/awesome/system-overview
run 'nm-applet'
#run 'pnmixer'
run '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)'
#run 'xfce4-power-manager'
#run 'flameshot',
#run 'synology-drive -minimized',
#run 'steam -silent',
# run  'feh --randomize --bg-fill ~/.wallpapers/',
# run nitrogen,
#run 'gnome-pie'
# run 'picom -b --experimental-backends --config ~/.config/picom.conf'
run 'picom '
run 'clipster -d'
run 'diodon' #clipboard
# run 'pidgin'
run 'telegram-desktop'
run 'rclone mount --allow-non-empty --allow-other --cache-db-purge Dropbox: /mnt/Dropbox'
# run 'qbittorrent'
# run 'nheko'
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
