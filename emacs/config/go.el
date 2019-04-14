;; go-mode - enable Golang mode
(use-package go-mode
  :ensure t
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  (add-hook 'go-mode-hook 'flycheck-mode))

;; go-flycheck - adds flycheck for Golang
(add-to-list 'load-path "~/Projects/go/src/github.com/dougm/goflymake")
(use-package go-flycheck)

;;; TODO: test after setting up company
;; company-go - company support for Golang
;;(https://github.com/nsf/gocode)
;;(use-package company-go
;;:ensure t
;;:config
;;(add-hook 'go-mode-hook 'company-mode)
;;(add-to-list 'company-backends 'company-go))

;; go-eldoc - eldoc support for Golang
;;(https://github.com/nsf/gocode)
(use-package go-eldoc
  :ensure t
  :diminish eldoc-mode
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))
