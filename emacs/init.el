;; Load config files
(add-to-list 'load-path (concat user-emacs-directory "config"))
(load "packages.el")
(load "general.el")
(load "interface.el")
(add-hook 'prog-mode-hook (load "development.el"))
(add-hook 'c-mode-hook (load "c.el"))
;; Set Custom file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)
;; Load user info
(load "user.el")
;; Load the server
(load "server")
(unless (server-running-p)
	(server-start)
)
;; End message - OK!
(message "Hack The Planet!")