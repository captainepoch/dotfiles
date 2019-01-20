;;; iterface.el --- Settings for Emacs' GUI

;;; Commentary:
;; - General configuration for the GUI

;;; Code:

;; GUI settings
(show-paren-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; Set initial frame size and position
(set-frame-position (selected-frame) 1 1)
(add-to-list 'default-frame-alist '(height . 53))
(add-to-list 'default-frame-alist '(width . 100))
;; Set line numbers
(global-linum-mode 1)
;; Line and column numbers at mode-line
(setq line-number-mode t)
(setq column-number-mode t)
;; Custom color scheme
(load-theme 'wombat t)
;; Set fringe with background color
(set-face-attribute 'fringe nil
	:foreground (face-foreground 'default)
	:background (face-background 'default))
;; Normal font weight without underline
(mapc
	(lambda (face)
		(set-face-attribute face nil :weight 'normal :underline nil))
	(face-list))
;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(eval-after-load "startup" '(fset 'display-startup-echo-area-message (lambda ())))
;; Don't let Emacs hurt your ears
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
;; No scrollbar
(scroll-bar-mode 0)
;; Don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)
;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)
;; Mode Line
;; Set the modeline to tell me the filename, hostname, etc..
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
		)
	)
(global-set-key [next]
	(lambda () (interactive)
		(condition-case nil (scroll-up)
			(end-of-buffer (goto-char (point-max))))))
(global-set-key [prior]
	(lambda () (interactive)
		(condition-case nil (scroll-down)
			(beginning-of-buffer (goto-char (point-min))))))
;; PACKAGE: which-key
(use-package which-key
	:ensure t
	:config (which-key-mode))
(provide 'interface)
;;; interface.el ends here
