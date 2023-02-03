;;;
;;;
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Azizul Islam"
      user-mail-address "azizul7m@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

;;(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Operator Mono" :size 12))
;; JetBrains Mono
(setq doom-font (font-spec :family "Iosevka" :size 14 :weight 'regular)
      )

(set-fontset-font t 'bengali (font-spec :family "Hind Siliguri" :size 13))

(setq doom-modeline-height 10) ; optional
(custom-set-faces
  '(mode-line ((t (:family "Fantasque Sans Mono" :height 92))))
  '(mode-line-active ((t (:family "Fantasque Sans Mono" :height 92)))) ; For 29+
  '(mode-line-inactive ((t (:family "Fantasque Sans Mono" :height 92))))
  )

;; (add-hook 'prog-mode-hook (lambda ()
;;                             (setq buffer-face-mode-face '(:family "Iosevka " :height 108))
;;                             (buffer-face-mode)))


;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely

;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq doom-theme 'doom-one)
;;(setq doom-theme 'github-modern)

(smooth-scrolling-mode 1)
(display-battery-mode 't)
(display-time-mode 't)
(setq doom-themes-treemacs-theme "doom-colors")

(require 'dashboard)
(dashboard-setup-startup-hook)
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
  (setq dashboard-startup-banner "~/.doom.d/emacs.png")
  (setq dashboard-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-init-info t)
  (setq dashboard-center-content nil))
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

;; org-mode
(setq org-directory "~/.org/")
(setq org-hide-emphasis-markers t)
(setq org-roam-directory "~/.org/roam")
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; (require 'simple-httpd)
;; (setq httpd-root "/var/www")
;; (httpd-start)

;; (use-package org-roam-server
;;   :ensure nil
;;   :load-path "~/.org/roam/")


;; Journal config
(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-format "%I:%M %p "
      org-journal-time-prefix "* "
      org-journal-date-format "%A, %d/%m/%Y"
      org-journal-file-format "%d-%m-%Y.org")

;; Interactive Org Roam Server Graph

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))


(after! company
  (setq company-idle-delay 0)
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-minimum-prefix-length 1)
  (setq company-show-quick-access t)
  (setq +lsp-company-backends '( company-yasnippet :separate company-capf  :separate company-dabbrev :separate company-files :separate company-wordfreq))
)

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(after! ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))

(use-package popup-kill-ring
  :ensure t
  :bind("M-y" . popup-kill-ring))


(after! yasnippet
  :config
  (setq yas-snippet-dirs '("~/.org/snippets"))
  (yas-global-mode 1))


(use-package lsp-tailwindcss)
;; debug
(setq dap-auto-configure-features '(sessions locals controls tooltip))
(require 'dap-firefox)

;; (setq lsp-ui-doc-show-with-mouse 't)
;; (setq lsp-ui-doc-show-with-cursor 't)

(use-package lsp-tailwindcss
  :init
  (setq lsp-tailwindcss-add-on-mode t))


;; Latex
(setq +latex-viewers 'nil)


;; Offile Documentation
(require 'counsel-dash)
(setq dash-docs-enable-debugging nil)
(global-set-key (kbd "C-c d") 'counsel-dash-at-point)
(setq counsel-dash-common-docsets '("JavaScript" "HTML" ))
(add-hook 'emacs-lisp-mode-hook (lambda () (setq-local counsel-dash-docsets '("Emacs Lisp"))))
(add-hook 'rjsx-mode-hook (lambda () (setq-local counsel-dash-docsets '("React" "JavaScript"))))
(add-hook 'typescript-mode-hook (lambda () (setq-local counsel-dash-docsets '("TypeScript" "React" "JavaScript"))))
(add-hook 'typescript-tsx-mode-hook (lambda () (setq-local counsel-dash-docsets '("TypeScript" "React" "JavaScript"))))

(setq
 browse-url-browser-function 'eww-browse-url ; Use eww as the default browser
 shr-use-fonts  nil                          ; No special fonts
 shr-use-colors nil                          ; No colours
 shr-indentation 2                           ; Left-side margin
 shr-width 70                                ; Fold text to 70 columns
 eww-search-prefix "https://google.com/search?q=%s")    ; Use another engine for searching
(global-set-key (kbd "C-c w") 'eww-search-words)


;; Translate
(setq google-translate-default-source-language "auto")  ; Auto detect language.
(setq google-translate-default-target-language "bn")    ; Set your target language.
(setq define-it-output-choice 'view)  ; Output with buffer.
(global-set-key (kbd "C-c s") 'define-it-at-point)
(global-set-key (kbd "C-c W") 'define-it)

(setq circe-network-options
      '(("Libera Chat"
         :tls t
         :nick "anower"
         :sasl-username "anower"
         :sasl-password "/@97M"
         :channels ("#emacs" "#emacs-circe" "#javascript"))))
;; (setq enable-circe-color-nicks t)
(setq circe-color-nicks 't)
;; (setq circe-color-nicks-everywhere t)

;; For non ascii-characters in folder-names
(setq elmo-imap4-use-modified-utf7 t)



;; ;; Diagram flowchart mermaid
(setq ob-mermaid-cli-path "/usr/bin/mmdc")
(org-babel-do-load-languages
    'org-babel-load-languages
    '((mermaid . t)
      (scheme . t)
      ))

;; elfeed
(setq elfeed-goodies/entry-pane-size 0.5)
(global-set-key (kbd "C-x w") 'elfeed)
(setq elfeed-feeds
        '("https://web.dev/feed.xml"
        "https://blog.logrocket.com/feed/"
        "https://planet.emacslife.com/atom.xml"
        "https://www.brsoftech.com/blog/feed/"
        "https://www.smashingmagazine.com/feed"
        "https://www.sitepoint.com/feed/"
        "https://tympanus.net/codrops/feed/"
        "https://feeds.dzone.com/webdev"
        "https://css-tricks.com/feed/"
        "https://blog.codepen.io/feed/"
        "https://webkul.com/blog/feed/"
        "https://feeds.feedburner.com/ProgrammableWeb"
        "https://cssauthor.com/feed/"
        "https://codeconvey.com/feed/"
        "https://www.inexture.com/feed/"
        "http://javascriptweekly.com/rss"
        "https://www.echojs.com/rss"
        "https://www.uplogictech.com/blog/feed/"
        "https://wdrl.info/feed"
        "https://developerstroop.com/feed/"
        "https://reactjs.org/feed.xml"
        "http://davidwalsh.name/feed"
        "http://dailynerd.nl/feed/"
        "http://rss1.smashingmagazine.com/feed/"))
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; accept completion from copilot and fallback to company

;; (defun my-tab ()
;;   (interactive)
;;   (or (copilot-accept-completion)
;;       (company-indent-or-complete-common nil)))

;; (use-package! copilot
;;   :hook (prog-mode . copilot-mode)
;;   :bind (("C-TAB" . 'copilot-accept-completion-by-word)
;;          ("C-<tab>" . 'copilot-accept-completion-by-word)
;;          :map company-active-map
;;          ("<tab>" . 'my-tab)
;;          ("TAB" . 'my-tab)
;;          :map company-mode-map
;;          ("<tab>" . 'my-tab)
;;          ("TAB" . 'my-tab)))

;; TODO: heighlight config
(use-package hl-todo
:hook ((prog-mode . hl-todo-mode)
        (org-mode . hl-todo-mode)
        (web-mode . hl-todo-mode)
        (rjsx-mode . hl-todo-mode))
:config
(setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"     warning bold)
        ("FIXME"      error bold)
        ("HACK"       font-lock-constant-face bold)
        ("REVIEW"     font-lock-keyword-face bold)
        ("NOTE"       success bold)
        ("START"      error bold)
        ("END"        error bold)
        ("DEPRECATED" font-lock-doc-face bold))))

;; bangla
(defun remove-quail-show-guidance ()
  nil)
(defun remove-quail-completion ()
  (quail-select-current))
(defun bn-company-wordfreq ()
  (interactive)
  (advice-add 'quail-show-guidance :override #'remove-quail-show-guidance)
  (advice-add 'quail-completion :override #'remove-quail-completion)
  (setq ispell-local-dictionary "bengali")
  (setq-local company-backends '(company-wordfreq))
  (setq-local company-transformers nil))
