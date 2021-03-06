
;;
;; jbear's emacs configuration
;;
;; -*- mode: emacs-lisp -*-
;;
;; @ author jbear
;; @ email hello.designe@facebook.com
;;

;; -- GLOBAL-SETTINGS --
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
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

(set-default-font "Hack" nil t)

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
                       magit
                       markdown-mode
                       gruvbox-theme
                       multiple-cursors
                       use-package
                       google-translate
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

;;CUSTOM-LINUM
(load "custom-linum.el")

;;BETTER-DEFAULTS
(require 'better-defaults)

;;SMOOTH-SCROLLING
(require 'smooth-scrolling)
(setq scroll-step 1)
(setq scroll-conservatively 1000)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse t)
(smooth-scrolling-mode 1)

;;JEDI SETTING
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;PYTHON-MODE
(require 'python-mode)

;; IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

;;MAGIT
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;;JS-MODE
(load  "js-config.el")

;;CPP-MODE
;; it should be edited

;; THEME
(load-theme 'gruvbox-dark-medium t)

;; MARKDOWN-MODE
(require 'markdown-mode)
(use-package markdown-mode

  
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; MULTIPLE-CURSORS
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-< C->") 'mc/mark-all-like-this)

;; GOOGLE-TRANSLATE
(require 'google-translate)
(require 'google-translate-default-ui)
(require 'google-translate-smooth-ui)

(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "ko")
(setq google-translate-translation-directions-alist '(("en" . "ko")))

(global-set-key (kbd "C-c t") 'google-translate-smooth-translate)
(global-set-key (kbd "C-c p") 'google-translate-at-point)
(global-set-key (kbd "C-c r") 'google-translate-at-point-reverse)

