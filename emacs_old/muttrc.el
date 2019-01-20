;;; Muttrc.el --- Settings for Mutt

;;; Commentary:
;; - Mutt settings

;;; Code:
(add-to-list 'load-path "~/.emacs.d/config")
(load "general.el")
(setq custom-file "custom.el")
(load custom-file)
(load "interface.el")
(when (system-is-linux)
	(load-library "gnu_linux.el")
	)
(when (system-is-mac)
	(load-library "mac.el")
	)
;; Delete selected text
(delete-selection-mode 1)
;; Delete white space at line ending
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default fill-column 79)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default auto-fill-function 'do-auto-fill)
(provide 'muttrc)
;;; muttrc.el ends here
