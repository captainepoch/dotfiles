;; Load some defaults for emacs
(add-to-list 'load-path (concat user-emacs-directory "config"))
(load "packages.el")
(load "interface.el")
(load "general.el")
(load "text.el")
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; Load magit
(load "development.el")

;; Delete selected text
(delete-selection-mode 1)

;; Delete white space at line ending
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default auto-fill-function 'do-auto-fill)

;; Enable dictionaries while writing
(add-hook 'git-commit-mode-hook 'flyspell-mode)

;; Enable the git-commit mode from magit
(use-package git-commit)

;; End message - OK!
(message "Neomutt config OK")
