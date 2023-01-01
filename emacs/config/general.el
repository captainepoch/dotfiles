;; Deactivate auto-save & backups
(setq-default auto-save-default nil)
(setq-default make-backup-files nil)
(desktop-save-mode -1)

;; Temporary files
(setq-default backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq-default auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; No need for ~ files when editing
(setq-default create-lockfiles nil)

;; Save always as UTF-8 and Unix endline
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; Put newlines at the end of every file
(setq-default require-final-newline t)

;; Delete white space at line ending
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set tabs insead of spaces
(setq-default
 indent-tabs-mode t
 tab-width 4
 standard-indent tab-width)

;; Open all files in the same Emacs window
(setq-default ns-pop-up-frames nil)

;; Keep all windows in one frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Don't load outdated bytecode files
(setq load-prefer-newer t)

;; Don't ask before visiting symlinks
(setq vc-follow-symlinks t)

;; Don't enforce two spaces to end sentences
(setq sentence-end-double-space nil)

;; Paste text wherever the point is
(setq-default mouse-yank-at-point t)

;; Turn down echo strokes
(setq-default
 echo-keystrokes 0.1
 use-dialog-box nil
 visible-bell t)

;; Show matching parens
(show-paren-mode t)
(setq-default show-paren-delay 0)

;; Replace highlighted text when typing
(delete-selection-mode t)

;; Befriend with the system's clipboard
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;; Preserve OS clipboard before killing text
(setq save-interprogram-paste-before-kill t)

;; Update buffer when file changes
(global-auto-revert-mode t)

;; Smart auto-indent... disable indenting previous line
(electric-indent-mode 1)
(setq-default electric-indent-inhibit t)

;; Smart matching parens/braces
(electric-pair-mode 1)

;; Smart tab - indent or complete
(setq tab-always-indent 'complete)

;; Now '_' is not considered a word-delimiter
(modify-syntax-entry ?_ "w")

;; Misc. key bindings
(global-set-key (kbd "RET") 'newline-and-indent)

;; Allow clipboard from outside Emacs
(setq select-enable-clipboard t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t)

;; hl-todo - highlights todos
(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode))

;; smartparens - better parents
;; (use-package smartparens
;;   :ensure t
;;   :config
;;   (sp-use-paredit-bindings)
;;   (add-hook 'prog-mode-hook #'smartparens-mode)
;;   (sp-pair "{" nil :post-handlers '(("||\n[i]" "RET"))))

;; syntax-subgord - fine-grained text operations
;; used to kill like vim/sublime/vscodium
(use-package syntax-subword
  :ensure t
  :pin melpa
  :init
  (setq syntax-subword-skip-spaces t)
  :config
  (global-syntax-subword-mode))

;; undo-tree - a undo tree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode 1)
  :config
  (setq undo-tree-auto-save-history nil))

;; uniquify - better disambiguation for same-named files
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-separator "/")
  ;; Rename after killing uniquified
  (setq uniquify-after-kill-buffer-p t)
  ;; Don't muck with special buffers
  (setq uniquify-ignore-buffers-re "^\\*"))

;; unkillable-scratch - make the *scratch* buffer unkillable
(use-package unkillable-scratch
  :ensure t
  :init (unkillable-scratch))

;; which-key - displays available keybindings in popup
(use-package which-key
  :ensure t
  :config
  (setq which-key-idle-delay 0.5)
  (which-key-mode +1))

;; yasnippet - template system
(use-package yasnippet
  :ensure t
  :demand t
  :hook (
		 (after-init . yas-global-mode)
		 (mail-mode . yas-minor-mode))
  :config
  (add-to-list 'yas-snippet-dirs (concat user-emacs-directory "snippets"))
  (yas-reload-all))
