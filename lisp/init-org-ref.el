;;; -*- lexical-binding: t -*-
(require-package 'org-ref)
;;(require-package 'org-plus-contrib)


(setq org-ref-default-bibliography '("/home/ayonga/Dropbox_Lab/TeamWide/Ayonga/Bibliography/reference.bib")
      org-ref-pdf-directory "/home/ayonga/Dropbox_Lab/TeamWide/Ayonga/Bibliography/pdfs/"
      org-ref-bibliography-notes "/home/ayonga/Dropbox_Lab/TeamWide/Ayonga/Bibliography/notes.org")



;; Some org-mode customization
(setq org-src-fontify-natively t
      org-confirm-babel-evaluate nil
      org-src-preserve-indentation t)


(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))

(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f"))

(setq bibtex-autokey-year-length 4
      bibtex-autokey-name-year-separator ""
      bibtex-autokey-year-title-separator ""
      bibtex-autokey-titleword-separator ""
      bibtex-autokey-titlewords 1
      bibtex-autokey-titlewords-stretch 1
      bibtex-autokey-titleword-length nil
      bibtex-autokey-name-length nil
      bibtex-autokey-name-case-convert-function (quote capitalize)
      bibtex-autokey-titleword-case-convert-function (quote capitalize))

(setq org-latex-default-packages-alist
      (-remove-item
       '("" "hyperref" nil)
       org-latex-default-packages-alist))

;; Append new packages
(add-to-list 'org-latex-default-packages-alist '("" "natbib" "") t)
(add-to-list 'org-latex-default-packages-alist
             '("linktocpage,pdfstartview=FitH,colorlinks,
linkcolor=blue,anchorcolor=blue,
citecolor=blue,filecolor=blue,menucolor=blue,urlcolor=blue"
               "hyperref" nil)
             t)

(setq org-ref-completion-library 'org-ref-ivy-cite)

(defun orcb-clean-nil-opinionated-all ()
  "Remove nil from all article fields.
Note that by default, this will leave the entry empty, which may
then get deleted by `bibtex-clean-entry.' To disable this
behavior, remove opts-or-alts from `bibtex-entry-format'. This
will leave the empty entries so that you may fill them in later."
  (interactive)
  (bibtex-beginning-of-entry)
  (let* ((entry (bibtex-parse-entry))
         (type (downcase (cdr (assoc "=type=" entry)))))
    (cl-loop for (field . text) in entry do
             (if (string= text "{nil}")
                 (bibtex-set-field field "")))))



(add-hook 'org-ref-clean-bibtex-entry-hook #'orcb-clean-nil-opinionated t)

(require 'org-ref)
(require 'org-ref-pdf)
(require 'org-ref-url-utils)
;; (setq org-ref-insert-cite-key "C-c [")

(provide 'init-org-ref)
;;; init-org-ref.el ends here
