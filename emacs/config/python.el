;; elpy - emacs python dev. env.
;;pip(2) install --upgrade jedi flake8 pep8 importmagic autopep8 yapf nose
(use-package elpy
  :ensure t
  :commands elpy-enable
  :init (with-eval-after-load 'python (elpy-enable))
  :config
  (electric-indent-local-mode -1)
  (delete 'elpy-module-highlight-indentation elpy-modules)
  (delete 'elpy-module-flymake elpy-modules))

;; jedi - Python auto-completion for Emacs
;; company-jedi - company backend for Python's jedi
(use-package jedi
  :ensure t
  :init
  (add-to-list 'company-backends 'company-jedi)
  :config
  (use-package company-jedi
	:ensure t
	:init
	(add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))
	(setq company-jedi-python-bin "python")))
