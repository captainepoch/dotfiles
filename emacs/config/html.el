;; web-mode - mode for html files
(use-package web-mode
  :ensure t
  :defer t
  :mode (("\\.html" . web-mode))
  :config
  (setq
   web-mode-markup-indent-offset 2
   web-mode-code-indent-offset 2))

;; jinja-mode - mode for jinja(2) files
(use-package jinja2-mode
  :ensure t
  :mode (
		 ("\\.jinja" . jinja2-mode)
		 ("\\.jinja2" . jinja2-mode)))

;; emmet-mode - zen coding for HTML/CSS
(use-package emmet-mode
  :ensure t
  :config (add-hook 'web-mode-hook 'emmet-mode))

;; company-web - autocompletion for web
(use-package company-web
  :ensure t
  :config
  (add-to-list 'company-backends 'company-web-html))

;;; sass-mode - mode for .sass files
(use-package sass-mode
  :ensure t)

;; scss-mode - mode for .scss files
(use-package scss-mode
  :ensure t
  :init
  (setq-default scss-compile-at-save nil))

;;; less-css-mode - mode for editing less css files
(use-package less-css-mode
  :ensure t
  :config
  (use-package skewer-less
    :ensure t
    :hook (less-css-mode . skewer-less-mode)))

;; skewer-mode - live web development in Emacs
(use-package skewer-mode
  :ensure t
  :after css-mode
  :hook (css-mode . skewer-css-mode))

;;; css-eldoc - eldoc-mode plugin for CSS
(use-package css-eldoc
  :ensure t
  :after css-mode
  :hook (css-mode . turn-on-css-eldoc)
  :config
  (autoload 'turn-on-css-eldoc "css-eldoc"))
