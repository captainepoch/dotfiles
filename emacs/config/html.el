;; web-mode - load web mode
(use-package web-mode
  :ensure t
  :defer t
  :mode ("\\.html\\'" "\\.jinja\\'")
  :config
  (setq
   web-mode-markup-indent-offset 4
   web-mode-code-indent-offset 4))

;; emmet-mode - zen coding for HTML/CSS
(use-package emmet-mode
  :ensure t
  :config (add-hook 'web-mode-hook 'emmet-mode))

;; company-web - autocompletion for web
(use-package company-web
  :ensure t
  ;;:bind (("C-c w" . company-web-html))
  :config
  (add-to-list 'company-backends 'company-web-html))
