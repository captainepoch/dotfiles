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
	(setq neo-force-change-root t))
 (add-hook 'server-switch-hook (lambda () (call-interactively 'neotree-show)))

;; projectile - project interaction library
(use-package projectile
	:ensure t
	;:init
	;(setq projectile-completion-system 'ivy)
	:config
	(projectile-mode +1)
	(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
	(setq projectile-switch-project-action 'neotree-projectile-action))

;; company - auto-completion system
;(use-package company
;        :ensure t
;        :init
;        (global-company-mode)
;		:diminish company-mode
;		:hook
;		(c-mode-hook . company-mode)
;        :config
;        (progn
;                ;; Use Company for completion
;                (bind-key [remap completion-at-point] #'company-complete company-mode-map)
;                (setq company-tooltip-align-annotations t)
;                (setq company-show-numbers t)
;                (setq company-tooltip-align-annotations t)
;                (setq company-dabbrev-downcase nil)
;                (setq company-tooltip-limit 30)
;                (setq company-idle-delay 0.3)
;                (setq company-echo-delay 0))
;)

;; company-quickhelp - documentation popup for company
;(use-package company-quickhelp
;        :ensure t
;        :defer t
;        :init (add-hook 'global-company-mode-hook #'company-quickhelp-mode))

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
