;;; other_dev.el --- Small settings for another stuff

;;; Commentary:
;; - Provide small settings for another stuff

;; Code:

;; Lisp
(setq-default lisp-indent-offset tab-width)
;; Bash
(setq-default sh-basic-offset tab-width)
;; PACKAGE: company-shell
(use-package company-shell
	:ensure t
	:config
	(add-to-list 'company-backends 'company-shell))
(provide 'other_dev)
;;; other_dev.el ends here
