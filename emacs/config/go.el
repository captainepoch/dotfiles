;; Go tools
;;  go install github.com/dougm/goflymake@latest
;;  go install golang.org/x/tools/cmd/goimports@latest
;;  go install golang.org/x/tools/gopls@latest

;; go-mode - enable Golang mode
(use-package go-mode
  :ensure t
  :defer t
  :mode (("\\.go" . go-mode))
  :hook (
		 (before-save . gofmt-before-save)
		 (go-mode . setup-go-mode-compile)
		 (go-mode . flycheck-mode)
		 (go-mode . (lambda ()
					  (set (make-local-variable 'company-backends) '(company-go))
					  (company-mode))))
  :config
  (setq gofmt-command "goimports"))

;; company-go - company support for Golang
(use-package company-go
  :ensure t
  :after go-mode
  :config
  (setq tab-width tab-width)
  ;; Godef jump key binding
  :bind (:map go-mode-map
			  ("M-." . godef-jump)))

;; flymake-go - flymake handler for go-mode files
(use-package flymake-go
  :ensure t
  :after go-mode)

;; go-eldoc - eldoc support for Golang
;;(use-package go-eldoc
;;  :ensure t
;;  :diminish eldoc-mode
;;  :hook (go-mode . go-eldoc-setup))

(defun setup-go-mode-compile ()
  ;; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet")))
