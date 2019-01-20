;;; python_dev.el --- Setup for Python

;;; Commentary:
;; - Setup for Python

;;; Code:

;; Disable company mode
(add-hook 'python-mode-hook 'my-py-hook)
(defun my-py-hook ()
	;; Turn off company-mode for Python (trashy workaround)
	(company-mode -1))
;; Enable Python in Emac
;; Install flake8 jedi yapf as root (pip, pip2)
(use-package elpy
	:ensure t
	:config
	(elpy-enable))
;; pep8
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)
;; Better syntax checking
(when (require 'flycheck nil t)
	(setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
	(add-hook 'elpy-mode-hook 'flycheck-mode))
(provide 'python_dev)
;;; python_dev.el ends here
