;; yaml-mode - mode for yaml files
(use-package yaml-mode
  :ensure t
  :defer t
  :mode (
		 ("\\.yml" . yaml-mode)
		 ("\\.yaml" . yaml-mode))
  :init
  (add-hook 'yaml-mode-hook 'turn-off-auto-fill))
