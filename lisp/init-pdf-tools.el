;;; -*- lexical-binding: t -*-

(require-package 'pdf-tools)

;; initialise
(pdf-tools-install)
(setq-default pdf-view-display-size 'fit-page)

;; automatically annotate highlights
(setq pdf-annot-activate-created-annotations t)
;; use isearch instead of swiper
(define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
;; turn off cua so copy works
(add-hook 'pdf-view-mode-hook (lambda () (cua-mode 0)))

;; more fine-grained zooming
(setq pdf-view-resize-factor 1.1)
;; keyboard shortcuts
(define-key pdf-view-mode-map (kbd "h") 'pdf-annot-add-highlight-markup-annotation)
(define-key pdf-view-mode-map (kbd "t") 'pdf-annot-add-text-annotation)
(define-key pdf-view-mode-map (kbd "D") 'pdf-annot-delete)

;; wait until map is available
(with-eval-after-load "pdf-annot"
  (define-key pdf-annot-edit-contents-minor-mode-map (kbd "<return>") 'pdf-annot-edit-contents-commit)
  (define-key pdf-annot-edit-contents-minor-mode-map (kbd "<S-return>") 'newline)
  ;; save after adding comment
  (advice-add 'pdf-annot-edit-contents-commit :after 'bjm/save-buffer-no-args))


(provide 'init-pdf-tools)

;;; init-pdf-tools.el ends here
