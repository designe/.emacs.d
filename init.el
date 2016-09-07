;;
;; jbear's emacs configuration
;; @ author jbear
;; email hello.designe@facebook.com
;;

;; PACKAGE-ARCHIVES
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;;BETTER-DEFAULTS
(add-to-list 'load-path "~/.emacs.d/plugins/better-defaults")
(require 'better-defaults)

;;JEDI SETTING
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;PYTHON-MODE
(add-to-list 'load-path "~/.emacs.d/plugins/python-mode")
(require 'python-mode)

;; IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

;; Zone Mode
(require 'zone)
(zone-when-idle 1000)
