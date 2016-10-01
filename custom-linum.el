;;
;; jbear's emacs costomized linum setting
;;

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
