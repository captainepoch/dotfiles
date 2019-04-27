;; yaml-mode - mode for yaml files
(use-package yaml-mode
  :ensure t
  :defer t
  :mode (
		 ("\\.yml" . yaml-mode)
		 ("\\.yaml" . yaml-mode)
		 ("\\.sls" . yaml-mode))
  :init
  (add-hook 'yaml-mode-hook 'turn-off-auto-fill))

;; indent-guide - indent block
(use-package indent-guide
  :ensure t
  :init (add-hook 'yaml-mode-hook 'indent-guide-mode))
