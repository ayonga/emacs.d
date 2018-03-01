;;; -*- lexical-binding: t -*-


(require-package 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
;; delegate theming to the currently active theme
(setq sml/theme nil)
(add-hook 'after-init-hook #'sml/setup)

(provide 'init-sml)

;;; init-sml.el ends here
