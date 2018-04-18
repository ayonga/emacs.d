;;; -*- lexical-binding: t -*-
(require-package 'ivy-bibtex)

(setq bibtex-completion-bibliography
      '("/home/ayonga/Dropbox_Lab/TeamWide/Ayonga/Bibliography/reference.bib"))

(setq bibtex-completion-library-path
      '("/home/ayonga/Dropbox_Lab/TeamWide/Ayonga/Bibliography/pdfs/"))

(setq bibtex-completion-notes-path "/home/ayonga/Dropbox/notes/reference_notes.org")

(setq bibtex-completion-pdf-field "file")

(setq bibtex-completion-additional-search-fields '(keywords tags))

(setq bibtex-completion-pdf-symbol "⌘")
(setq bibtex-completion-notes-symbol "✎")


(setq bibtex-completion-notes-template-one-file "\n* ${title}\n  :PROPERTIES:\n  :Custom_ID: ${=key=}\n  :INTERLEAVE_PDF: pdfs/${=key=}.pdf\n  :Author: ${author}\n  :Year: ${year}\n  :END:\n\n")

(setq bibtex-completion-pdf-open-function
      (lambda (fpath)
        (call-process "evince" nil 0 nil fpath)))

(setq ivy-bibtex-default-action 'ivy-bibtex-insert-key)

(provide 'init-ivy-bibtex)

;;; init-ivy-bibtex.el ends here
