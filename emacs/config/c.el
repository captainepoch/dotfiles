;; Add headers and .c files to c-mode
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))

;; Set TAB width
(setq-default c-basic-offset tab-width)

;; Default C coding style
(setq-default c-default-style "k&r")

;; Delete hungrily
(setq-default c-hungry-delete-key t)

;; Now '_' is not considered a word-delimiter
(modify-syntax-entry ?_ "w")

;; Set c11 as standard for flycheck
(setq-local flycheck-gcc-language-standard "c11")

;; For comments (M-j after /*)
(defun my-prettify-c-block-comment (orig-fun &rest args)
  (let* ((first-comment-line (looking-back "/\\*\\s-*.*"))
		 (star-col-num (when first-comment-line
						 (save-excursion
						   (re-search-backward "/\\*")
						   (1+ (current-column))))))
	(apply orig-fun args)
	(when first-comment-line
	  (save-excursion
		(newline)
		(dotimes (cnt star-col-num)
		  (insert " "))
		(move-to-column star-col-num)
		(insert "*/"))
	  ))
  ;; Ensure one space between the asterisk and the comment
  (when (not (looking-back " "))
	(insert " ")))
(advice-add 'c-indent-new-comment-line :around #'my-prettify-c-block-comment)

;; company-c-headers
(use-package company-c-headers
  :ensure t
  :pin melpa
  :defer nil
  :config
  (add-to-list 'company-backends 'company-c-headers))
