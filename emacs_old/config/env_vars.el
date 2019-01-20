;;; env_vars.el --- Environment variables configuration
(use-package exec-path-from-shell
	:ensure t
	:if window-system
	:config
	(progn
		(exec-path-from-shell-initialize)
		(exec-path-from-shell-copy-env "GOPATH")))
(provide 'env_vars.el)
;;; env_vars.el ends here
