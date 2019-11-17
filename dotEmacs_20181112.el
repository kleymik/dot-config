
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; see also  c:/Users/kleynmi/AppData/Roaming/.emacs
;;; File name: ` ~/.emacs '
;; read-kbd-macro
;; (setq tab-stop-list '(60))
;; (server-start)
;;--------------------------------------------------------------- Handy commands quick ref
;; rot13-region  (C-c C-r)
;; telnet host port     to open
;; ^Q^] close           to close

;; TBD dired-find-file-otherwindow open a cygwin link by inspecting it
;;
;;
;; flush-lines
;; C-h f describe-finction Info-goto-emacs-command-node
;; C-h F Info-goto-emacs-command-node
;; (goto-char (mark-marker))
;; (goto-char (pop-global-mark))
;;  beginning-of-line
;; end-of-line
;;


;;
;;---------------------------------------------------------------------REVERT
;; revert buffer coding C-x C-m
;;   variable:  buffer-file-coding-system
;;          USE iso-latin..
;;          USE utf-16-unix
;;
;; accepted If you haven't changed the file, you can try M-x
;; revert-buffer-with-coding-system. One of latin-1 or utf-8 should
;; work, depending on the file.

;; You can also mark the entire file with C-x h and then try M-x
;; recode-region. It will ask you for Text was really in and But was
;; interpreted as. For the first file in your question, it looks
;; like it should be latin-1 and utf-8, and for the second example
;; it should probably be the other way around, utf-8 and latin-1.

;; After you got it right, you can choose which coding system to
;; save the file with using M-x set-buffer-file-coding-system (or
;; C-x C-m f for short).

;;-------------------------------------------------------------------- DEBUG
;;Go to where your function is defined and type M-x edebug-defun,
;;This will work the next time the function is called. You can check the docs[1]or just type ?.

;; edebug-defun inside function definition  <- revert by re-evaluating the defun
;; debug-on-entry
;; toggle-debug-on-error
;; toggle-debug-on-quit
;; insert (debug)


(require 'ido)
(ido-mode t)
(define-key ido-file-completion-map [up]   'ido-prev-work-directory)
(define-key ido-file-completion-map [down] 'ido-next-work-directory)

(global-set-key "\C-x\C-b" 'ibuffer)



;;(setq hscroll-margin 30)
;;(setq hscroll-step 20) ;; # 0 
(delete-selection-mode 0) ; don't delete selection with next char
(setq kill-ring-max 20)
(setq-default indent-tabs-mode nil)
;;(setq debug-on-error t)
;;(setq debug-on-error nil)
;; new 
;;  (xclip-mode 1) for emacs in terminal , export kill-yank
;;  C-c C-b associate ielm with buffer
;;  M-6 M-x Buffer-menu-sort = sort by file name
;;  (setq Buffer-menu-sort-column 6)
;;  C-x C-v = find alternate file   -> then grab filepath
;; (setq header-line-format mode-line-format)
;   State: SET for current session only.
(setq uniquify-buffer-name-style 'forward)
(require 'uniquify)
;; proced       to view processes
;; tail-mode    auto-revert-tail-mode (C-cr)
;; set-buffer-file-coding-system unix <--format

;; map-query-regexp-replace
;; isearch-forward-regexp
;; M-s h l     highlight-lines-matching-regexp    Highlights all lines matching a regular expression
;; M-s h p     highlight-phrase                    Highlights everything matching a phrase
;; M-s h r     highlight-regexp                    Highlights everything matching a regular expression
;; M-s h u     unhighlight-regexp                    Deletes the highlighter under point
;; M-s h w     hi-lock-write-interactive-patterns Inserts a list of Hi-Lock patterns into the buffer
;; M-s h f     hi-lock-find-patterns                Searches for Hi-Lock patterns in the buffer to use.

;; C-x r s r Copy region into register "r" (copy-to-register).
;; C-x r i r Insert text from register r (insert-register).

;; C-ci         indent-to-column
;; C-x r w w; C-x r j w                        Save winows config in register "w" ; jump back (where <register> is a single character) to jump back to it.
;;              package-list-packages
;; C-j          eval in scratch buffer ?
;; C-x RTN f unix RTN  dos2unix

;; C-u C-space or C-u C-@ move back to previous positions (within buffer)
;; C-x C-space or C-x C-@ move back to previous positions (between buffers)
;; C-x n n; C-x n w                            Narrow to Region; Widen
;; C-;                                         Highlight item for MULTIPLE edit

;;C-a            ;; move-beginning-of-line
;;C-s            ;; isearch-forward
;;/                ;; self-insert-command
;;C-b            ;; backward-char
;;C-s            ;; isearch-forward
;;:                ;; self-insert-command
;;C-x C-x        ; exchange-point-and-mark
;;ESC            ;; ESC-prefix
;;w                ;; self-insert-command
;;C-x C-f        ;; find-file
;;C-a            ;; move-beginning-of-line
;;C-y            ;; yank
;;C-k            ;; kill-line
;;DEL            ;; delete-backward-char
;;RET            ;; newline

;; cleanMlLog
;;C-s			;; isearch-forward
;;[			;; self-insert-command
;;C-q			;; unfill-paragraph
;;C-h C-a			;; about-emacs
;;ESC			;; ESC-prefix
;;3*C-k			;; kill-line

(fset 'cleanMlLog [?\C-s ?\[ ?\C-q ?\C-h ?\C-a escape ?\C-k ?\C-k ?\C-k])

(setq load-path (append load-path '("L:/MyDocs/ulib/emacs"))) ;; (insert (format "%s" load-path))
;;; ----------------------------------------------------------------------  diff
(setq ediff-shell "C:/cygwin64/bin/mintty.exe")
(if (file-directory-p "C:/cygwin64/bin")      (add-to-list 'exec-path "C:/cygwin64/bin"))
;;------------------------------------------------------------------------------- Switches
(blink-cursor-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)
(global-hl-line-mode t)
;(setq-default frame-title-format "%b %p %p(%f)")
(setq-default frame-title-format "%f")
;; add? (setq-default line-spacing 0.06)
;;(global-mark-ring-max 50)
;;(setq set-mark-command-repeat-pop 1) - needs emacs version 22
;;(global-set-key [M-SPC] 'pop-global-mark)
;;(global-set-key "\C-." 'pop-global-mark)
;;(setq mark-ring-max 50)
;;(global-set-key [S-right] 'forward-word)
;;-----MATCH LINE----
;; M-x clone-indirect-buffer RET
;;------------------------------------------------------------------------------ Eval
;; (global-set-key [remap eval-expression] 'pp-eval-expression)
(defun eval-and-insert ()
  "Eval expression and insert value after the expression"
  (interactive)
  (eval-last-sexp 0)
    (eval-print-last-sexp 0))
;;  (insert (format "%s" load-path) )

;; Normally, this function truncates long output according to the value
;; of the variables `eval-expression-print-length' and
;; `eval-expression-print-level'.  With a prefix argument of zero,
;; however, there is no such truncation.  Such a prefix argument
;; lso causes integers to be printed in several additional formats
;; (octal, hexadecimal, and character).


;;------------------------------------------------------------------------------ Shell
(setq shell-file-name "bash")
(setq explicit-shell-file-name shell-file-name)
;(setq shell-command-switch "-c")

(defun shell-command-on-buffer (command)
  (interactive "sShell command on buffer: ")
  (shell-command-on-region (point-min) (point-max) command t))

;;------------------------------------------------------------------------------
(defun uniq-lines (beg end)
  "Unique lines in region.
Called from a program, there are two arguments:
BEG and END (region to sort)."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (kill-line 1)
        (yank)
        (let ((next-line (point)))
          (while
              (re-search-forward
               (format "^%s" (regexp-quote (car kill-ring))) nil t)
            (replace-match "" nil nil))
          (goto-char next-line))))))
;;------------------------------------------------------------------------------ Line Spacing
(setq-default line-spacing 0.06)
(defun toggle-line-spacing ()
  "Toggle line spacing between no extra space to extra half line height."
  (interactive)
  (if (eq line-spacing nil)
      (setq-default line-spacing 0.05)    ; add 0.5 height between lines
    (setq-default line-spacing nil)))    ; no extra heigh between lines
;;------------------------------------------------------------------------------ Column space
(defun go-to-column (column)
  (interactive "nColumn: ")
  (move-to-column column t))

;;          (lambda (win)
;;            (select-window win)
;;            (condition-case nil
;;                (funcall func arg)
;;              (error nil)))))
;;     (funcall func arg)))

 
;; ----------------------------------------------------------------------------- DOS Mode
;;(autoload 'dos-mode "/home/uri03204/myDocs/ulib/emacs/dos.elc" "Enter DOS CMD mode." t)7

;; ----------------------------------------------------------------------------- OPEN with associated app
(defun w32-browser (doc)
  (w32-shell-execute 1 doc))
;; if Windows
;;  (when (string-equal system-type "windows-nt")
;;    (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" default-directory t t)))

;;------------------------------------------------------------------------------- iedit Mode
;; TBD (autoload 'iedit-mode "/home/uri03204/myDocs/ulib/emacs/iedit.elc" "Enter iedit mode" t)

;; I have this working. You need to be sure that python-shell-interpreter is set to an executable 
;; in your path rather than a precise path to the file 
;; ("ipython" rather than "c:/Users/me/stuff/python_stuff/ipython.exe")
;; Second, you need to tell pyvenv where to find your environments. 
;; For me, this is: (setenv "WORKON_HOME" "c:/Users/xxxxx/AppData/Local/Continuum/Anaconda3/envs")
;; you could also try the solution here which, if I remember correctly, can be used if the above solution doesn't work.
;; permalinkembed

;;------------------------------------------------------------------------------- Language Modes
;;(add-to-list 'auto-mode-alist '("\\.diff$"    . ediff-mode)   )
;;(setq auto-mode-alist   (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
;;(insert (format "%s" auto-mode-alist))((\.m\' . matlab-mode) (\.py$ . python-mode) (\.te?xt\' . text-mode) (\.c\' . c-mode) (\.h\' . c-mode) (\.tex\' . tex-mode) (\.ltx\' . latex-mode) (\.el\' . emacs-lisp-mode) (\.scm\' . scheme-mode) (\.l\' . lisp-mode) (\.lisp\' . lisp-mode) (\.f\' . fortran-mode) (\.F\' . fortran-mode) (\.for\' . fortran-mode) (\.p\' . pascal-mode) (\.pas\' . pascal-mode) (\.ad[abs]\' . ada-mode) (\.\([pP]\([Llm]\|erl\)\|al\)\' . perl-mode) (\.s?html?\' . html-mode) (\.cc\' . c++-mode) (\.hh\' . c++-mode) (\.hpp\' . c++-mode) (\.C\' . c++-mode) (\.H\' . c++-mode) (\.cpp\' . c++-mode) (\.cxx\' . c++-mode) (\.hxx\' . c++-mode) (\.c\+\+\' . c++-mode) (\.h\+\+\' . c++-mode) (\.m\' . objc-mode) (\.java\' . java-mode) (\.mk\' . makefile-mode) (\(M\|m\|GNUm\)akefile\(\.in\)?\' . makefile-mode) (\.am\' . makefile-mode) (\.texinfo\' . texinfo-mode) (\.te?xi\' . texinfo-mode) (\.s\' . asm-mode) (\.S\' . asm-mode) (\.asm\' . asm-mode) (ChangeLog\' . change-log-mode) (change\.log\' . change-log-mode) (changelo\' . change-log-mode) (ChangeLog\.[0-9]+\' . change-log-mode) (changelog\' . change-log-mode) (changelog\.[0-9]+\' . change-log-mode) (\$CHANGE_LOG\$\.TXT . change-log-mode) (\.scm\.[0-9]*\' . scheme-mode) (\.[ck]?sh\'\|\.shar\'\|/\.z?profile\' . sh-mode) (\(/\|\`\)\.\(bash_profile\|z?login\|bash_login\|z?logout\)\' . sh-mode) (\(/\|\`\)\.\(bash_logout\|shrc\|[kz]shrc\|bashrc\|t?cshrc\|esrc\)\' . sh-mode) (\(/\|\`\)\.\([kz]shenv\|xinitrc\|startxrc\|xsession\)\' . sh-mode) (\.m?spec\' . sh-mode) (\.mm\' . nroff-mode) (\.me\' . nroff-mode) (\.ms\' . nroff-mode) (\.man\' . nroff-mode) (\.\(u?lpc\|pike\|pmod\)\' . pike-mode) (\.TeX\' . tex-mode) (\.sty\' . latex-mode) (\.cls\' . latex-mode) (\.clo\' . latex-mode) (\.bbl\' . latex-mode) (\.bib\' . bibtex-mode) (\.sql\' . sql-mode) (\.m4\' . m4-mode) (\.mc\' . m4-mode) (\.mf\' . metafont-mode) (\.mp\' . metapost-mode) (\.vhdl?\' . vhdl-mode) (\.article\' . text-mode) (\.letter\' . text-mode) (\.tcl\' . tcl-mode) (\.exp\' . tcl-mode) (\.itcl\' . tcl-mode) (\.itk\' . tcl-mode) (\.icn\' . icon-mode) (\.sim\' . simula-mode) (\.mss\' . scribe-mode) (\.f90\' . f90-mode) (\.indent\.pro\' . fundamental-mode) (\.pro\' . idlwave-mode) (\.lsp\' . lisp-mode) (\.awk\' . awk-mode) (\.prolog\' . prolog-mode) (\.tar\' . tar-mode) (\.\(arc\|zip\|lzh\|zoo\|jar\)\' . archive-mode) (\.\(ARC\|ZIP\|LZH\|ZOO\|JAR\)\' . archive-mode) (\`/tmp/Re . text-mode) (/Message[0-9]*\' . text-mode) (/drafts/[0-9]+\' . mh-letter-mode) (\.zone\' . zone-mode) (\`/tmp/fol/ . text-mode) (\.y\' . c-mode) (\.lex\' . c-mode) (\.oak\' . scheme-mode) (\.sgml?\' . sgml-mode) (\.xml\' . sgml-mode) (\.dtd\' . sgml-mode) (\.ds\(ss\)?l\' . dsssl-mode) (\.idl\' . idl-mode) ([]>:/\]\..*emacs\' . emacs-lisp-mode) (\`\..*emacs\' . emacs-lisp-mode) ([:/]_emacs\' . emacs-lisp-mode) (/crontab\.X*[0-9]+\' . shell-script-mode) (\.ml\' . lisp-mode) (\.\(asn\|mib\|smi\)\' . snmp-mode) (\.\(as\|mi\|sm\)2\' . snmpv2-mode) (\.\(diffs?\|patch\|rej\)\' . diff-mode) (\.\(dif\|pat\)\' . diff-mode) (\.[eE]?[pP][sS]\' . ps-mode) (configure\.\(ac\|in\)\' . autoconf-mode) (BROWSE\' . ebrowse-tree-mode) (\.ebrowse\' . ebrowse-tree-mode) (#\*mail\* . mail-mode) (\.~?[0-9]+\.[0-9][-.0-9]*~?\' ignore t) (\.[1-9]\' . nroff-mode) (\.g\' . antlr-mode))
;;(insert (format "%s" auto-mode-alist))((\.m\' . matlab-mode) (\.py$ . python-mode) (\.te?xt\' . text-mode) (\.c\' . c-mode) (\.h\' . c-mode) (\.tex\' . tex-mode) (\.ltx\' . latex-mode) (\.el\' . emacs-lisp-mode) (\.scm\' . scheme-mode) (\.l\' . lisp-mode) (\.lisp\' . lisp-mode) (\.f\' . fortran-mode) (\.F\' . fortran-mode) (\.for\' . fortran-mode) (\.p\' . pascal-mode) (\.pas\' . pascal-mode) (\.ad[abs]\' . ada-mode) (\.\([pP]\([Llm]\|erl\)\|al\)\' . perl-mode) (\.s?html?\' . html-mode) (\.cc\' . c++-mode) (\.hh\' . c++-mode) (\.hpp\' . c++-mode) (\.C\' . c++-mode) (\.H\' . c++-mode) (\.cpp\' . c++-mode) (\.cxx\' . c++-mode) (\.hxx\' . c++-mode) (\.c\+\+\' . c++-mode) (\.h\+\+\' . c++-mode) (\.m\' . objc-mode) (\.java\' . java-mode) (\.mk\' . makefile-mode) (\(M\|m\|GNUm\)akefile\(\.in\)?\' . makefile-mode) (\.am\' . makefile-mode) (\.texinfo\' . texinfo-mode) (\.te?xi\' . texinfo-mode) (\.s\' . asm-mode) (\.S\' . asm-mode) (\.asm\' . asm-mode) (ChangeLog\' . change-log-mode) (change\.log\' . change-log-mode) (changelo\' . change-log-mode) (ChangeLog\.[0-9]+\' . change-log-mode) (changelog\' . change-log-mode) (changelog\.[0-9]+\' . change-log-mode) (\$CHANGE_LOG\$\.TXT . change-log-mode) (\.scm\.[0-9]*\' . scheme-mode) (\.[ck]?sh\'\|\.shar\'\|/\.z?profile\' . sh-mode) (\(/\|\`\)\.\(bash_profile\|z?login\|bash_login\|z?logout\)\' . sh-mode) (\(/\|\`\)\.\(bash_logout\|shrc\|[kz]shrc\|bashrc\|t?cshrc\|esrc\)\' . sh-mode) (\(/\|\`\)\.\([kz]shenv\|xinitrc\|startxrc\|xsession\)\' . sh-mode) (\.m?spec\' . sh-mode) (\.mm\' . nroff-mode) (\.me\' . nroff-mode) (\.ms\' . nroff-mode) (\.man\' . nroff-mode) (\.\(u?lpc\|pike\|pmod\)\' . pike-mode) (\.TeX\' . tex-mode) (\.sty\' . latex-mode) (\.cls\' . latex-mode) (\.clo\' . latex-mode) (\.bbl\' . latex-mode) (\.bib\' . bibtex-mode) (\.sql\' . sql-mode) (\.m4\' . m4-mode) (\.mc\' . m4-mode) (\.mf\' . metafont-mode) (\.mp\' . metapost-mode) (\.vhdl?\' . vhdl-mode) (\.article\' . text-mode) (\.letter\' . text-mode) (\.tcl\' . tcl-mode) (\.exp\' . tcl-mode) (\.itcl\' . tcl-mode) (\.itk\' . tcl-mode) (\.icn\' . icon-mode) (\.sim\' . simula-mode) (\.mss\' . scribe-mode) (\.f90\' . f90-mode) (\.indent\.pro\' . fundamental-mode) (\.pro\' . idlwave-mode) (\.lsp\' . lisp-mode) (\.awk\' . awk-mode) (\.prolog\' . prolog-mode) (\.tar\' . tar-mode) (\.\(arc\|zip\|lzh\|zoo\|jar\)\' . archive-mode) (\.\(ARC\|ZIP\|LZH\|ZOO\|JAR\)\' . archive-mode) (\`/tmp/Re . text-mode) (/Message[0-9]*\' . text-mode) (/drafts/[0-9]+\' . mh-letter-mode) (\.zone\' . zone-mode) (\`/tmp/fol/ . text-mode) (\.y\' . c-mode) (\.lex\' . c-mode) (\.oak\' . scheme-mode) (\.sgml?\' . sgml-mode) (\.xml\' . sgml-mode) (\.dtd\' . sgml-mode) (\.ds\(ss\)?l\' . dsssl-mode) (\.idl\' . idl-mode) ([]>:/\]\..*emacs\' . emacs-lisp-mode) (\`\..*emacs\' . emacs-lisp-mode) ([:/]_emacs\' . emacs-lisp-mode) (/crontab\.X*[0-9]+\' . shell-script-mode) (\.ml\' . lisp-mode) (\.\(asn\|mib\|smi\)\' . snmp-mode) (\.\(as\|mi\|sm\)2\' . snmpv2-mode) (\.\(diffs?\|patch\|rej\)\' . diff-mode) (\.\(dif\|pat\)\' . diff-mode) (\.[eE]?[pP][sS]\' . ps-mode) (configure\.\(ac\|in\)\' . autoconf-mode) (BROWSE\' . ebrowse-tree-mode) (\.ebrowse\' . ebrowse-tree-mode) (#\*mail\* . mail-mode) (\.~?[0-9]+\.[0-9][-.0-9]*~?\' ignore t) (\.[1-9]\' . nroff-mode) (\.g\' . antlr-mode))
;(add-to-list 'auto-mode-alist '("\\.m\\'"     . octave-mode)  )

;;-------------------------------------------------------------------------------- Save Session as Desktop
;;  use desktop-change-dir to /home/uri03204/.emacs.d/desktop to get it back
;;    say "no" to save-desktop?
;;    say "yes" to steal from PID?
;;(desktop-save-mode 1)  ; desktop-revert desktop-change-dir
;;(desktop-change-dir "/home/uri03204/myDocs/config")
(setq desktop-path "L:/MyDocs/history/emacsDesktops/desktop1")
(desktop-save-mode 1)
(setq desktop-auto-save-timeout 300)

;;-------------------------------------------------------------------------------- History
(setq history-length 10000)
(setq list-command-history-max 300)
(savehist-mode 1)
; list-command-history-filter TBD filter out kill-buffer
(defun show-hist()
  (interactive)
  (list-command-history))
; (list-command-history)
;;-------------------------------------------------------------------------------- Buffer List Menu
(global-set-key (kbd "C-x C-b") 'my-list-buffers)
(defun my-list-buffers (&optional files-only)
  "Display a list of existing buffers with file only"
  (interactive "P")
  (switch-to-buffer (list-buffers-noselect t)))
(setq Buffer-menu-name-width 40)
;;-------------------------------------------------------------------------------- Cycle Buffer
;; to be commented in
(load-library "cycle-buffer")
(autoload 'cycle-buffer                     "cycle-buffer" "Cycle forward."                            t)
(autoload 'cycle-buffer-backward            "cycle-buffer" "Cycle backward."                           t)
(autoload 'cycle-buffer-permissive          "cycle-buffer" "Cycle forward allowing *buffers*."         t)
(autoload 'cycle-buffer-backward-permissive "cycle-buffer" "Cycle backward allowing *buffers*."        t)
(autoload 'cycle-buffer-toggle-interesting  "cycle-buffer" "Toggle if this buffer will be considered." t)
;; (defvar cycle-buffer-filter
;;   '((not (eq (aref (buffer-name) 0) ? )) ; " buffer"
;;     (not (member (buffer-name)           ; uninteresting buffers
;;                  '("lispdir.dat" "*reportmail*" ".newsrc-dribble" "info dir" ".infonotes")))
;;     (not (string-match "^\\(TAGS\\|\\*?sent\\)" (buffer-name)))
;;     (or (eq cycle-buffer-allow-visible t) ; visible buffers
;;         (eq (current-buffer) cycle-buffer-current)
;;         (not (get-buffer-window (current-buffer) (if cycle-buffer-allow-visible nil 'visible)))))

;;-------------------------------------------------------------------------------- Kill buffer unconditionally
(defun kill-this-buffer-volatile ()
    "Kill current buffer, even if it has been modified."
    (interactive)
    (set-buffer-modified-p nil)
    (kill-this-buffer))

;;------------------------------------------------------------------------------- Backup location
(setq backup-directory-alist          `((".*" . , "L:/MyDocs/history/emacsBackupFiles")))
(setq auto-save-file-name-transforms  `((".*" ,   "L:/MyDocs/history/emacsBackupFiles" t)))

;;------------------------------------------------------------------------------- Org-Mode
(require 'org)
(require 'ob)
;(add-to-list 'org-file-apps '(directory . emacs)) always open in dired
;(define-key global-map "\C-cl" 'org-store-link)
;(define-key global-map "\C-ca" 'org-agenda)
(defalias 'make-org-tbl  (kbd "ESC x org-mode RET ESC < C-SPC ESC > C-c |"))


(setq org-catch-invisible-edits 'show-and-error)
(setq org-cycle-separator-lines 0)
;;(defalias 'see-logbooks  (kbd "C-x C-f ~/myDocs/logbook RET"))
(defun org-collapse()     (interactive) (org-shifttab 0))

(define-key org-mode-map (kbd "C-c C->")  'org-demote-subtree)
(define-key org-mode-map (kbd "C-c C-<")  'org-promote-subtree)
(define-key org-mode-map (kbd "<S-up>")   'scroll-one-line-down)
(define-key org-mode-map (kbd "<S-down>") 'scroll-one-line-up)
(define-key org-mode-map (kbd "<C-up>")   'outline-up-heading)

(setq org-src-fontify-natively t)
;; needs ox.el = org-exporter.el
;;(require 'ox-confluence)

(require 'cl)





;;------------------------------------- org-mode crypt
(defun rot-region(p1 p2)
  (interactive "r")
   (org-mark-subtree)
  (save-restriction (org-mark-subtree) (rot13-region (point) (mark))))

(defun rot-region_orig(p1 p2)
  (interactive "r")
  (save-restriction (narrow-to-region p1 p2) (rot13-region (point-min) (point-max))))

;---------------------------------------- expand and collapse
(defun org-advance ()
  (interactive)
  (when (buffer-narrowed-p)
  (beginning-of-buffer)
  (widen)
  (org-forward-heading-same-level 1))
    (org-narrow-to-subtree))

(defun org-retreat ()
  (interactive)
  (when (buffer-narrowed-p)
    (beginning-of-buffer)
    (widen)
   (org-backward-heading-same-level 1))
  (org-narrow-to-subtree))

;;(require 'org-crypt)
;;(org-crypt-use-before-save-magic)
;;(setq org-tags-exclude-from-inheritance (quote ("crypt")))
;;(setq org-crypt-key nil)
;;
;;(defun crypt-region (p1 p2) 
;;  "replace region with crypted" 
;;  (interactive "r") 
;;  (save-restriction 
;;    (narrow-to-region p1 p2) 
;;    (goto-char (point-min)) 
;;    (while (re-search-forward REGEXP nil t)
;;      (replace-match TO-STRING nil nil))
;;    )
;;  )

;; ------------------------------------------------------------------------------- org-mode
(defun org-save-code-block(p1 p2)
  (interactive "r")
  ;; for use with es.m
  ;; and put in top matlab IDE buffer
  (let
      ((info (org-babel-get-src-block-info 'light)))
   (when (equal (nth 0 info) "matlab") (write-region (cadr info) nil "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK/vc/maqsMk/init/aaa_org_cmd.m"))
   (when (equal (nth 0 info) "sql")    (write-region (cadr info) nil "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK/vc/maqsMk/notebooks/SQL_QUERY_CMD.sql")))
)

;; (print (cadr info) (get-buffer "*scratch*"))
;; (write-region (cadr info) nil "L:/MyDocs/history/matlabCmds/org_cmd.m")
;; (write-region (cadr info) nil "C:/MyMAQS/grepHist/aaa_org_cmd.m"))
;; (save-restriction (org-mark-subtree) (rot13-region (point) (mark))))

(defun org-copy-src-block ()
  (interactive)
  (org-edit-src-code)
  ;(mark-whole-buffer)
  ;;(easy-kill 1)
  (copy-to-buffer "foo" (point-min) (point-max))
  (save-buffer "foo")
  (org-edit-src-abort))

;(org-babel-do-load-languages
; 'org-babel-load-languages
; '((python . t)))

(org-babel-do-load-languages 'org-babel-load-languages '((matlab . t) (python . t) (emacs-lisp . t)))

;; active Babel languages
;(org-babel-do-load-languages
; 'org-babel-load-languages
; '((R . t)
;   (emacs-lisp . nil)
;   ))

;;C-c c       (org-capture)          Call the command org-capture. Note that this key binding is global and not active by default: you need to install it. If you have templates defined see Capture templates, it will offer these templates for selection or use a new Org outline node as the default template. It will insert the template into the target file and switch to an indirect buffer narrowed to this new node. You may then insert the information you want.
;;C-c C-c     (org-capture-finalize) Once you have finished entering information into the capture buffer, C-c C-c will return you to the window configuration before the capture process, so that you can resume your work without further distraction. When called with a prefix arg, finalize and then jump to the captured item.
;;C-c C-w     (org-capture-refile)   Finalize the capture process by refiling (see Refile and copy) the note to a different place. Please realize that this is a normal refiling command that will be executed—so the cursor position at the moment you run this command is important. If you have inserted a tree with a parent and children, first move the cursor back to the parent. Any prefix argument given to this command will be passed on to the org-refile command.
;;C-c C-k     (org-capture-kill)     Abort the capture process and return to the previous state.
;;You can also call org-capture in a special way from the agenda, using the k c key combination. With this access, any timestamps inserted by the selected capture template will default to the cursor date in the agenda, rather than to the current date.
;;To find the locations of the last stored capture, use org-capture with prefix commands:
;;C-u C-c c                          Visit the target location of a capture template. You get to select the template in the usual way.
;;C-u C-u C-c c                      Visit the last stored capture item in its buffer.

;; You can also jump to the bookmark org-capture-last-stored, which
;; will automatically be created unless you set org-capture-bookmark
;; to nil.
;; To insert the capture at point in an Org buffer, call org-capture
;; with a C-0 prefix argument.
;;


;----------------------------------------------------------------------------------- org-trello
;(add-to-list 'load-path "L:/MyDocs/ulib/emacs/org-trello/"))
;(require 'org-trello)


;; -------------------------- new stuff
;; ;; Save point position between sessions.
;; (use-package saveplace)
;; (setq-default save-place t)
;; (setq save-place-file (expand-file-name "places" user-emacs-directory))

;; ;; Fix empty pasteboard error.
;; (setq save-interprogram-paste-before-kill nil)

;; ;; Also auto refresh dired, but be quiet about it
;; (setq global-auto-revert-non-file-buffers t)
;; (setq auto-revert-verbose nil)

;; ;; Show keystrokes in progress
;; (setq echo-keystrokes 0.1)
(global-subword-mode 1)
;; from 'better-defaults.el'
;; Allow clipboard from outside emacs
;; (setq x-select-enable-clipboard t
;;       x-select-enable-primary t
;;       save-interprogram-paste-before-kill t
;;       apropos-do-all t
;;       mouse-yank-at-point t)

;; ------------------------------------------------------------------------------ Custom Variables
(setq-default x-stretch-cursor t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(display-time-mode t)
 '(matlab-auto-fill nil)
 '(matlab-fill-code nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(org-confirm-babel-evaluate nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))

;; ------------------------------------------------------------------------------ Scroll One Line At a time

;;-------------------------------------------------------------------------------- Dired
;(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
;;(defun w32-browser (doc) (w32-shell-execute 1 doc))
;;(eval-after-load "dired" '(define-key dired-mode-map [f3]
;;                (lambda ()
;;                  (interactive)
;;                  (w32-browser (dired-replace-in-string "/" "\\" (dired-replace-in-string "/cygdrive/C/" "C:\\" (dired-get-filename)))))))
(require 'dired-x)
(require 'wdired)

(add-hook 'dired-load-hook
      (lambda ()            ;(load "dired-x")
        (autoload 'wdired-change-to-wdired-mode "wdired")
        ;; Set dired-x global variables here.  For example:
        ;; (setq dired-guess-shell-gnutar "gtar")
        ;; (setq dired-x-hands-off-my-keys nil)
        (setq dired-omit-mode t)
        (setq dired-omit-files-p t)
        (setq dired-omit-files "^#\\|^\\.$|^\\.\\.$")
        ;;(setq dired-omit-files "^.$|^..$")
        ;; (setq dired-omit-files "^\\..*$|^Thumbs.db$")
        (setq dired-omit-extensions '( "~" ".o" ".pyc" ".class" ".elc")) ; ".asv"
        (setq dired-no-confirm '(revert-subdirs))))

(add-hook 'dired-mode-hook
      (lambda ()
        ;; Set dired-x buffer-local variables here.  For example:
        (progn
          (dired-omit-mode 1)
          (setq dired-dwim-target t)
          ;(setq dired-listing-switches "-al  --time-style=long-iso")  ; doesn't work on windows
          ;(setq dired-listing-switches "-al --group-directories-first")
          ;(setq dired-listing-switches "-al --group-directories-first")
          ;(setq dired-listing-switches "-lXGh --group-directories-first")
          (setq dired-no-confirm '(revert-subdirs))
          ;;(setq dired-omit-files "^\\..*$|^Thumbs.db$")
          ;(setq dired-omit-extensions '(".asv" "~" ".o" ".pyc" ".class"))
          ;(define-key dired-mode-map [right] 'dired-go-subdir-kbm)
          ;(define-key dired-mode-map [left] 'dired-up-directory)
          ;(defalias 'dired-up (kbd "ESC < C-e C-r / NUL C-a ESC w C-x d C-a C-y C-k C-a ESC \\ C-e RET C-x b RET C-x k RET"))  ;; deletes prvious dired
          (defalias 'dired-up (kbd "^ C-x b RET C-x k RET"))  ;; deletes prvious dired
          (defalias 'dired-go-subdir-kbm (kbd "f C-x b RET C-x k RET"))))) ;; deletes previous dired


;; when sorting in dired mode, move cursor back to top
(defadvice dired-sort-toggle-or-edit (after dired-sort-to-top activate)
   "Move to beginning of buffer (instead of keeping point on the current file)."
   (goto-char (point-min))
   (goto-line 3))

;;------------------------------------dired peek

(defun dired-view-next ()
  "Move down one line and view the current file in another window."
  (interactive)
  (dired-next-line 1)
  (dired-view-current)
  ;(other-window 1)
  ;(switch-to-buffer (previous-buffer))
  )

(defun dired-view-previous ()
  "Move up one line and view the current file in another window."
  (interactive)
  (dired-previous-line 1)
  (dired-view-current)
  ;(other-window 1)  
  ;(switch-to-buffer (previous-buffer))
  )

(defun dired-view-current ()
  "View the current file in another window (possibly newly created)."
  (interactive)
  (if (not (window-parent))
      (split-window nil nil t))                         ; create a new window -right side if necessary
  (let ((file (dired-get-file-for-visit))
        (dbuffer (current-buffer)))
    (other-window 1)                                    ; switch to the other window
    (unless (equal dbuffer (current-buffer))            ; don't kill the dired buffer
      (if (or view-mode (equal major-mode 'dired-mode)) ; only if in view- or dired-mode
          (kill-buffer)))                               ; ... kill it
    (let ((filebuffer (get-file-buffer file)))
      (if filebuffer                                    ; does a buffer already look at the file
          (switch-to-buffer filebuffer)                 ; simply switch 
        (view-file file))                               ; ... view it
      (other-window -1))))                              ; give the attention back to the dired buffer

;;----------------------------------- dired subtree
(setq load-path (append load-path '("L:/MyDocs/ulib/emacs/subtree")))
(load-library "dired-subtree")
(setq dired-subtree-line-prefix "        ")

;; (add-hook 'dired-mode-hook
;;           (lambda ()
;;             (setq-local ace-jump-search-filter
;;                         (lambda ()
;;                           (get-text-property (point) 'dired-filename)))))

(defun dired-move-to-old (&optional arg)
  (interactive)
  (setq curDrdBuff (current-buffer))
  (setq ffn (dired-get-filename))
  (setq fn  (dired-get-filename "no-dir"))
  (switch-to-buffer "*Scratch*")
  (insert "hello dired-move-to-old") (newline)
  (insert ffn)  (newline)  
  (insert fn)   (newline)
  (insert "bye dired-move-to-old")  (newline)
  (rename-file ffn (concat "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/ARCHIVE/OLD/" fn))
  (switch-to-buffer curDrdBuff)
  (revert-buffer)
  ;;(dired-rename-file ffn (concat "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/ARCHIVE/OLD/" fn))
  ;;dired-rename-file (file newname ok-if-already-exists)
)

(define-key dired-mode-map [right]           'dired-go-subdir-kbm)
(define-key dired-mode-map [left]            'dired-up) ;; dired-up-directory
(define-key dired-mode-map [up]              'dired-previous-line)  ; was dired-next-line
(define-key dired-mode-map [C-up]            'dired-view-previous)  ; was dired-next-line
(define-key dired-mode-map [down]            'dired-next-line)      ; was dired-previous-line
(define-key dired-mode-map [C-down]          'dired-view-next)      ; was dired-previous-line
(define-key dired-mode-map (kbd "<S-right>") 'dired-subtree-insert)
(define-key dired-mode-map (kbd "<S-left>")  'dired-subtree-remove)
(define-key dired-mode-map (kbd "<S-up>")    'dired-subtree-previous-sibling)
(define-key dired-mode-map (kbd "<S-down>")  'dired-subtree-next-sibling)
;'dired-view-current)     ; was dired-display-file
(define-key dired-mode-map (kbd "C-n")       'dired-next-line)
(define-key dired-mode-map (kbd "C-p")       'dired-previous-line)
(define-key dired-mode-map (kbd "e")         'dired-subtree-only-this-file)
(define-key dired-mode-map "r"               'wdired-change-to-wdired-mode)
(define-key dired-mode-map "J"               'dired-move-to-old) ; junk
(define-key dired-mode-map "O"                (lambda () (interactive) (w32-browser (dired-replace-in-string "/" "\\" (dired-get-filename)))))


;;(eval-after-load "dired" '(define-key dired-mode-map [f3] (lambda () (interactive) (w32-browser (dired-replace-in-string "/" "\\" (dired-get-filename))))))

;; * `dired-subtree-remove`
;; * `dired-subtree-revert`
;; * `dired-subtree-narrow`
;; * `dired-subtree-up`
;; * `dired-subtree-down`
;; * `dired-subtree-previous-sibling`
;; * `dired-subtree-beginning`
;; * `dired-subtree-end`
;; * `dired-subtree-mark-subtree`
;; * `dired-subtree-unmark-subtree`
;; * `dired-subtree-only-this-file`
;; * `dired-subtree-only-this-directory`

; (define-key dired-mode-map (kbd "p")  'dired-subtree-only-this-file) ; tbd: pick-off the path of the given file into clipboard


;; find-dired   calls unix find
;Dired Listing Switches: Hide Value -ahl --time-style=long-iso
;; of emacs.  It is adviced to place bindings for these into a
;; convenient prefix key map, for example `C-,`

;(add-hook 'ediff-mode-hook (lambda () (setq ediff-shell "C:/cygwin/bin/mintty.exe")))
;(add-hook 'ediff-load-hook (lambda () (setq ediff-shell "C:/cygwin/bin/mintty.exe")))





(global-set-key "\M-$"         'query-replace-regexp)
(global-set-key (kbd "C-.")     'repeat)
(global-set-key (kbd "\C-c;")    'comment-or-uncomment-region)
(global-set-key [(end)]         'my-list-buffers)
(global-set-key [(next)]        'cycle-buffer)
(global-set-key [(prior)]       'cycle-buffer-backward)
(global-set-key [C-f10]          '(lambda () (interactive) (dired "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK" nil)))
(global-set-key [C-f11]         '(lambda () (interactive) (dired "L:/MyDocs" nil)))
(global-set-key [C-f12]         '(lambda () (interactive) (dired "//lon0301/dfs/APPS/MultiAssetQuant/AB/FI/dmSov" nil)))
(global-set-key [C-f1]          'mk-new-buffer)
(global-set-key [C-f4]          'org-transpose-table-at-point)
(global-set-key [C-f5]          '(lambda () (interactive) (dired "//lon06179/ProdData" nil)))
(global-set-key [C-f6]          '(lambda () (interactive) (dired "D:/" nil))) ; //lon0302/dfs/DATA/MULTI_ASSET/MAQ?
(global-set-key [C-f7]         '(lambda () (interactive) (dired "C:/" nil)))
(global-set-key [C-f8]          '(lambda () (interactive) (dired "//lon0301/dfs/DATA/DTA/PERFDATA/Inv Risk/Stock Baskets/DmSov" nil)))
(global-set-key [C-f9]         '(lambda () (interactive) (dired "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI" nil)))
(global-set-key [C-insert]      'clipboard-kill-ring-save)
(global-set-key [C-kp-add]      'text-scale-increase)
(global-set-key [C-kp-subtract] 'text-scale-decrease)
(global-set-key [M-f10]         'see-shell-output) ;ergoemacs-open-in-external-app
(global-set-key [M-f11]         'set-debug-on)
(global-set-key [M-f12]         'set-debug-off)
(global-set-key [M-f2]          'buffer-menu-sort-by-filename)
(global-set-key [M-f9]          'ielm)  ;; open file under cursor ;;(global-set-key [M-f9]        'insertLastSexp);; insert result
(global-set-key [S-down]        'scroll-one-line-up)
(global-set-key [S-f12]         'hs-hide-block)
(global-set-key [S-f1]          'my-revert-buffer) ; my-openfile  'neotree-show
(global-set-key [S-f2]          'my-list-buffers)
(global-set-key [S-f3]          'see-dotBashRc)
(global-set-key [S-f4]          'org-save-code-block)
(global-set-key [S-f5]          'my-revert-buffer)
(global-set-key [S-f7]          'show-hist)
(global-set-key [S-f8]          'dired-omit-mode)
(global-set-key [S-f9]          '(lambda () (interactive) (dired "C:/[pm][rya][qoadmp][parsd]*" nil)))
(global-set-key [S-insert]      'clipboard-yank)
(global-set-key [S-left]        'window-hshrink)
(global-set-key [S-right]       'window-hwiden)
(global-set-key [S-up]          'scroll-one-line-down)
(global-set-key [S-wheel-down]  'next-buffer) 
(global-set-key [S-wheel-up]    'previous-buffer)
(global-set-key [f10]           'kmacro-end-and-call-macro) ; see-shell-output) ;ergoemacs-open-in-external-app
(global-set-key [f11]           'kmacro-end-macro)
(global-set-key [f12]           'hs-show-block)
(global-set-key [f1]            'see-logbook1)
(global-set-key [f2]            'see-matlab)
(global-set-key [f3]            'see-dotEmacs) ; my-openfile  'neotree-show
(global-set-key [f4]            'see-orglink-dired) ;;     'desktop-save)
(global-set-key [f5]            'ffap) ; bookmark-bmenu-list
(global-set-key [f6]            'ergoemacs-open-in-external-app)
(global-set-key [f7]            'go-to-column)
(global-set-key [f8]            'rot-region)
(global-set-key [f9]            'kmacro-start-macro)
(global-set-key [kp-divide]    'toggle-window-split)
(global-set-key [kp-left]       'selective-display-level-decr)
(global-set-key [kp-multiply]   'other-window)
(global-set-key [kp-right]      'selective-display-level-incr)
(global-set-key [kp-space]      'selective-display-level-zero)
(global-set-key [kp-subtract]   'kill-this-buffer-volatile)
(global-unset-key "\C-x\C-c")                            ;; The following key-binding quits emacs -- we disable it too
;(define-key global-map "\C-co" 'org-capture)
;(global-set-key "\C-!"         'shell-command) TBD
;(global-set-key "\C-cq"        'lines-to-cslist)
;(global-set-key (kbd "<wheel-up>")   'previous-buffer)
;(global-set-key [C-down]        'windmove-down)        ;(global-set-key (kbd "C-c <down>")  'windmove-down)
;(global-set-key [C-kp-insert]  'kill-ring-save)
;(global-set-key [C-left]        'windmove-left)        ;(global-set-key (kbd "C-c <left>")  'windmove-left)
;(global-set-key [C-right]       'windmove-right)       ;(global-set-key (kbd "C-c <right>") 'windmove-right)
;(global-set-key [C-up]          'windmove-up)          ;(global-set-key (kbd "C-c <up>")    'windmove-up)
;(global-set-key [M-up]            'other-window)
;(global-set-key [S-f11]         'debug-function-on-entry)
;(global-set-key [S-kp-4]       'selective-display-level-decr)
;(global-set-key [S-kp-5]       'selective-display-level-zero)
;(global-set-key [S-kp-6]       'selective-display-level-incr)
;(global-set-key [S-kp-insert]  'yank)
;(global-set-key [S-wheel-own].
;(global-set-key [S-wheel-up].
;(global-unset-key (kbd "C-q"))
;; (global-set-key [S-M-kp-down] 'sgml-fold-subelement) 
;; (global-set-key [S-M-kp-end]  'sgml-fold-element)   ;  fold everything below current element
;; (global-set-key [S-M-kp-next] 'sgml-unfold-element)
;; M-kp ... conflicts with workspace navigation:
;; f4 for use by org-mode?
;; with a C-0 prefix argument.
;;(global-set-key "\C-Q"         'unfill-paragraph)
;;(global-set-key [M-return]        'ffap)  ;; open file under cursor
;;; don't quit so easily
;;-------------------------------------------------------------------------------
(dired "L:/" nil)
(setq dired-dwim-target t)
(setq org-list-allow-alphabetical t)




