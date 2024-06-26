;; Enable package repositories
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

;; Refresh contents when packages are not installed
(when (not package-archive-contents)
  (package-refresh-contents))

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
