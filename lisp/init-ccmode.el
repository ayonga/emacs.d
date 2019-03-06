;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require-package 'cc-mode)
(require 'cc-mode)
(define-key c++-mode-map (kbd "C-c C-c") 'compile)
(define-key c++-mode-map (kbd "C-c C-k") 'kill-compilation)

;; (defvaralias 'c-basic-offset 'tab-width)
;; (defvaralias 'cperl-indent-level 'tab-width)

;;(add-to-list 'auto-mode-alist '("\\.cc$'" . c-mode)

(provide 'init-ccmode)
