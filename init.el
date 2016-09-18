
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

;; -- linum customizing --
(defvar linum-current-line 1 "Current line number.")
(defvar linum-border-width 1 "Border width for linum.")
(defface linum-current-line
  `((t :inherit linum
       :forground "goldenrod"
       :background "#555"
       :weight bold
       ))
  "Face for displaying the current line number."
  :group 'linum)

(defadvice linum-update (before advice-linum-update activate)
  "Set the current line."
  (setq linum-current-line (line-number-at-pos)
        linum-border-width (number-to-string
                            (+ 1 (length
                                  (number-to-string
                                   (count-lines (point-min) (point-max))))))))

(defun linum-highlight-current-line (line-number)
  "Highlight the current line number using `linum-current-line` face."
  (let ((face (if (= line-number linum-current-line)
                  'linum-current-line
                'linum)))
    (propertize (format (concat "%" linum-border-width "d ") line-number)
                'face face)))

(setq linum-format 'linum-highlight-current-line)
(global-linum-mode 1)


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

;;JS-MODE
(load  "js-config.el")

;; Zone Mode
(require 'zone)
(zone-when-idle 100)
