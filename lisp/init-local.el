;;; Personal Information
(setq user-full-name "Ayonga Hereid")
(setq user-mail-address "ayonga27@gmail.com")

;; (when *is-a-windows*
;;   (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")  ; add aspell directory to emacs configuration
;;   (setq grep-find-command '("findstr /sn  *" . 13))
;;   (setq default-directory "~/"))

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
(menu-bar-mode 1)

;; Sensible undo
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)


;;(setq tab-width 4)
(setq-default fill-column 80)


(provide 'init-local)

;;; init-local.el ends here
