/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */

static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"JetBrainsMono Nerd Font:pixelsize=13:antialias=true:autohint=true",
	"Font Awesome 5 Free:pixelsize=13:antialias=true:autohint=true",
};

static const char *prompt = "> ";      /* -p  option; prompt to the left of input field */

static const char censor_character = '*';

static const unsigned int bgalpha = 0xe6;
static const unsigned int fgalpha = OPAQUE;

static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#bbbbbb", "#222222" },
	[SchemeSel] = { "#eeeeee", "#005577" },
	[SchemeOut] = { "#000000", "#00ffff" },
	[SchemeNormHighlight] = { "#ffc978", "#222222" },
	[SchemeSelHighlight] = { "#ffc978", "#005577" },
};

static const unsigned int alphas[SchemeLast][2] = {
	/*		fgalpha		bgalphga	*/
	[SchemeNorm] = { fgalpha, bgalpha },
	[SchemeSel]  = { fgalpha, bgalpha },
	[SchemeOut]  = { fgalpha, bgalpha },
	[SchemeNormHighlight]  = { fgalpha, bgalpha },
	[SchemeSelHighlight]  = { fgalpha, bgalpha },
};


/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 15;

static unsigned int lineheight = 24;         /* -h option; minimum height of a menu line     */

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* -n option; preselected item starting from 0 */
static unsigned int preselected = 0;

/* Size of the window border */
static const unsigned int border_width = 0;

/* -r  option; if 1, outputs text each time a key is pressed */
static int incremental = 0;

static short int case_insensitive = 1;

