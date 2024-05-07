;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Adolfo Santiago"
      user-mail-address "epoch@adol.pw")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Liberation Mono" :size 12 :weight 'Regular))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-tomorrow-day)

(setq frame-title-format '("%b - Emacs")
      icon-title-format frame-title-format)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(global-display-line-numbers-mode)
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
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

;; SECTION: files

;;; Set tabs insead of spaces
(setq-default
 indent-tabs-mode t
 tab-width 4
 standard-indent tab-width)

;;; Save always as UTF-8 and Unix endline
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;;; Put newlines at the end of every file
(setq-default require-final-newline t)

;;; Delete white space at line ending
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; Paste text wherever the point is
(setq-default mouse-yank-at-point t)

;;; Replace highlighted text when typing
(delete-selection-mode t)

;;; Befriend with the system's clipboard
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;;; Preserve OS clipboard before killing text
(setq save-interprogram-paste-before-kill t)

;;; Smart tab - indent or complete
(setq tab-always-indent 'complete)

;;; Now '_' is not considered a word-delimiter
(modify-syntax-entry ?_ "w")

;;; Misc. key bindings
(global-set-key (kbd "RET") 'newline-and-indent)

;;; Allow clipboard from outside Emacs
(setq select-enable-clipboard t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t)

;;; Now '_' is not considered a word-delimiter
(modify-syntax-entry ?_ "w")

;; SECTION: macOS stuff

;;; Set right META key as an ALT
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

;;; Dark window border on OS X
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; SECTION: package configs

;;; eldoc - shows the argument list of the function call
(use-package! eldoc
  :hook (prog-mode . eldoc-mode))

;;; Markdown defaults
(use-package! markdown-mode
  :defer t
  :mode (
         ("\\.md'" . markdown-mode)
         ("\\.markdown'" . markdown-mode))
  :config
  (setq-default fill-column 80)
  (setq-default auto-fill-function 'do-auto-fill)
  (add-hook 'text-mode-hook 'turn-on-auto-fill)
  (add-hook 'markdown-mode-hook
			(lambda ()
			  (visual-line-mode t)))
  (setq-default word-wrap t))

;;; Kill like VSCodium
(use-package! syntax-subword
  :ensure t
  :init
  (setq syntax-subword-skip-spaces t)
  :config
  (global-syntax-subword-mode))
