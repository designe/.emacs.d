;; -- JS editing and node REPL ---
 
(require 'js-comint)
(defun whitespace-clean-and-compile()
  (interactive)
  (whitespace-cleanup-all)
  (compile compile-command))

;; Configure jshint for JS sytle checking.
;; - Install : $ npm install -g jshint
;; - Usage : Hit C-cC-u within any emacs buffer visiting a .js file
(setq jshint-cli "jshint --show-non-errors ")
(setq compilation-error-regexp-alist-alist
      (cons '(jshint-cli "^\\[a-zA-Z\.0-9_/-]+\\): line \\([0-9]+\\), col \\([0-9]+\\)"
                         1 ;; file
                         2 ;; line
                         3 ;; column
                         )
            compilation-error-regexp-alist-alist))

(setq compilation-error-regexp-alist (cons 'jshint-cli compilation-error-regexp-alist))

(add-hook 'js-mode-hook 
          '(lambda ()
             (set (make-local-variable 'compile-command)
                  (let ((file buffer-file-name)) (concat jshint-cli file))
             (local-set-key "\C-c\C-u" 'whitespace-clean-and-compile))
            )

