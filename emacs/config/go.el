;; go-mode - enable Golang mode
(use-package go-mode
  :ensure t
  :defer t
  :mode (("\\.go" . go-mode))
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'setup-go-mode-compile)
  (add-hook 'go-mode-hook 'flycheck-mode)
  (add-hook 'go-mode-hook (lambda ()
							(set (make-local-variable 'company-backends) '(company-go))
							(company-mode))))

;; go-flycheck - adds flycheck for Golang
(add-to-list 'load-path "~/Projects/go/src/github.com/dougm/goflymake")
(use-package go-flycheck)

;; company-go - company support for Golang
;;(https://github.com/nsf/gocode)
(use-package company-go
  :ensure t
  :after go-mode
  :config
  (setq tab-width tab-width)

  ;; Godef jump key binding
  :bind (:map go-mode-map
			  ("M-." . godef-jump)))

(use-package flymake-go
  :ensure t)

;; go-eldoc - eldoc support for Golang
;;(https://github.com/nsf/gocode)
(use-package go-eldoc
  :ensure t
  :diminish eldoc-mode
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(defun setup-go-mode-compile ()
  ;; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet")))
