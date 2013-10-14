;;; config-org.el --- Orgmode configuration.

;; Copyright (C) 2012 Mateusz Rzeszutek

;; Author: Mateusz Rzeszutek <rzeszutekm@gmail.com>
;; Created: 12 Feb 2013
;; Keywords: orgmode, org

;; This file is not part of GNU Emacs.

;;; Commentary:
;; Basic configuration for org-mode.

;;; Code:

(require 'org-bullets)
(require 'org-latex)
(require 'org-special-blocks)

(require 'ob-octave)
(require 'ob-ditaa)

(add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-completion-use-ido t)

(add-hook 'org-mode-hook (lambda ()
                           (org-bullets-mode 1)))

;; org agenda
(setq org-agenda-files (list "~/gtd.org"))
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-timestamp-if-done t)
(setq org-agenda-start-on-weekday 1)
(setq org-scheduled-past-days 0)

;; babel
(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
   (octave . t)))

(setq org-ditaa-jar-path "~/bin/ditaa0_9.jar")

;; orgmode latex export settings
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))

(add-to-list 'org-export-latex-default-packages-alist '("utf8" "inputenc" t))

(add-to-list 'org-export-latex-classes
             '("book-pl"
               "\\documentclass[11pt]{mwbk}
                \\usepackage{polski}
                \\usepackage[polish]{babel}"
               ("\\part{%s}" . "\\part*{%s}")
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))            

(add-to-list 'org-export-latex-classes
             '("article-pl"
               "\\documentclass[11pt]{mwart}
                \\usepackage[hmargin=3cm,vmargin=3cm]{geometry}
                \\usepackage{amsfonts}
                \\usepackage{amsmath}
                \\usepackage{polski}
                \\usepackage[polish]{babel}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass[11pt]{article}
                \\usepackage[hmargin=3cm,vmargin=3cm]{geometry}
                \\usepackage{amsfonts}
                \\usepackage{amsmath}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-export-latex-classes
             '("book"
               "\\documentclass[11pt]{book}
                \\usepackage[hmargin=3cm,vmargin=3cm]{geometry}"
               ("\\part{%s}" . "\\part*{%s}")
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(add-to-list 'org-export-latex-classes
             '("letter"
               "\\documentclass[11pt]{letter}
                \\usepackage{color}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; minted setup
(setq org-export-latex-listings 'minted)
(add-to-list 'org-export-latex-packages-alist '("" "minted"))
(setq org-export-latex-minted-options
      '(;;("frame" "lines")
        ("fontsize" "\\scriptsize")))

(setq org-latex-to-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(provide 'config-org)
;;; config-org.el ends here
