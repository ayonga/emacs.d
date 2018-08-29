(require-package 'rtags)

(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)

(unless (rtags-executable-find "rc") (error "Binary rc is not installed!"))
(unless (rtags-executable-find "rdm") (error "Binary rdm is not installed!"))

(define-key c-mode-base-map (kbd "M-.") 'rtags-find-symbol-at-point)
(define-key c-mode-base-map (kbd "M-,") 'rtags-find-references-at-point)
(define-key c-mode-base-map (kbd "M-?") 'rtags-display-summary)
(rtags-enable-standard-keybindings)

(setq rtags-use-helm t)

;; Shutdown rdm when leaving emacs.
(add-hook 'kill-emacs-hook 'rtags-quit-rdm)

(require-package 'ivy-rtags)
(setq rtags-display-result-backend 'ivy)

(require-package 'flycheck-rtags)
(defun setup-flycheck-rtags ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil)
  (rtags-set-periodic-reparse-timeout 2.0)  ;; Run flycheck 2 seconds after being idle.
  )
(add-hook 'c-mode-hook #'setup-flycheck-rtags)
(add-hook 'c++-mode-hook #'setup-flycheck-rtags)

(require-package 'company-rtags)
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)



(provide 'init-rtags)
