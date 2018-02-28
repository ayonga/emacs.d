;;;yasnippet
(require-package 'yasnippet)
(require 'yasnippet)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(yas-global-mode t)

(setq company-yasnippet nil);; must

(add-to-list 'auto-mode-alist '("\\.yasnippet\\'" . snippet-mode))

(require-package 'yasnippet-snippets)

(provide 'init-yasnippet)
