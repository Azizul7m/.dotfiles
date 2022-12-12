/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx = 1; /* border pixel of windows */
static const unsigned int gappx = 5;    /* gaps between windows */
static const unsigned int snap = 32;    /* snap pixel */
static const int swallowfloating =
    0;                        /* 1 means swallow floating windows by default */
static const int showbar = 1; /* 0 means no bar */
static const int topbar = 1;  /* 0 means bottom bar */
static const int vertpad = 0; /* vertical padding of bar */
static const int sidepad = 0; /* horizontal padding of bar */
static const int focusonwheel = 0;
static const char *fonts[] = {
    "iosevka:size=10", "JoyPixels:pixelsize=12:antialias=true:authint=true"};
static const char dmenufont[] = "iosevka:size=10";

static const char norm_fg[] = "#caebf4";
static const char norm_bg[] = "#162338";
static const char norm_border[] = "#000000";

static const char sel_fg[] = "#000000";
static const char sel_bg[] = "#4FA9AC";
static const char sel_border[] = "#8da4aa";

static const char urg_fg[] = "#caebf4";
static const char urg_bg[] = "#2198A4";
static const char urg_border[] = "#2198A4";

static const char *colors[][3] = {
    /*               fg           bg         border                         */
    [SchemeNorm] = {norm_fg, norm_bg, norm_border}, // unfocused wins
    [SchemeSel] = {sel_fg, sel_bg, sel_border},     // the focused win
};

/* tagging */
/* static const char *tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"}; */
static const char *tags[] = {"", "", "", "", "", "", "", "﬏", ""};

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class     instance  title           tags mask  isfloating  isterminal
       noswallow  monitor */
    {"Firefox", NULL, NULL, 1 << 8, 0, 0, -1, -1},
    {"st-256color", NULL, NULL, 0, 0, 1, 1, -1},
    {NULL, NULL, "Event Tester", 0, 0, 0, 1, -1}, /* xev */
};

/* layout(s) */
static const float mfact = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;    /* number of clients in master area */
static const int resizehints =
    0; /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen =
    1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
    /* symbol     arrange function */
    {"[]=", tile}, /* first entry is default */
    {"><>", NULL}, /* no layout function means floating behavior */
    {"[M]", monocle},
};

/* key definitions */
#define MODKEY Mod4Mask
#define ALTKEY Mod1Mask
#define TAGKEYS(KEY, TAG)                                                      \
  {MODKEY, KEY, view, {.ui = 1 << TAG}},                                       \
      {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}},               \
      {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},                        \
      {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                                             \
  {                                                                            \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }                       \
  }

/* commands */
static char dmenumon[2] =
    "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *upvol[] = {"/usr/bin/pactl", "set-sink-volume", "0", "+5%",
                              NULL};
static const char *downvol[] = {"/usr/bin/pactl", "set-sink-volume", "0", "-5%",
                                NULL};
static const char *mutevol[] = {"/usr/bin/pactl", "set-sink-mute", "0",
                                "toggle", NULL};
static const char *dmenucmd[] = {"dmenu_run", "-fn", "Operator mono", "-x",
                                 "500",       "-y",  "250",           "-h",
                                 "5",         "-w",  "500",           "-nf",
                                 norm_bg,     "-sb", norm_border,     "-sf",
                                 norm_fg,     "-p",  "Run: ",         NULL};
/* static const char *dmenucmd[] = {"dmenu_run", "-m",      dmenumon, "-fn",
 * dmenufont, "-nb",     col_gray1, "-nf",       col_gray3, "-sb",    col_cyan,
 * "-sf",     col_gray4, NULL}; */
static const char *rofirun[] = {"rofi",  "-show",   "drun",
                                "-font", dmenufont, NULL};
static const char *termcmd[] = {"alacritty", NULL};
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = {"st", "-t",    scratchpadname,
                                      "-g", "80x24", NULL};
static const char *browser[] = {"firefox", NULL};

static Key keys[] = {
    /* modifier                     key        function        argument */
    {ALTKEY, XK_space, spawn, {.v = rofirun}},
    {MODKEY, XK_p, spawn, {.v = dmenucmd}},
    {MODKEY, XK_Return, spawn, {.v = termcmd}},
    {MODKEY, XK_w, spawn, {.v = browser}},
    {0, XF86XK_AudioLowerVolume, spawn, {.v = downvol}},
    {0, XF86XK_AudioMute, spawn, {.v = mutevol}},
    {0, XF86XK_AudioRaiseVolume, spawn, {.v = upvol}},
    {MODKEY | ShiftMask, XK_Return, togglescratch, {.v = scratchpadcmd}},
    {MODKEY, XK_b, togglebar, {0}},
    {MODKEY, XK_j, focusstack, {.i = +1}},
    {MODKEY, XK_k, focusstack, {.i = -1}},
    {MODKEY, XK_i, incnmaster, {.i = +1}},
    {MODKEY, XK_d, incnmaster, {.i = -1}},
    {MODKEY, XK_h, setmfact, {.f = -0.05}},
    {MODKEY, XK_l, setmfact, {.f = +0.05}},
    {MODKEY | ShiftMask, XK_h, zoom, {0}},
    {MODKEY, XK_Tab, view, {0}},
    {MODKEY, XK_q, killclient, {0}},
    {MODKEY, XK_t, setlayout, {.v = &layouts[0]}},
    /*{ MODKEY,                       XK_f,      setlayout,      {.v =
       &layouts[1]} },*/
    {MODKEY, XK_m, setlayout, {.v = &layouts[2]}},
    {MODKEY, XK_space, setlayout, {0}},
    {MODKEY | ControlMask, XK_space, togglefloating, {0}},
    {MODKEY, XK_f, togglefullscr, {0}},
    {MODKEY, XK_0, view, {.ui = ~0}},
    {MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},
    {MODKEY, XK_comma, focusmon, {.i = -1}},
    {MODKEY, XK_period, focusmon, {.i = +1}},
    {MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
    {MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},
    {MODKEY, XK_minus, setgaps, {.i = -1}},
    {MODKEY, XK_equal, setgaps, {.i = +1}},
    {MODKEY | ShiftMask, XK_equal, setgaps, {.i = 0}},
    TAGKEYS(XK_1, 0) TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3)
        TAGKEYS(XK_5, 4) TAGKEYS(XK_6, 5) TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
            TAGKEYS(XK_9, 8){MODKEY | ShiftMask, XK_q, quit, {0}},
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click                event mask      button          function argument */
    {ClkLtSymbol, 0, Button1, setlayout, {0}},
    {ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]}},
    {ClkWinTitle, 0, Button2, zoom, {0}},
    {ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
    {ClkClientWin, MODKEY, Button1, movemouse, {0}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY, Button3, resizemouse, {0}},
    {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
};
