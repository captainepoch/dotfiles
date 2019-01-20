;;; web_dev.el --- Setup for web development

;;; Commentary:
;; - Web development

;;; Code:

;; Load web-mode
(use-package web-mode
	:ensure t
	:config
	(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
	(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
	(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))
	(setq-default web-mode-engines-alist
		'(("django" . "\\.html\\'"))))
;; Enable symbol-pair
(setq web-mode-enable-auto-pairing t)
;; Enable CSS colors
(setq web-mode-enable-css-colorization t)
;; Enable a vertical line to indicate the actual column
(setq web-mode-enable-current-column-highlight t)
;; Set size 4 as tab-width intentation
(setq web-mode-markup-indent-offset tab-width)
(setq web-mode-css-indent-offset tab-width)
(setq web-mode-code-indent-offset tab-width)
(provide 'web_dev)
;;; web_dev.el ends here
