;;; init.el --- Init every config param

;;; Commentary:
;; - Load config params

;;; Code:

(add-to-list 'load-path "~/.emacs.d/config")
(load "packages.el")
(load "interface.el")
(load "general.el")
(load "env_vars.el")
(add-hook 'prog-mode-hook (load "general_dev.el"))
(add-hook 'prog-mode-hook (load "other_dev.el"))
(add-hook 'c-mode-hook (load "c_dev.el"))
(add-hook 'c++-mode-hook (load "c_dev.el"))
(add-hook 'go-mode-hook (load "go_dev.el"))
(add-hook 'python-mode-hook (load "python_dev.el"))
(add-hook 'web-mode-hook (load "web_dev.el"))
(add-hook 'org-mode (load "org.el"))
(when (system-is-linux)
	(load-library "gnu_linux.el")
	)
(when (system-is-mac)
	(load-library "mac.el")
	)
(load "applications.el")
(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file 'noerror)
(load "server")
(unless (server-running-p)
	(server-start)
	)
(message "Hack The Planet! :D")
(provide 'init)
;;; init.el ends here
