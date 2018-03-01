;;; Personal Information
(setq user-full-name "Ayonga Hereid")
(setq user-mail-address "ayonga27@gmail.com")


;;; custom UI setttings from Prelude

(setq-default cursor-type 'bar)
;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;;;cursor stop blinking
(blink-cursor-mode -1)
(transient-mark-mode 1)

;;;highlight the current row
(require-package 'hl-line)
(global-hl-line-mode t)


;; sensible undo
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)

;; delete selected region
(global-set-key (kbd "<delete>") 'delete-region)
;; (global-set-key (kbd "<backspace>") 'delete-region)

;;(setq tab-width 4)
(setq-default fill-column 80)


(provide 'init-local)

;;; init-local.el ends here
