;; Remove scrollbar, menubar, messages, bell, etc.
(show-paren-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(scroll-bar-mode 0)

;; Non blinking cursor
(blink-cursor-mode 0)

;; Width, height and osition
(add-to-list 'default-frame-alist '(height . 52))
(add-to-list 'default-frame-alist '(width . 135))
(set-frame-position (selected-frame) 1 1)

;; Set right META key as an ALT
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

;; Color scheme
;;(use-package doom-themes
;;  :ensure t
;;  :config
;;  ;; Enable custom neotree theme (all-the-icons must be installed!)
;;  (doom-themes-neotree-config)
;;  ;; or for treemacs users
;;  (doom-themes-treemacs-config)
;;  ;; Corrects (and improves) org-mode's native fontification.
;;  (doom-themes-org-config)
;;  )
;;(load-theme 'doom-one t)

(use-package spacemacs-theme
  :ensure t
  :defer t
  :init
  (load-theme 'spacemacs-dark t))

;; Dark window border on OS X
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; Line numbers
(global-display-line-numbers-mode)

;; Hack to enable line numbers in emacsclient
(add-hook 'after-make-frame-functions (lambda (frame)
										(select-frame frame)
										(setq display-line-numbers t)))

;; Put marks into the left side to see the end
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; Set fringe with background color
(set-face-attribute 'fringe nil
					:foreground (face-foreground 'default)
					:background (face-background 'default))

;; Font config
(if (eq system-type 'gnu/linux)
	(add-to-list 'default-frame-alist '(font . "Liberation Mono-10"))
  (set-face-attribute 'default t :font "Liberation Mono-10"))
(if (eq system-type 'darwin)
	(add-to-list 'default-frame-alist '(font . "Liberation Mono-11"))
  (set-face-attribute 'default t :font "Liberation Mono-11"))
(mapc
 (lambda (face)
   (set-face-attribute face nil :weight 'normal :underline nil))
 (face-list))

;; Nice scrolling
(setq
 scroll-margin 0
 scroll-conservatively 100000
 scroll-preserve-screen-position 1
 mouse-wheel-progressive-speed nil)

;; List of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Better filesystem navigation
(ido-mode t)
(setq
 ido-enable-flex-matching t
 ido-use-virtual-buffers t)

;; Activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; Show unncessary whitespace that can mess up your diff
(setq show-trailing-whitespace 1)

;; 79 character line width
(setq-default fill-column 79)

;; Show column number in modeline
(column-number-mode t)

;; Show line number in modeline
(line-number-mode t)

;; Setup mode-line with information
(setq-default mode-line-format
			  (list " "
					;; Encoding
					mode-line-mule-info
					" ("
					;; Indicators if the file has been modified
					mode-line-modified
					;; Buffer name and size
					") | %b | %I | "
					;; Major and minor modes
					mode-line-modes
					"| "
					;; Show line and column position
					mode-line-position
					))

;; rich-minority - less minor-modes on the modeline
(use-package rich-minority
  :ensure t
  :init (rich-minority-mode 1)
  :config (setq rm-blacklist ""))

;; smex - History and searching on top of M-x
(use-package smex
  :ensure t
  :bind ("M-x" . smex))
