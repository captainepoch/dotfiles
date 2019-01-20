;;; general.el --- General setup

;;; Commentary:
;; - Settings for Emacs

;;; Code:

;; Deactivate auto-save & backups
(setq auto-save-default nil)
(setq make-backup-files nil)
;; Set a file backup dir
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
	backup-by-copying t	;; Don't delink hardlinks
	version-control t		;; Use version numbers on backups
	delete-old-versions t	;; Automatically delete excess backups
	kept-new-versions 5	;; how many of the newest versions to keep
	kept-old-versions 5	;; and how many of the old
	)
(desktop-save-mode -1)
;; No need for ~ files when editing
(setq create-lockfiles nil)
;; Save always as Unix
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)
;; Close buffer with C-x k
(add-hook 'server-switch-hook
	(lambda ()
		(local-set-key (kbd "C-x k") '(lambda ()
										  (interactive)
										  (if server-buffer-clients
											  (server-edit)
											  (ido-kill-buffer))))))
(global-set-key [home] 'move-beginning-of-line)
(global-set-key [end] 'move-end-of-line)
;; Disable the warning when killing a buffer w/ process
(setq kill-buffer-query-functions
	(remq 'process-kill-buffer-query-function
		kill-buffer-query-functions))
;; Scrolling forwards / backwards preserves original location
(setq scroll-preserve-screen-position 'always)
;; Better scrolling
(setq scroll-step 1
	scroll-conservatively  10000
	mouse-wheel-scroll-amount '(1 ((shift) . 1))
	mouse-wheel-progressive-speed nil
	mouse-wheel-follow-mouse 't)
;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)
;; New package viewer
(use-package paradox
	:ensure t)
;; Define the exec system
(defun system-is-mac()
	(interactive)
	(string-equal system-type "darwin"))
(defun system-is-linux()
	(interactive)
	(string-equal system-type "gnu/linux"))
(provide 'general)
;;; general.el ends here
