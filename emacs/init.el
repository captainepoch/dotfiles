;; Load config files
(add-to-list 'load-path (concat user-emacs-directory "config"))

;; Packages loader
(load "packages.el")

;; Set Custom file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; General config
(load "general.el")

;; Emacs look
(load "interface.el")

;; Enable development config
(add-hook 'prog-mode-hook (load "development.el"))

;; C(++) config
(add-hook 'c-mode-hook (load "c.el"))

;; Elisp config
(add-hook 'emacs-lisp-mode (load "elisp.el"))

;; Go config
(add-hook 'go-mode-hook (load "go.el"))

;; Python config
(add-hook 'python-mode-hook (load "python.el"))

;; Text hook
(add-hook 'text-mode-hook (load "text.el"))

;; TOML config
(add-hook 'toml-mode-hook (load "toml.el"))

;; Web config
(add-hook 'web-mode-hook (load "html.el"))

;; YAML config
(add-hook 'yaml-mode-hook (load "yaml.el"))

;; Load user info
(load "user.el")

;; Load Emacs server
(load "server")
(unless (server-running-p)
  (server-start))

;; End message - OK!
(message "Hack The Planet!")
