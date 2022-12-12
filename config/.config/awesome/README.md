## Material and Mouse driven theme for [AwesomeWM 4.3](https://awesomewm.org/)

Note: This fork focuses on streamlining the config and adding some Quality of Life touches to the theme.

## Installation

###  Get all the dependencies

#### Debian-Based

```
sudo apt install awesome fonts-roboto rofi compton i3lock xclip qt5-style-plugins materia-gtk-theme lxappearance xbacklight flameshot nautilus xfce4-power-manager pnmixer network-manager-gnome policykit-1-gnome -y
wget -qO- https://git.io/papirus-icon-theme-install | sh
```

#### Arch-Based

```
yay -S awesome rofi picom roficlip  xclip ttf-roboto polkit-gnome materia-theme lxappearance flameshot pnmixer pipewire yad pavucontrol acpi  network-manager-applet  qt5-styleplugins  -y
```

#### Program list

- [AwesomeWM](https://awesomewm.org/) as the window manager - universal package install: awesome
- [Roboto](https://fonts.google.com/specimen/Roboto) as the **font** - Debian: fonts-roboto Arch: ttf-roboto
- [Rofi](https://github.com/DaveDavenport/rofi) for the app launcher - universal install: rofi
- [picom](https://github.com/yshui/picom) for the compositor (blur and animations) universal install: picom - Debian users need PPA (`sudo add-apt-repository ppa:regolith-linux/unstable`) _Note: I recommend Compton for Debian Users and the Debian Branch_
- [xclip](https://github.com/astrand/xclip) for copying screenshots to clipboard package: xclip
- [gnome-polkit] recommend using the gnome-polkit as it integrates nicely for elevating programs that need root access
- [Materia](https://github.com/nana-4/materia-theme) as GTK theme - Arch Install: materia-theme debian: materia-gtk-theme
- [Papirus Dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) as icon theme Universal Install: wget -qO- https://git.io/papirus-icon-theme-install | sh
- [lxappearance](https://sourceforge.net/projects/lxde/files/LXAppearance/) to set up the gtk and icon theme
- (Laptop) [xbacklight](https://www.x.org/archive/X11R7.5/doc/man/man1/xbacklight.1.html) for adjusting brightness on laptops (disabled by default)
- [flameshot](https://flameshot.org/) my personal screenshot utility of choice, can be replaced by whichever you want, just remember to edit the apps.lua file
- [pnmixer](https://github.com/nicklan/pnmixer) Audio Tray icon that is in debian repositories and is easily installed on arch through AUR.
- [network-manager-applet](https://gitlab.gnome.org/GNOME/network-manager-applet) nm-applet is a Network Manager Tray display from GNOME.



### Set the themes

Start `lxappearance` to activate the **icon** theme and **GTK** theme.
Note: for cursor theme, edit `~/.icons/default/index.theme` and `~/.config/gtk3-0/settings.ini`, for the change to also show up in applications run as root, copy the 2 files over to their respective place in `/root`.

###  Same theme for Qt/KDE applications and GTK applications, and fix missing indicators

First install `qt5-style-plugins` (debian) | `qt5-styleplugins` (arch) and add this to the bottom of your `/etc/environment`

```bash
XDG_CURRENT_DESKTOP=Unity
QT_QPA_PLATFORMTHEME=gtk2
```
