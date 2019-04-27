;; ac-php - auto-complete & company-mode for php
(use-package ac-php
  :ensure t)

;; php-mode - PHP Mpde for Emacs
(use-package php-mode
  :ensure t
  :mode (("\\.php\\'" . php-mode))
  :config
  (add-hook 'php-mode-hook
			'(lambda ()
			   (require 'company-php)
			   (company-mode t)
			   (add-to-list 'company-backends 'company-ac-php-backend))))

;; phpunit - PHP Tests in Emacs
(use-package phpunit
  :ensure t
  :mode (("\\.php\\'" . phpunit-mode)))
