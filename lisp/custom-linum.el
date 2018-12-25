;;
;; jbear's emacs costomized linum setting
;;

;; =========== linum customizing ==========
(set-face-attribute 'line-number nil
                    :foreground "#504945"
                    :background "#282828")

(set-face-attribute 'line-number-current-line nil
                   :foreground "#B57614"
                   :background "#42403f"
                   :weight 'bold)

(setq display-line-numbers 'visual)
(global-display-line-numbers-mode)
