;;; -*- lexical-binding: t -*-
(require-package 'ivy-bibtex)

(autoload 'ivy-bibtex "ivy-bibtex" "" t)
;; ivy-bibtex requires ivy's `ivy--regex-ignore-order` regex builder, which
;; ignores the order of regexp tokens when searching for matching candidates.
;; Add something like this to your init file:
(setq ivy-re-builders-alist
      '((ivy-bibtex . ivy--regex-ignore-order)
        (t . ivy--regex-plus)))

(setq bibtex-completion-bibliography
      '("c:/Users/ayonga/OneDrive/JabRef/reference.bib"))

(setq bibtex-completion-library-path
      '("C:/Users/ayonga/OneDrive/JabRef/pdfs"))

(setq bibtex-completion-notes-path "C:/Users/ayonga/OneDrive/JabRef/notes/reference_notes.org")

(setq bibtex-completion-pdf-field "file")

(setq bibtex-completion-additional-search-fields '(keywords tags))

(setq bibtex-completion-pdf-symbol "⌘")
(setq bibtex-completion-notes-symbol "✎")


(setq bibtex-completion-notes-template-one-file "\n* ${title}\n  :PROPERTIES:\n  :Custom_ID: ${=key=}\n  :Author: ${author}\n  :Year: ${year}\n  :END:\n\n")

(when *is-a-linux*
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (call-process "evince" nil 0 nil fpath)))
  )

(when *is-a-windows*
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (call-process "C:\\Program Files\\SumatraPDF\\SumatraPDF.exe" nil 0 nil fpath)))

  )


(setq ivy-bibtex-default-action 'ivy-bibtex-insert-key)

(provide 'init-ivy-bibtex)

;;; init-ivy-bibtex.el ends here
