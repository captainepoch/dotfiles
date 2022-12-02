;; flyspell - natural lang. spell checking
(use-package flyspell
  :ensure t
  :defer t
  :config
  (setq flyspell-issue-welcome-flag nil)
  (setq flyspell-issue-message-flag nil)
  (setq flyspell-mark-duplications-flag nil)
  (setq-default ispell-program-name "aspell")
  (setq-default ispell-list-command "list")
	(setq ispell-dictionary "en")
  (set-face-underline 'flyspell-incorrect
					  '(:color "#dc322f" :style line))

  (defun change-dictionary-spanish ()
	(interactive)
	(ispell-change-dictionary "es")
  (flyspell-buffer))

  (defun change-dictionary-english ()
	(interactive)
	(ispell-change-dictionary "en")
  (flyspell-buffer))

  :bind (:map flyspell-mode-map
			  ("C-c d s" . change-dictionary-spanish)
			  ("C-c d e" . change-dictionary-english)))

;; writegood-mode - improve english writing
(use-package writegood-mode
  :ensure t
  :defer t
  :init
  :hook (writegood-mode . mail-mode)
  :bind (
    ("C-c C-g g" . writegood-grade-level)
    ("C-c C-g e" . writegood-reading-ease)
  ))

;; markdown-mode - minor mode for markdown
(use-package markdown-mode
  :ensure t
  :defer t
  :mode (
		 ("\\.md" . markdown-mode)
		 ("\\.mdown" . markdown-mode)
		 ("\\.markdown" . markdown-mode))
  :init
  (add-hook 'markdown-mode-hook
			(lambda ()
			  (visual-line-mode t)
			  (writegood-mode t)
			  (flyspell-mode t)))
  (setq-default word-wrap t)
  :config
  (setq-default fill-column 80)
  (add-hook 'text-mode-hook 'turn-on-auto-fill)
  (setq-default auto-fill-function 'do-auto-fill))
