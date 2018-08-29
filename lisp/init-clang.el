;; clang-format can be triggered using C-c C-f
;; Create clang-format file using google style
;; clang-format -style=google -dump-config > .clang-format
(require-package 'clang-format)
(require 'clang-format)
(global-set-key (kbd "C-c C-f") 'clang-format-region)



(require-package 'modern-cpp-font-lock)
(require 'modern-cpp-font-lock)
(modern-c++-font-lock-global-mode t)


(require-package 'google-c-style)
(require 'google-c-style)

;; (require 'google-set-c-style)
;; This prevents the extra two spaces in a namespace that Emacs
;; otherwise wants to put... Gawd!
(add-hook 'c-mode-common-hook 'google-set-c-style)
;; Autoindent using google style guide
(add-hook 'c-mode-common-hook 'google-make-newline-indent)




(provide 'init-clang)
