;;; custom.el --- Custom variables from Emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
	'(package-selected-packages
		 (quote
			 (company-shell magit elpy company-anaconda ## yasnippet eldoc-eval company-quickhelp undo-tree go-eldoc flycheck-pos-tip company-go company-jedi company-c-headers company comment-dwim-2 iedit anzu py-yapf go-mode markdown-mode web-mode exec-path-from-shell indent-guide smartparens flycheck smex adaptive-wrap use-package syntax-subword rainbow-delimiters))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:background "#999999"))))
 '(company-scrollbar-fg ((t (:background "#555555"))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white")))))
(provide 'custom.el)
;;; custom.el ends here
