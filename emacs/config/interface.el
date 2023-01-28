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

;; Not stretching the cursor
(setq x-stretch-cursor nil)

;; Font, width and height configuration for each OS
(cond ((eq system-type 'gnu/linux)
	   (add-to-list 'default-frame-alist '(height . 65))
	   (add-to-list 'default-frame-alist '(width . 150))

	   (add-to-list 'default-frame-alist '(font . "Liberation Mono-10"))
	   (set-face-attribute 'default t :font "Liberation Mono-10")
	   )
	  ((eq system-type 'darwin)
	   (add-to-list 'default-frame-alist '(height . 52))
	   (add-to-list 'default-frame-alist '(width . 135))

	   (add-to-list 'default-frame-alist '(font . "Liberation Mono-12"))
	   (set-face-attribute 'default t :font "Liberation Mono-12")
	   )
	  )
(mapc
 (lambda (face)
   (set-face-attribute face nil :weight 'normal :underline nil))
 (face-list))
(set-frame-position (selected-frame) 1 1)

;; Set right META key as an ALT
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

;; Color scheme
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-tomorrow-day t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config))

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


;; Nice scrolling (taken from doom-emacs)
(setq hscroll-margin 2
      hscroll-step 1
      scroll-conservatively 101
      scroll-margin 0
      scroll-preserve-screen-position t
      ;; Reduce cursor lag by a tiny bit by not auto-adjusting `window-vscroll'
      ;; for tall lines.
      auto-window-vscroll nil
      ;; Mouse
      mouse-wheel-scroll-amount '(1 ((shift) . hscroll))
      mouse-wheel-scroll-amount-horizontal 1
      mouse-wheel-progressive-speed nil
      ;; Trackpad/Mousepad
      mac-redisplay-dont-reset-vscroll t
      mac-mouse-wheel-smooth-scroll nil)

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

;; 80 character line width
(setq-default fill-column 80)

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

;; all-the-icons - add icons for Emacs
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;; centaur-tabs - tabs like other editors in Emacs
(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (setq
   centaur-tabs-set-bar 'over
   centaur-tabs-set-icons t
   centaur-tabs-set-modified-marker t
   centaur-tabs-show-navigation-buttons t
   centaur-tabs-style "bar")
  (defun centaur-tabs-hide-tab (x)
	"Do no to show buffer X in tabs."
	(let ((name (format "%s" x)))
      (or
       ;; Current window is not dedicated window.
       (window-dedicated-p (selected-window))

       ;; Buffer name not match below blacklist.
       (string-prefix-p "*Ibuffer" name)
       (string-prefix-p "*Messages" name)

       ;; Is not magit buffer.
       (and (string-prefix-p "magit" name)
			(not (file-name-extension name))))))
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

;; neotree - show a directory tree with autoupdate
(use-package neotree
  :ensure t
  :bind (([f8] . neotree-toggle))
  :config
  (setq-default neo-smart-open t)
  (setq neo-banner-message nil
        neo-force-change-root t
        neo-window-fixed-size nil
        neo-theme 'icons)
  (add-hook 'neo-after-create-hook
			(lambda (&rest _) (display-line-numbers-mode -1))))

;; rich-minority - less minor-modes on the modeline
(use-package rich-minority
  :ensure t
  :init (rich-minority-mode 1)
  :config (setq rm-blacklist ""))

;; smex - History and searching on top of M-x
(use-package smex
  :ensure t
  :bind ("M-x" . smex))
