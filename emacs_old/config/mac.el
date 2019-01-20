;;; mac.el --- Specific config for Mac OS X

;;; Commentary:
;; - Small config for Mac OS X

;;; Code:

;; Unbind right-alt
(setq ns-right-alternate-modifier nil)
;; Set Liberation Mono (size 11)
(add-to-list 'default-frame-alist '(font . "Liberation Mono-11"))
(set-face-attribute 'default t :font "Liberation Mono-11")
(provide 'mac)
;;; mac.el ends here
