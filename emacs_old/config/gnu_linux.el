;;; gnu_linux.el --- Specific config for GNU/Linux

;;; Commentary:
;; - Small config for GNU/Linux

;;; Code:

;; Set mouse wheel's speed
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3)))
;; Set Liberation Mono (size 10)
(add-to-list 'default-frame-alist '(font . "Liberation Mono-10"))
(set-face-attribute 'default t :font "Liberation Mono-10")
(provide 'gnu_linux)
;;; gnu_linux.el ends here
