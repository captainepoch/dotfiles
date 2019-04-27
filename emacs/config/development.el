;; Move to beginning/end of a function
(global-set-key (kbd "M-<up>") 'beginning-of-defun)
(global-set-key (kbd "M-<down>") 'end-of-defun)

;; exec-path-from-shell - system's $PATH
(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

;; comment-dwim-2 - superior commenting
(use-package comment-dwim-2
  :ensure t
  :bind ("M-;" . comment-dwim-2))

;; rainbow-delimiters - colored delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; neotree - show a directory tree with autoupdate
(use-package neotree
  :ensure t
  :bind (([f8] . neotree-toggle))
  :config
  (setq-default neo-smart-open t)
  (setq neo-force-change-root t)
  (setq neo-window-fixed-size nil))
(add-hook 'server-switch-hook (lambda () (call-interactively 'neotree-show)))
(add-hook 'neo-after-create-hook
		  (lambda (&rest _) (display-line-numbers-mode -1)))

;; projectile - project interaction library
(use-package projectile
  :ensure t
  ;;:init
  ;;(setq projectile-completion-system 'ivy)
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-switch-project-action 'neotree-projectile-action))

;; eldoc - shows the argument list of the function call
(use-package eldoc
  :ensure t
  ;;:diminish eldoc-mode
  :config (global-eldoc-mode))

;; yasnippet - template system
(use-package yasnippet
  :ensure t
  :diminish 'yas-minor-mode
  :demand t
  :config
  (add-to-list 'yas-snippet-dirs (concat user-emacs-directory "snippets"))
  (yas-global-mode 1))

;; magit - git interface for emacs
(use-package magit
  :ensure t
  :config
  (setq magit-section-initial-visibility-alist '((unpushed . show)))
  (git-commit-turn-on-auto-fill)
  (add-hook 'git-commit-mode-hook (lambda () (setq-local fill-column 72)))
  :bind (("C-x g" . magit-status)))

;; git-gutter - shows git diff in the gutter
(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode 't)
  :diminish git-gutter-mode)

;; flycheck - syntax checker
(use-package flycheck
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'flycheck-mode)
  :config
  (set-face-underline 'flycheck-error '(:color "#dc322f" :style line)))

;; iedit - edit multiple regions simultaneously
(use-package iedit
  :ensure t
  :bind (("C-c i" . iedit-mode)))

;; company - auto-completion system
(use-package company
  :ensure t
  :demand t
  :config
  (progn
	(setq
	 company-tooltip-limit 20
	 company-idle-delay 0.3
	 company-echo-delay 0
	 company-show-numbers t
	 company-tooltip-align-annotations t)
	(global-company-mode))
  :bind (("<C-tab>" . company-complete)))

;; company-quickhelp - documentation popup for company
(use-package company-quickhelp
  :ensure t
  :diminish company-mode
  :init
  (add-hook 'global-company-mode-hook #'company-quickhelp-mode)
  :config (company-quickhelp-mode)
  :bind ("C-c h" . #'company-quickhelp-manual-begin))

;; mwim -- move to the beginning/end code line
(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))
