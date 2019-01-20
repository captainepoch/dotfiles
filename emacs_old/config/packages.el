;;; packages.el --- Package managment

;;; Commentary:
;; - Package management

;;; Code:

(require 'package)

(add-to-list 'package-archives
	'("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	'("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	'("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
	'("tromey" . "http://tromey.com/elpa/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(provide 'packages)
;;; packages.el ends here
