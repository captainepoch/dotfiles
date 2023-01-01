;; flyspell - natural lang. spell checking
(use-package flyspell
  :ensure t
  :defer t
  :config
  (setq flyspell-issue-welcome-flag nil
        flyspell-issue-message-flag nil
        flyspell-mark-duplications-flag nil
	    ispell-dictionary "en")
  (setq-default ispell-program-name "aspell")
  (setq-default ispell-list-command "list")
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

;; markdown-mode - minor mode for markdown
(use-package markdown-mode
  :ensure t
  :mode (
         ("\\.md'" . markdown-mode)
         ("\\.markdown'" . markdown-mode))
  :config
  (setq-default fill-column 80)
  (setq-default auto-fill-function 'do-auto-fill)
  (add-hook 'text-mode-hook 'turn-on-auto-fill)
  (add-hook 'markdown-mode-hook
			(lambda ()
			  (visual-line-mode t)
			  (flyspell-mode t)
			  (writegood-mode t)
			  (flyspell-mode t)))
  (setq-default word-wrap t))

;; writegood-mode - improve english writing
(use-package writegood-mode
  :ensure t
  :defer t
  :init
  :bind (
		 ("C-c C-g g" . writegood-grade-level)
		 ("C-c C-g e" . writegood-reading-ease)))
