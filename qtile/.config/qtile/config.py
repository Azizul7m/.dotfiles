from libqtile.dgroups import simple_key_binder
import os
import re
import socket
import subprocess
from libqtile import qtile
from libqtile.config import Click, Drag, Group, KeyChord, Key, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from typing import List  # noqa: F401from typing import List  # noqa: F401
from colors import colors

mod = "mod4"
myBrowser = "brave"
myTerm = "alacritty"
keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # The essentials
    Key([mod], "Return",
        lazy.spawn(myTerm+" -e fish"),
        desc='Launches My Terminal'
        ),
    Key(['mod1'], "space",
        lazy.spawn('rofi -show drun -font "DejaVu Sans 10" -show-icons'),
        desc='Launches Applications'
        ),
    Key([mod], "o",
        lazy.spawn(
            "dmenu_run -fn 'Operator Mono' -x '450' -y '250' -h '5' -w '500'  -p 'Run: ' "),
        desc='Dmenu'
        ),
    Key([mod], "b",
        lazy.spawn(myBrowser),
        desc='Brave Browser'
        ),

    Key([mod], "e",
        lazy.spawn("emacs"),
        desc='Qutebrowser'
        ),

    Key([mod], "c",
        lazy.spawn("code"),
        desc='Qutebrowser'
        ),

    Key([mod], "Tab",
        lazy.next_layout(),
        desc='Toggle through layouts'
        ),
    Key([mod], "q",
        lazy.window.kill(),
        desc='Kill active window'
        ),
    Key([mod, "shift"], "r",
        lazy.restart(),
        desc='Restart Qtile'
        ),
    Key([mod, "shift"], "q",
        lazy.shutdown(),
        desc='Shutdown Qtile'
        ),
    Key(["control", "shift"], "e",
        lazy.spawn("emacsclient -c -a emacs"),
        desc='Doom Emacs'
        ),
    # Switch focus to specific monitor (out of three)
    Key([mod], "w",
        lazy.to_screen(0),
        desc='Keyboard focus to monitor 1'
        ),
    Key([mod], "r",
        lazy.to_screen(2),
        desc='Keyboard focus to monitor 3'
        ),
    # Switch focus of monitors
    Key([mod], "period",
        lazy.next_screen(),
        desc='Move focus to next monitor'
        ),
    Key([mod], "comma",
        lazy.prev_screen(),
        desc='Move focus to prev monitor'
        ),
    # Treetab controls
    Key([mod, "shift"], "h",
        lazy.layout.move_left(),
        desc='Move up a section in treetab'
        ),
    Key([mod, "shift"], "l",
        lazy.layout.move_right(),
        desc='Move down a section in treetab'
        ),
    # Window controls
    Key([mod], "j",
        lazy.layout.down(),
        desc='Move focus down in current stack pane'
        ),
    Key([mod], "k",
        lazy.layout.up(),
        desc='Move focus up in current stack pane'
        ),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down(),
        lazy.layout.section_down(),
        desc='Move windows down in current stack'
        ),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up(),
        lazy.layout.section_up(),
        desc='Move windows up in current stack'
        ),
    Key([mod], "h",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
        ),
    Key([mod], "l",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'
        ),
    Key([mod], "n",
        lazy.layout.normalize(),
        desc='normalize window size ratios'
        ),
    Key([mod], "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'
        ),
    Key([mod, "shift"], "f",
        lazy.window.toggle_floating(),
        desc='toggle floating'
        ),
    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'
        ),
    # Stack controls
    Key([mod, "shift"], "Tab",
        lazy.layout.rotate(),
        lazy.layout.flip(),
        desc='Switch which side main pane occupies (XmonadTall)'
        ),
    Key([mod], "space",
        lazy.layout.next(),
        desc='Switch window focus to other pane(s) of stack'
        ),
    Key([mod, "shift"], "space",
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack'
        ),
    # INCREASE/DECREASE/MUTE VOLUME
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),


    # Emacs programs launched using the key chord CTRL+e followed by 'key'
    KeyChord([mod], "space", [
        Key([], "e",
            lazy.spawn("pcmanfm"),
            desc='Launch File Explorar'
            ),
        Key([], "b",
            lazy.spawn("firefox"),
            desc='Launch Firefox'
            ),
        Key([], "c",
            lazy.spawn(
            "neochat"),
            desc='Chat Now'
            ),
        Key([], "p",
            lazy.spawn("pstorm"),
            desc='Launch PhpStorm'
            ),
 

        Key([], "g",
            lazy.spawn("gfeeds"),
            desc='Launch Gnome Feeds'
            ),

        Key([], "m",
            lazy.spawn("emacsclient -c -a 'emacs' --eval '(mu4e)'"),
            desc='Launch mu4e inside Emacs'
            ),
        Key([], "d",
            lazy.spawn("emacsclient -c -a 'emacs' --eval '(docker)'"),
            desc='Launch elfeed inside Emacs'
            ),
        Key([], "s",
            lazy.spawn("emacsclient -c -a 'emacs' --eval '(eshell)'"),
            desc='Launch the eshell inside Emacs'
            ),
        Key([], "v",
            lazy.spawn(
            "emacsclient -c -a 'emacs' --eval '(+vterm/here nil)'"),
            desc='Launch vterm inside Emacs'
            )
    ]),
    # Dmenu scripts launched using the key chord SUPER+p followed by 'key'
    KeyChord(['mod1'], "p", [
        Key([], "e",
            lazy.spawn("dolphin"),
            desc='Choose a config file to edit'
            ),
        Key([], "i",
            lazy.spcawn("./dmscripts/dm-maim"),
            desc='Take screenshots via dmenu'
            ),
        Key([], "k",
            lazy.spawn("./dmscripts/dm-kill"),
            desc='Kill processes via dmenu'
            ),
        Key([], "l",
            lazy.spawn("./dmscripts/dm-logout"),
            desc='A logout menu'
            ),
        Key([], "m",
            lazy.spawn("./dmscripts/dm-man"),
            desc='Search manpages in dmenu'
            ),
        Key([], "o",
            lazy.spawn("./dmscripts/dm-bookman"),
            desc='Search your qutebrowser bookmarks and quickmarks'
            ),
        Key([], "r",
            lazy.spawn("./dmscripts/dm-reddit"),
            desc='Search reddit via dmenu'
            ),
        Key([], "s",
            lazy.spawn("./dmscripts/dm-websearch"),
            desc='Search various search engines via dmenu'
            ),
        Key([], "p",
            lazy.spawn("passmenu"),
            desc='Retrieve passwords with dmenu'
            )
    ])
]
groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod],
            i.name,
            lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        Key([mod], "Right", lazy.screen.next_group(),
            desc="Switch to next group"),

        Key([mod], "Left", lazy.screen.prev_group(),
            desc="Switch to previous group"),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"],
            i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])


layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": "e1acff",
                "border_normal": "1D2330"
                }


layouts = [
    # layout.MonadWide(**layout_theme),
    # layout.Bsp(**layout_theme),
    #layout.Stack(stacks=2, **layout_theme),
    # layout.Columns(**layout_theme),
    # layout.RatioTile(**layout_theme),
    #layout.Tile(shift_windows=True, **layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Floating(**layout_theme),
    # layout.Max(**layout_theme),
    layout.Stack(num_stacks=2),
    # layout.RatioTile(**layout_theme),
    layout.TreeTab(
        font="Ubuntu",
        fontsize=10,
        sections=["FIRST", "SECOND", "THIRD", "FOURTH"],
        section_fontsize=10,
        border_width=2,
        bg_color="1c1f24",
        active_bg="c678dd",
        active_fg="000000",
        inactive_bg="a9a1e1",
        inactive_fg="1c1f24",
        padding_left=0,
        padding_x=0,
        padding_y=5,
        section_top=10,
        section_bottom=20,
        level_shift=8,
        vspace=3,
        panel_width=200
    ),

]



prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())


widget_defaults = dict(
    font="Ubuntu Mono",
    fontsize=12,
    padding=1,
    background=colors[2]
)


extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets_list = [
        widget.GroupBox(
            font="Ubuntu Bold",
            fontsize=9,
            margin_y=3,
            margin_x=0,
            padding_y=5,
            padding_x=3,
            borderwidth=3,
            active=colors[1],
            inactive=colors[8],
            rounded=False,
            highlight_color=colors[9],
            highlight_method="line",
            this_current_screen_border=colors[6],
            this_screen_border=colors[4],
            other_current_screen_border=colors[6],
            other_screen_border=colors[4],
            foreground=colors[2],
            background=colors[0]
        ),
        widget.CurrentLayoutIcon(
            custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
            foreground=colors[2],
            background=colors[0],
            padding=0,
            scale=0.7
        ),
        widget.Prompt(
            prompt=prompt,
            font="Ubuntu Mono",
            padding=10,
            foreground=colors[3],
            background=colors[1]
        ),
        widget.WindowName(
            foreground=colors[6],
            background=colors[0],
            padding=0
        ),
        widget.Net(
            interface="eno1",
            format='{down} ↓↑ {up}',
            foreground=colors[1],
            background=colors[0],
            padding=5,
        ),
        widget.TextBox(
            text=" 🌡",
            padding=2,
            foreground=colors[1],
            background=colors[0],
            fontsize=11
        ),
        widget.ThermalSensor(
            foreground=colors[1],
            background=colors[0],
            threshold=90,
            padding=5
        ),
        widget.TextBox(
            text=" ⟳",
            padding=2,
            foreground=colors[1],
            background=colors[0],
            fontsize=14
        ),
        widget.CheckUpdates(
            update_interval=1800,
            distro="Arch_checkupdates",
            display_format="{updates} Updates",
            foreground=colors[1],
            mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(
                myTerm + ' -e sudo pacman -Syu')},
            background=colors[0]
        ),
        widget.TextBox(
            text=" 🖬",
            foreground=colors[1],
            background=colors[0],
            padding=0,
            fontsize=14
        ),
        widget.Memory(
            foreground=colors[1],
            background=colors[0],
            mouse_callbacks={
                'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
            padding=5
        ),
        widget.CPUGraph(
            foreground=colors[1],
            background=colors[0],
            border_color=colors[1],
            graph_color=colors[1],
            border_width=1,
            line_width=1,
            type="linefill",
            width=50,
        ),
        widget.TextBox(
            text="Vol:",
            foreground=colors[1],
            background=colors[0],
            padding=0
        ),
        widget.Volume(
            foreground=colors[1],
            background=colors[0],
            padding=5
        ),
        widget.BatteryIcon(
            foreground=colors[1],
            background=colors[0],
            update_interval=5,
            padding=8
        ),
        widget.Battery(
            background=colors[0],
            foreground=colors[1],
            format="{percent:2.0%}",
        ),
        widget.Clock(
            foreground=colors[1],
            background=colors[0],
            format=" %I:%M %p"
        ),
        widget.Systray(
            foreground=colors[1],
            background=colors[0],
            padding=5
        ),
    ]
    return widgets_list


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    # Slicing removes unwanted widgets (systray) on Monitors 1,3
    del widgets_screen1[7:8]
    return widgets_screen1


def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    # Monitor 2 will display all widgets in widgets_list
    return widgets_screen2


def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=0.9, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=0.9, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=0.9, size=20))]


if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()


def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)


def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)


def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)


# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = True
cursor_warp = False


floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])


# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])


auto_minimize = True
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
wmname = "Qtile"
