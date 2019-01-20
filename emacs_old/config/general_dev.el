;;; general_dev.el --- Common development settings

;;; Commentary:
;; - Global settings for programming

;;; Code:

;; Delete selected text
(delete-selection-mode t)
;; Set TAB as default indentation
(setq-default tab-width 4)
(setq-default standard-indent tab-width)
;; Enable smart wrapping
(setq-default
	;; truncate-lines 1
	default-truncate-lines t
	toggle-word-wrap t
	truncate-partial-width-windows 1)
;; Visual Line Mode
(global-visual-line-mode +1)
;; Scroll in the compilation buffer
(setq compilation-scroll-output t)
;; Number of characters until the fill column
(setq-default fill-column 80)
(setq-default fill-comment-paragraph 60)
;; Delete white space at line ending
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Enter and indent
(setq electric-indent-mode t)
(setq-default tab-always-indent 'complete)
(global-set-key (kbd "RET") 'newline-and-indent)
;; Complete symbols
(add-hook 'prog-mode-hook 'electric-pair-mode)
;; Activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
;; Colors argument
(set-face-attribute 'eldoc-highlight-function-argument nil
	:underline t :foreground "LightSkyBlue"
	:weight 'bold)
;; Hungry for everything
(setq backward-delete-char-untabify-method 'hungry)
;; Delete spaces like tabs (because of yes...)
(setq backward-delete-char-untabify-method 'all)
;; Show unncessary whitespace that can mess up your diff
(setq show-trailing-whitespace 1)
;; (Un)Comment region
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
;; PACKAGE: adaptive-wrap
(use-package adaptive-wrap
	:ensure t
	:pin gnu
	:defer t
	:config
	(setq-default adaptive-wrap-extra-indent 2)
	(add-hook 'visual-line-mode-hook #'adaptive-wrap-prefix-mode))
;; PACKAGE: flycheck
(use-package flycheck
	:ensure t
	:config
	(add-hook 'prog-mode-hook #'flycheck-mode)
	(set-face-underline 'flycheck-error '(:color "Red1" :style line)))
;; PACKAGE: iedit
(use-package iedit
	:ensure t
	:bind (("C-:" . iedit-mode)))
;; PACKAGE: anzu
(use-package anzu
	:ensure t
	:init
	(global-anzu-mode)
	:config
	(set-face-attribute 'anzu-mode-line nil :foreground "yellow" :weight 'bold)
	(global-set-key (kbd "M-%") 'anzu-query-replace)
	(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp))
;; PACKAGE: comment-dwim-2
;;(global-set-key (kbd "M-;") 'comment-dwim-2)
;; PACKAGE: smex
(use-package smex
	:ensure t
	:bind ("M-x" . smex))
;; PACKAGE: undo-tree
(use-package undo-tree
	:ensure t
	:init
	(global-undo-tree-mode 1))
;; PACKAGE: company
(use-package company
	:ensure t
	:defer t
	;;:init
	;;(global-company-mode)
	;;:diminish company-mode
	:config
	(progn
		;; Use Company for completion
		(bind-key [remap completion-at-point] #'company-complete company-mode-map)
		(setq company-tooltip-align-annotations t)
		(setq company-show-numbers t)
		(setq company-tooltip-align-annotations t)
		(setq company-dabbrev-downcase nil)
		(setq company-tooltip-limit 20)
		(setq company-idle-delay 0.3)
		(setq company-echo-delay 0)))
;; PACKAGE: company-quickhelp
(use-package company-quickhelp
	:ensure t
	:defer t
	:init (add-hook 'global-company-mode-hook #'company-quickhelp-mode))
;; PACKAGE: eldoc
(use-package eldoc
	:ensure t
	;;:diminish eldoc-mode
	:config (global-eldoc-mode))
;; PACKAGE: yasnippet
(use-package yasnippet
	:ensure t
	:diminish 'yas-minor-mode
	:demand t
	:config
	(yas-global-mode 1))
;; PACKAGE: rainbow-delimiters
(use-package rainbow-delimiters
	:ensure t
	:hook (prog-mode . rainbow-delimiters-mode))
;; PACKAGE: smartparens
(use-package smartparens
	:ensure t
	:config
	(add-hook 'prog-mode-hook #'smartparens-mode)
	(sp-pair "{" nil :post-handlers '(("||\n[i]" "RET"))))
(provide 'general_dev)
;;; general_dev.el ends here
