;;; go_dev.el --- Go setup

;;; Commentary:
;;	- Go stuff

;;; Code:

;; PACKAGE: go-mode
(use-package go-mode
	:ensure t
	:config
	(add-hook 'before-save-hook #'gofmt-before-save)
	(add-hook 'go-mode-hook 'flycheck-mode))
;; PACKAGE: go-flycheck
(add-to-list 'load-path "~/Projects/go/src/github.com/dougm/goflymake")
(use-package go-flycheck)
;; PACKAGE: company-go (https://github.com/nsf/gocode)
(use-package company-go
	:ensure t
	:config
	(add-hook 'go-mode-hook
		'(lambda ()
			 (company-mode t)
			 (set (make-local-variable 'company-backends) '(company-go)))))
;; PACKAGE: go-eldoc (https://github.com/nsf/gocode)
(use-package go-eldoc
	:ensure t
	:diminish eldoc-mode
	:config
	(add-hook 'go-mode-hook 'go-eldoc-setup))
(provide 'go_dev)
;;; go_dev.el ends here
