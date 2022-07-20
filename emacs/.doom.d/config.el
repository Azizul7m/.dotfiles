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

(setq doom-font (font-spec :family "Dank mono" :size 15 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 12))



;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq doom-theme 'doom-one)

(smooth-scrolling-mode 1)
(beacon-mode 1)




;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

;; org-mode
(setq org-directory "~/org/")
(setq org-hide-emphasis-markers t)

;; Journal config
;;
(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-format "%I:%M %p "
      org-journal-time-prefix "* "
      org-journal-date-format "%A, %d/%m/%Y"
      org-journal-file-format "%d-%m-%Y.org")




;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))


(use-package company
  :config
  (global-company-mode)
  (setq company-idle-delay 0.01)
  (setq company-tooltip-limit 20)
  (setq company-minimum-prefix-length 2))


(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/.dotfiles/emacs/.doom.d/snippets"))
  (yas-global-mode 1))

;;web mode
(setq web-mode-enable-current-element-highlight 1)


;; dotnet
(eval-after-load
  'company
  '(add-to-list 'company-backends #'company-omnisharp #'company-files #'company-dabbrev-code))

(defun my-csharp-mode-setup ()
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)

  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)

  ;csharp-mode README.md recommends this too
  ;(electric-pair-mode 1)       ;; Emacs 24
  ;(electric-pair-local-mode 1) ;; Emacs 25

  (electric-pair-local-mode 1)
  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile))

;; (eval-after-load
;;  'company
;;  '(add-to-list 'company-backends 'company-omnisharp))

;; (add-hook 'csharp-mode-hook #'company-mode)
;; (add-hook 'csharp-mode-hook #'lsp!)

;; (add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)
;; ;; Diagram flowchart mermaid

(setq ob-mermaid-cli-path "/usr/bin/mmdc")
(org-babel-do-load-languages
    'org-babel-load-languages
    '((mermaid . t)
      (scheme . t)
      ))


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

(defun my-tab ()
  (interactive)
  (or (copilot-accept-completion)
      (company-indent-or-complete-common nil)))

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (("C-TAB" . 'copilot-accept-completion-by-word)
         ("C-<tab>" . 'copilot-accept-completion-by-word)
         :map company-active-map
         ("<tab>" . 'my-tab)
         ("TAB" . 'my-tab)
         :map company-mode-map
         ("<tab>" . 'my-tab)
         ("TAB" . 'my-tab)))
;; todo:
(use-package hl-todo
:hook ((prog-mode . hl-todo-mode)
        (org-mode . hl-todo-mode)
        (web-mode . hl-todo-mode)
        (rjsx-mode . hl-todo-mode))
:config
(setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
        ("FIXME"      error bold)
        ("HACK"       font-lock-constant-face bold)
        ("REVIEW"     font-lock-keyword-face bold)
        ("NOTE"       success bold)
        ("DEPRECATED" font-lock-doc-face bold))))
