;; flyspell - natural lang. spell checking
(use-package flyspell
  :ensure t
  :config
  (setq ispell-program-name "aspell"
		ispell-dictionary "english")
  (set-face-underline 'flyspell-incorrect
					  '(:color "#dc322f" :style line))

  (defun change-dictionary-spanish ()
	(interactive)
	(ispell-change-dictionary "espanol"))

  (defun change-dictionary-english ()
	(interactive)
	(ispell-change-dictionary "english"))

										;:hook (org-mode . (lambda () (setq ispell-parser 'tex)))
  :bind (:map flyspell-mode-map
			  ("C-c d s" . change-dictionary-spanish)
			  ("C-c d e" . change-dictionary-english)))

;; writegood-mode - improve english writing
(use-package writegood-mode
  :ensure t)

;; markdown-mode - minor mode for markdown
(use-package markdown-mode
  :ensure t
  :defer t
  :mode ("\\.md\\'" "\\.mdown\\'" "\\.markdown\\'")
  :init
  (add-hook 'markdown-mode-hook
			(lambda ()
			  (visual-line-mode t)
			  (writegood-mode t)
			  (flyspell-mode t)))
  (setq-default word-wrap t))
