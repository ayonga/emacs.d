;;; emacs + auctex

(require-package 'auctex)
(require-package 'cdlatex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-close-quote "")
(setq TeX-open-quote "")
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-command-list '("PDFLaTeX" "%`pdflatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
            (add-to-list 'TeX-command-list '("XeTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
            (setq TeX-command-default "PDFLaTeX")))

(mapc (lambda (mode)
        (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'smartparens-mode
            'visual-line-mode
            'turn-on-cdlatex))

(setq reftex-default-bibliography '("/home/ayonga/Dropbox_Lab/TeamWide/Ayonga/Bibliography/reference.bib"))


(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t ;; remove all tabs before saving
                  TeX-engine 'xetex ;; ('xetex) | ('default)
                  TeX-show-compilation t) ;; display compilation windows
            (TeX-global-PDF-mode t) ;; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (TeX-fold-mode 1)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
            ))

(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)

(when *is-a-mac* 
  (setq TeX-view-program-list
        '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")("Preview" "open -a Preview.app %o")))
  (setq TeX-view-program-selection
        '((output-pdf "Skim")
          (output-dvi "xdvi")))
  )

(when *is-a-linux*
  ;; Synctex with Okular
  (setq TeX-source-correlate-start-server t)
  (eval-after-load "tex"
    '(setcar (cdr (assoc 'output-pdf TeX-view-program-selection)) "Okular"))
  )

(when *is-a-windows*
  
  
  (setq TeX-view-program-list
        '(("Sumatra PDF" ("\"C:/Program Files/SumatraPDF/SumatraPDF.exe\" -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o"))))
  (setq TeX-view-program-selection
        '((output-pdf "Sumatra PDF")
          (output-dvi "xdvi")))
  
  )


(setq TeX-insert-quote t)
;; (ispell-change-dictionary "american" t)
;; (setq-default ispell-program-name "aspell")

(add-hook 'doc-view-mode-hook 'auto-revert-mode)
;;;end emacs + auctex



(require-package 'company-auctex)
(company-auctex-init)

(provide 'init-auctex)

;;; init-auctex.el ends here
