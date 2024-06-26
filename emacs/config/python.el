;; Packages to install with pip(2):
;; jedi flake8 pep8 importmagic autopep8 yapf nose

;; python-mode - python-mode for Emacs
(use-package python-mode
  :ensure t)

;; python, elpy - Python + elpy configuration
(use-package python
  :ensure t
  :mode (
		 ("\\.py$" . python-mode)
		 ("\\.wsgi$" . python-mode))
  :config
  (use-package elpy
    :ensure t
    :init
    (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
    (add-to-list 'auto-mode-alist '("\\.wsgi$" . python-mode))
    :config
    (setq elpy-rpc-backend "jedi")
    ;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
    ;;flycheck-python-flake8-executable "/usr/local/bin/flake8"
    :bind (:map elpy-mode-map
				("M-." . elpy-goto-definition)
				("M-," . pop-tag-mark)))
  (elpy-enable))

;; company-jedi - company backend for Python's jedi
(use-package company-jedi
  :after python
  :ensure t
  :init
  (add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))
  (setq company-jedi-python-bin "python"))

;; jedi - Python auto-completion for Emacs
(use-package jedi
  :after company-jedi
  :ensure t
  :init
  (add-to-list 'company-backends 'company-jedi))

;; pipenv - pipenv support for Emacs
(use-package pipenv
  :after python
  :ensure t
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

;; virtualenvwrapper - virtualenvs within Emacs
(use-package virtualenvwrapper
  :after python
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell)
  (setq venv-location '("~/Projects/PyVenv"
                        "~/.pyenv/versions")))
