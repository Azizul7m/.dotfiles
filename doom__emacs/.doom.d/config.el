;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Azizul Islam"
      user-mail-address "azizul7m@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "JetBrains" :size 10 :weight 'Regular)
;;       doom-variable-pitch-font (font-spec :family "Ubuntu Mono" :size 11))

(setq doom-font (font-spec :family "JetBrainsMono" :size 12 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "Hack" :size 13)
      ivy-posframe-font (font-spec :family "Source Code Pro" :size 12))



;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;;TODO this is Config Todo

;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; automatically load web-mode when opening web-related files
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))


;; company-web configuration
;(add-to-list 'company-backends 'company-web-html)
;(add-to-list 'company-backends 'company-web-jade)
;(add-to-list 'company-backends 'company-web-slim)

;; emmet settings
;; turn on emmet in web-mode
(add-hook 'web-mode-hook  'emmet-mode)

;; File Auto Completetion

(file-name-completion "fi" "")
      "file"
(file-name-completion "file.c.~1" "")
      "file.c.~1~"
(file-name-completion "file.c.~1~" "")
      t
(file-name-completion "file.c.~3" "")
      nil



(set-company-backend! 'lsp
  '(:separate company-yasnippet company-capf company-dabbrev))




;;; -\*- lexical-binding: t -\*-


(use-package phpunit
 :ensure t)
(use-package company
 :ensure t
 :config
 (setq company-idle-delay 0.3)
 (global-company-mode 1))


(use-package flycheck)

(use-package lsp-mode
 :config
 (setq lsp-prefer-flymake nil)
 :hook (php-mode . lsp)
 :commands lsp)

(use-package lsp-ui
 :requires lsp-mode flycheck
 :config
 (setq lsp-ui-doc-enable t
 lsp-signature-auto-activate 'nil
 lsp-ui-doc-use-childframe t
 lsp-ui-doc-position ‘top
 lsp-ui-doc-include-signature t
 lsp-ui-peek-enable t
 lsp-ui-peek-list-width 60
 lsp-ui-peek-peek-height 25
 lsp-ui-sideline-enable 'nil)

(add-hook ‘lsp-mode-hook ‘lsp-ui-mode))
(use-package company-lsp
 :commands company-lsp)

