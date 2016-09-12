;;
;; jbear's emacs configuration
;;
;; -*- mode: emacs-lisp -*-
;;
;; @ author jbear
;; @ email hello.designe@facebook.com
;;

;; -- Global Settings --
(add-to-list 'load-path "~/.emacs.d")
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
(require 'smooth-scrolling)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(ido-mode t)
(menu-bar-mode -1)
(normal-erase-is-backspace-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t_
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

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

;;JS-MODE
(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?$" . js2-mode))

;; Zone Mode
(require 'zone)
(zone-when-idle 100)
