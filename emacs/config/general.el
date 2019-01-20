;; Deactivate auto-save & backups
(setq auto-save-default nil)
(setq make-backup-files nil)
(desktop-save-mode -1)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Temporary files
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Save always as UTF-8 and Unix endline
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Put newlines at the end of every file
(setq require-final-newline t)

;; Set TABS insead of spaces
(setq-default tab-width 4)
(setq-default standard-indent tab-width)

;; Open all files in the same emacs window
(setq ns-pop-up-frames nil)

;; Keep all windows in one frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Don't load outdated bytecode files
(setq load-prefer-newer t)

;; Don't ask before visiting symlinks
(setq vc-follow-symlinks t)

;; Don't enforce two spaces to end sentences
(setq sentence-end-double-space nil)

;; Paste text wherever the point is
(setq mouse-yank-at-point t)

;; Turn down echo strokes
(setq echo-keystrokes 0.1
	use-dialog-box nil
	visible-bell t)

;; Show matching parens... but don't make me wait for it
(show-paren-mode t)
(setq show-paren-delay 0)

;; Replace highlighted text when typing
(delete-selection-mode t)

;; Befriend with the system's clipboard
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;; Update buffer when file changes
(global-auto-revert-mode t)

;; Smart auto-indent... disable indenting previous line (WHY?!)
(electric-indent-mode 1)
(setq-default electric-indent-inhibit t)

;; Smart matching parens/braces
(electric-pair-mode 1)

;; Smart tab - indent or complete
(setq tab-always-indent 'complete)

;; Misc. key bindings
(global-set-key (kbd "RET") 'newline-and-indent)
;(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; uniquify - better disambiguation for same-named files
(use-package uniquify
	:config
	(setq uniquify-buffer-name-style 'forward)
	(setq uniquify-separator "/")
	;; Rename after killing uniquified
	(setq uniquify-after-kill-buffer-p t)
	;; Don't muck with special buffers
	(setq uniquify-ignore-buffers-re "^\\*"))

;; which-key - displays available keybindings in popup
(use-package which-key
	:ensure t
	:config
	(setq which-key-idle-delay 0.5)
	(which-key-mode +1))

;; hl-todo - highlights todos
(use-package hl-todo
	:ensure t
	:config
	(global-hl-todo-mode))

;; smarparens - better parents
(use-package smartparens
	:ensure t
	:config
	(add-hook 'prog-mode-hook #'smartparens-mode)
	(sp-pair "{" nil :post-handlers '(("||\n[i]" "RET"))))

;; undo-tree - a undo tree
(use-package undo-tree
	:ensure t
	:init
	(global-undo-tree-mode 1))

;; unkillable-scratch - make the *scratch* buffer unkillable
(use-package unkillable-scratch
	:ensure t
	:init (unkillable-scratch))