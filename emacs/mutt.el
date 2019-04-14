(add-to-list 'load-path (concat user-emacs-directory "config"))
(load "general.el")
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)
(load "interface.el")
;; Delete selected text
(delete-selection-mode 1)
;; Delete white space at line ending
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default fill-column 72)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default auto-fill-function 'do-auto-fill)
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))
