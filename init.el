;;
;; jbear's emacs configuration
;;
;; -*- mode: emacs-lisp -*-
;;
;; @ author jbear
;; @ email hello.designe@facebook.com
;;

;; -- GLOBAL-SETTINGS --
(add-to-list 'load-path "~/.emacs.d")
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
(require 'whitespace)
(require 'dired-x)
(require 'compile)

(ido-mode t)
(menu-bar-mode -1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

;; -- PACKAGE-ARCHIVES --
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(setq jbear-packages '(better-defaults 
                       smooth-scrolling 
                       python-mode
                       jedi 
                       js2-mode
                       js-comint
                       virtualenv
                       ))

;; -- JBEAR'S PACKAGE CHECK --
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package jbear-packages)
  (unless (package-installed-p package)
    (if (y-or-n-p (format "There is no package : '%s'. Install it? " package))
        (package-install package)
      package)))

(package-initialize)

;;BETTER-DEFAULTS
(require 'better-defaults)

;;SMOOTH-SCROLLING
(require 'smooth-scrolling)

;;JEDI SETTING
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;PYTHON-MODE
(require 'python-mode)

;; IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

;;JS-MODE
(load  "js-config.el")
(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?$" . js2-mode))

;; Zone Mode
(require 'zone)
(zone-when-idle 100)
