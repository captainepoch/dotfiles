;; Load config files
(add-to-list 'load-path (concat user-emacs-directory "config"))

;; Packages loader
(load "packages.el")

;; General config
(load "general.el")

;; Emacs look
(load "interface.el")

;; Enable dev. config
(add-hook 'prog-mode-hook (load "development.el"))

;; C(++) hook
(add-hook 'c-mode-hook (load "c.el"))

;; Python hook
(add-hook 'python-mode-hook (load "python.el"))

;; Golang hook
(add-hook 'go-mode-hook (load "go.el"))

;; HTML hook
(add-hook 'web-mode-hook (load "html.el"))

;; YAML hook
(add-hook 'yaml-mode-hook (load "yaml.el"))

;; Text hook
(add-hook 'text-mode-hook (load "text.el"))

;; Set Custom file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; Load user info
(load "user.el")

;; Load emacs server
(load "server")
(unless (server-running-p)
  (server-start)
  )

;; End message - OK!
(message "Hack The Planet!")
