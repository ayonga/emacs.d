;; ivory
(require-package 'irony)
(require 'irony)
;; If irony server was never installed, install it.
;; (unless (irony--find-server-executable) (call-interactively #'irony-install-server))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

;; Use compilation database first, clang_complete as fallback.
(setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
                                                irony-cdb-clang-complete))

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; use irony with company to get code completion.
(require-package 'company-irony)
(eval-after-load 'company '(add-to-list 'company-backends 'company-irony))


;; use irony with flycheck to get real-time syntax checking.
(require-package 'flycheck-irony)
(eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; Eldoc shows argument list of the function you are currently writing in the echo area.
(maybe-require-package 'eldoc)
(require-package 'irony-eldoc)
(add-hook 'irony-mode-hook #'irony-eldoc)

(provide 'init-irony)
