;;; applications.el --- Config for individual apps which uses emacs as file editor
;; Mutt
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))
(provide 'applications)
;;; applications.el ends here
