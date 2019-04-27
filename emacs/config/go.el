;; go-mode - enable Golang mode
(use-package go-mode
  :ensure t
  :defer t
  :mode (("\\.go" . go-mode))
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'setup-go-mode-compile)
  (add-hook 'go-mode-hook #'smartparens-mode)
  (add-hook 'go-mode-hook 'flycheck-mode))

;; go-flycheck - adds flycheck for Golang
;; (add-to-list 'load-path "~/Projects/go/src/github.com/dougm/goflymake")
;; (use-package go-flycheck)

;; company-go - company support for Golang
;;(https://github.com/nsf/gocode)
;; (use-package company-go
;;   :ensure t
;;   :after go-mode
;;   :config
;;   (setq tab-width tab-width)

;; go-eldoc - eldoc support for Golang
;;(https://github.com/nsf/gocode)
(use-package go-eldoc
  :ensure t
  :diminish eldoc-mode
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))
