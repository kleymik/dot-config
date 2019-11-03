;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; File name: ` ~/.emacs '
;;--------------------------------------------------------------- Handy commands quick ref
;; rot13-region  (C-c C-r)
;; telnet host port     to open
;; ^Q^] close           to close

;; new
;(setq debug-on-error t)
; toggle-debug-on-error

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;;  (xclip-mode 1) for emacs in terminal , export kill-yank
;; C-c C-b associate ielm with buffer
;; M-6 M-x Buffer-menu-sort = sort by file name
;;(setq Buffer-menu-sort-column 6)
;; C-x C-v = find alternate file   -> then grab filepath
;;(setq header-line-format mode-line-format)
(setq uniquify-buffer-name-style 'forward)
(require 'uniquify)
;; proced       to view processes
;; find-dired   calls unix find
;; tail-mode    auto-revert-tail-mode (C-cr)
;; set-buffer-file-coding-system unix <--format

;; map-query-regexp-replace
;; isearch-forward-regexp
;; M-s h l 	highlight-lines-matching-regexp    Highlights all lines matching a regular expression
;; M-s h p 	highlight-phrase 	               Highlights everything matching a phrase
;; M-s h r 	highlight-regexp 	               Highlights everything matching a regular expression
;; M-s h u 	unhighlight-regexp 	               Deletes the highlighter under point
;; M-s h w 	hi-lock-write-interactive-patterns Inserts a list of Hi-Lock patterns into the buffer
;; M-s h f 	hi-lock-find-patterns 	           Searches for Hi-Lock patterns in the buffer to use.
;; C-x r s r; C-x r i r                        Copy region into register "r" (copy-to-register).    Insert text from register r (insert-register).
;; C-ci         indent-to-column
;; C-x r w w; C-x r j w                        Save windows config in register "w" ; jump back (where <register> is a single character) to jump back to it.
;;              package-list-packages
;; C-j          eval in scratch buffer ?
;; C-x RTN f unix RTN  dos2unix

;; C-u C-space or C-u C-@ move back to previous positions (within buffer)
;; C-x C-space or C-x C-@ move back to previous positions (between buffers)
;; C-x n n; C-x n w                            Narrow to Region; Widen
;; C-;                                         Highlight item for MULTIPLE edit

;;C-a			;; move-beginning-of-line
;;C-s			;; isearch-forward
;;/			    ;; self-insert-command
;;C-b			;; backward-char
;;C-s			;; isearch-forward
;;:			    ;; self-insert-command
;;C-x C-x		; exchange-point-and-mark
;;ESC			;; ESC-prefix
;;w			    ;; self-insert-command
;;C-x C-f		;; find-file
;;C-a			;; move-beginning-of-line
;;C-y			;; yank
;;C-k			;; kill-line
;;DEL			;; delete-backward-char
;;RET			;; newline

;;; ----------------------------------------------------------------------
;(setq ediff-shell "C:/cygwin/bin/mintty.exe")
;;  (if (file-directory-p "c:/cygwin/bin")      (add-to-list 'exec-path "c:/cygwin/bin"))
;;------------------------------------------------------------------------------- Switches
(setq load-path (append load-path '("/home/kleyn/ulib/emacs"))) ;; (insert (format "%s" load-path))
;(desktop-save-mode 1)  ; desktop-revert desktop-change-dir
(setq default-truncate-lines t)
(setq inhibit-splash-screen t)
(setq font-lock-maximum-decoration t) ;; 3
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(show-paren-mode 1)
(transient-mark-mode t)
(setq case-fold-search t)
(blink-cursor-mode 0)
(setq bell-volume 0)
(setq display-time-day-and-date t) (display-time)
(setq visible-bell t)
(setq line-number-mode t)
(setq column-number-mode t)
(global-hl-line-mode t)
;(setq-default frame-title-format "%b %p %p(%f)")
(setq-default frame-title-format "%f")
(setq-default line-spacing 0.06)
;(global-mark-ring-max 50)
;(setq set-mark-command-repeat-pop 1) - needs emacs version 22
;(global-set-key [M-SPC] 'pop-global-mark)
;(global-set-key "\C-." 'pop-global-mark)
;(setq mark-ring-max 50)
;(global-set-key [S-right] 'forward-word)
										; M-x clone-indirect-buffer RET
;;------------------------------------------------------------------------------ Eval
;; (global-set-key [remap eval-expression] 'pp-eval-expression)
(defun insertLastSexp ()
    (interactive)
    (let ((value (eval (preceding-sexp))))
      ;;(kill-sexp -1)
      (insert (format " = %S;" value))))

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


;;------------------------------------------------------------------------------ Line Spacing
(defun toggle-line-spacing ()
  "Toggle line spacing between no extra space to extra half line height."
  (interactive)
  (if (eq line-spacing nil)
      (setq-default line-spacing 0.05)	; add 0.5 height between lines
    (setq-default line-spacing nil)))	; no extra heigh between lines
;;------------------------------------------------------------------------------- Colour
;; (set-background-color "black")
;; (set-background-color "darkgrey")
(set-background-color "bisque")
;(set-background-color "bisque2")
;(set-background-color "bisque3")
;(set-face-background 'default "green3")
;(set-face-background 'default "lightyellow2")
;(set-face-background 'default "palevioletred")
;(set-face-background 'default "lightblue")
;(set-face-background 'default "paleturquoise")
;(set-face-background 'default "lightblue")

;;------------------------------------------------------------------------------- Matlab Mode
;; (setq matlab-indent-function t)
;; (setq matlab-shell-command "matlab")
;(autoload 'matlab-mode "/home/kleyn/myDocs/ulib/emacs/matlab.elc" "Enter Matlab mode." t)
;(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
;;; User Level customizations:
;;;   (setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
;(defun my-matlab-mode-hook ()
;  (matlab-mode-hilit) 			; Turn highlight on
;  (setq fill-column 276)		; where auto-fill should wrap
;  (setq matlab-indent-function t)	; if you want function bodies indented
;  (setq matlab-indent-level  2)         ; set matlab indentation
;  (set matlab-fill-code nil)
;  (setq indent-tabs-mode nil))
;(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)

;; ----------------------------------------------------------------------------- DOS Mode
;;(autoload 'dos-mode "/home/uri03204/myDocs/ulib/emacs/dos.elc" "Enter DOS CMD mode." t)

;; ----------------------------------------------------------------------------- CSHARP Mode
;(autload 'csharp-mode "/home/uri03204/myDocs/ulib/emacs/csharp-mode-0.8.5.elc" t)
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(defun csharp-mode-untabify ()
  (if (string= (substring mode-name 0 2) "C#")
     (save-excursion
	(delete-trailing-whitespace)
	(untabify (point-min) (point-max)))))
(defun my-csharp-mode-fn ()
  "function that runs when csharp-mode is initialized for a buffer."
  (turn-on-auto-revert-mode)
  (setq indent-tabs-mode nil)
  (require 'flymake)
  (setq flymake-mode nil)
  ;;(add-hook 'write-contents-hooks 'csharp-mode-untabify nil t)
  )
  ;;      (require 'yasnippet)
  ;;      (yas/minor-mode-on)
  ;;      (require 'rfringe)
(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)
;;(add-hook 'csharp-mode-hook '(lambda () (add-hook 'write-contents-hooks 'csharp-mode-untabify nil t)))

; 'tbd add hs-minot-mode for hide/show t
;TDB (add-hook  'java-mode-hook 'my-java-mode-hook t)
;(defun my-java-mode-hook ()
;  (hs-minor-mode)
;  (setq indent-tabs-mode nil))

;;------------------------------------------------------------------------------- iedit Mode
;; TBD (autoload 'iedit-mode "/home/uri03204/myDocs/ulib/emacs/iedit.elc" "Enter iedit mode" t)

;;------------------------------------------------------------------------------- Language Modes
;;(insert (format "%s" auto-mode-alist))((\.m\' . matlab-mode) (\.py$ . python-mode) (\.te?xt\' . text-mode) (\.c\' . c-mode) (\.h\' . c-mode) (\.tex\' . tex-mode) (\.ltx\' . latex-mode) (\.el\' . emacs-lisp-mode) (\.scm\' . scheme-mode) (\.l\' . lisp-mode) (\.lisp\' . lisp-mode) (\.f\' . fortran-mode) (\.F\' . fortran-mode) (\.for\' . fortran-mode) (\.p\' . pascal-mode) (\.pas\' . pascal-mode) (\.ad[abs]\' . ada-mode) (\.\([pP]\([Llm]\|erl\)\|al\)\' . perl-mode) (\.s?html?\' . html-mode) (\.cc\' . c++-mode) (\.hh\' . c++-mode) (\.hpp\' . c++-mode) (\.C\' . c++-mode) (\.H\' . c++-mode) (\.cpp\' . c++-mode) (\.cxx\' . c++-mode) (\.hxx\' . c++-mode) (\.c\+\+\' . c++-mode) (\.h\+\+\' . c++-mode) (\.m\' . objc-mode) (\.java\' . java-mode) (\.mk\' . makefile-mode) (\(M\|m\|GNUm\)akefile\(\.in\)?\' . makefile-mode) (\.am\' . makefile-mode) (\.texinfo\' . texinfo-mode) (\.te?xi\' . texinfo-mode) (\.s\' . asm-mode) (\.S\' . asm-mode) (\.asm\' . asm-mode) (ChangeLog\' . change-log-mode) (change\.log\' . change-log-mode) (changelo\' . change-log-mode) (ChangeLog\.[0-9]+\' . change-log-mode) (changelog\' . change-log-mode) (changelog\.[0-9]+\' . change-log-mode) (\$CHANGE_LOG\$\.TXT . change-log-mode) (\.scm\.[0-9]*\' . scheme-mode) (\.[ck]?sh\'\|\.shar\'\|/\.z?profile\' . sh-mode) (\(/\|\`\)\.\(bash_profile\|z?login\|bash_login\|z?logout\)\' . sh-mode) (\(/\|\`\)\.\(bash_logout\|shrc\|[kz]shrc\|bashrc\|t?cshrc\|esrc\)\' . sh-mode) (\(/\|\`\)\.\([kz]shenv\|xinitrc\|startxrc\|xsession\)\' . sh-mode) (\.m?spec\' . sh-mode) (\.mm\' . nroff-mode) (\.me\' . nroff-mode) (\.ms\' . nroff-mode) (\.man\' . nroff-mode) (\.\(u?lpc\|pike\|pmod\)\' . pike-mode) (\.TeX\' . tex-mode) (\.sty\' . latex-mode) (\.cls\' . latex-mode) (\.clo\' . latex-mode) (\.bbl\' . latex-mode) (\.bib\' . bibtex-mode) (\.sql\' . sql-mode) (\.m4\' . m4-mode) (\.mc\' . m4-mode) (\.mf\' . metafont-mode) (\.mp\' . metapost-mode) (\.vhdl?\' . vhdl-mode) (\.article\' . text-mode) (\.letter\' . text-mode) (\.tcl\' . tcl-mode) (\.exp\' . tcl-mode) (\.itcl\' . tcl-mode) (\.itk\' . tcl-mode) (\.icn\' . icon-mode) (\.sim\' . simula-mode) (\.mss\' . scribe-mode) (\.f90\' . f90-mode) (\.indent\.pro\' . fundamental-mode) (\.pro\' . idlwave-mode) (\.lsp\' . lisp-mode) (\.awk\' . awk-mode) (\.prolog\' . prolog-mode) (\.tar\' . tar-mode) (\.\(arc\|zip\|lzh\|zoo\|jar\)\' . archive-mode) (\.\(ARC\|ZIP\|LZH\|ZOO\|JAR\)\' . archive-mode) (\`/tmp/Re . text-mode) (/Message[0-9]*\' . text-mode) (/drafts/[0-9]+\' . mh-letter-mode) (\.zone\' . zone-mode) (\`/tmp/fol/ . text-mode) (\.y\' . c-mode) (\.lex\' . c-mode) (\.oak\' . scheme-mode) (\.sgml?\' . sgml-mode) (\.xml\' . sgml-mode) (\.dtd\' . sgml-mode) (\.ds\(ss\)?l\' . dsssl-mode) (\.idl\' . idl-mode) ([]>:/\]\..*emacs\' . emacs-lisp-mode) (\`\..*emacs\' . emacs-lisp-mode) ([:/]_emacs\' . emacs-lisp-mode) (/crontab\.X*[0-9]+\' . shell-script-mode) (\.ml\' . lisp-mode) (\.\(asn\|mib\|smi\)\' . snmp-mode) (\.\(as\|mi\|sm\)2\' . snmpv2-mode) (\.\(diffs?\|patch\|rej\)\' . diff-mode) (\.\(dif\|pat\)\' . diff-mode) (\.[eE]?[pP][sS]\' . ps-mode) (configure\.\(ac\|in\)\' . autoconf-mode) (BROWSE\' . ebrowse-tree-mode) (\.ebrowse\' . ebrowse-tree-mode) (#\*mail\* . mail-mode) (\.~?[0-9]+\.[0-9][-.0-9]*~?\' ignore t) (\.[1-9]\' . nroff-mode) (\.g\' . antlr-mode))
(add-to-list 'auto-mode-alist '("\\.sas\\'"   . sas-mode)     )
;(add-to-list 'auto-mode-alist '("\\.m\\'"    . octave-mode)  )
(add-to-list 'auto-mode-alist '("\\.cp\\'"    . c++-mode)     )

(add-to-list 'auto-mode-alist '("\\.proc\\'"  . sql-mode)     )
(add-to-list 'auto-mode-alist '("\\.sql\\'"   . sql-mode)     )

(add-to-list 'auto-mode-alist '("\\.make\\'"  . makefile-mode))

(add-to-list 'auto-mode-alist '("\\.org$"     . org-mode)     )
(add-to-list 'auto-mode-alist '("\\.csv$"     . org-mode)     )
(add-to-list 'auto-mode-alist '("\\.bat$"     . dos-mode)     )

(add-to-list 'auto-mode-alist '("\\.xml$"     . xml-mode)     )
(add-to-list 'auto-mode-alist '("\\.aspx$"    . xml-mode)     )
(add-to-list 'auto-mode-alist '("\\.master$"  . xml-mode)     )

(add-to-list 'auto-mode-alist '("\\.mocha\\'" . java-mode)    )
(add-to-list 'auto-mode-alist '("\\.java\\'"  . java-mode)    )
(add-to-list 'auto-mode-alist '("\\.js\\'"    . java-mode)    )
(add-to-list 'auto-mode-alist '("\\.jad\\'"   . java-mode)    )

(add-to-list 'auto-mode-alist '("\\.cs$"      . csharp-mode)  )

;;(setq auto-mode-alist   (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
;;(insert (format "%s" auto-mode-alist))((\.m\' . matlab-mode) (\.py$ . python-mode) (\.te?xt\' . text-mode) (\.c\' . c-mode) (\.h\' . c-mode) (\.tex\' . tex-mode) (\.ltx\' . latex-mode) (\.el\' . emacs-lisp-mode) (\.scm\' . scheme-mode) (\.l\' . lisp-mode) (\.lisp\' . lisp-mode) (\.f\' . fortran-mode) (\.F\' . fortran-mode) (\.for\' . fortran-mode) (\.p\' . pascal-mode) (\.pas\' . pascal-mode) (\.ad[abs]\' . ada-mode) (\.\([pP]\([Llm]\|erl\)\|al\)\' . perl-mode) (\.s?html?\' . html-mode) (\.cc\' . c++-mode) (\.hh\' . c++-mode) (\.hpp\' . c++-mode) (\.C\' . c++-mode) (\.H\' . c++-mode) (\.cpp\' . c++-mode) (\.cxx\' . c++-mode) (\.hxx\' . c++-mode) (\.c\+\+\' . c++-mode) (\.h\+\+\' . c++-mode) (\.m\' . objc-mode) (\.java\' . java-mode) (\.mk\' . makefile-mode) (\(M\|m\|GNUm\)akefile\(\.in\)?\' . makefile-mode) (\.am\' . makefile-mode) (\.texinfo\' . texinfo-mode) (\.te?xi\' . texinfo-mode) (\.s\' . asm-mode) (\.S\' . asm-mode) (\.asm\' . asm-mode) (ChangeLog\' . change-log-mode) (change\.log\' . change-log-mode) (changelo\' . change-log-mode) (ChangeLog\.[0-9]+\' . change-log-mode) (changelog\' . change-log-mode) (changelog\.[0-9]+\' . change-log-mode) (\$CHANGE_LOG\$\.TXT . change-log-mode) (\.scm\.[0-9]*\' . scheme-mode) (\.[ck]?sh\'\|\.shar\'\|/\.z?profile\' . sh-mode) (\(/\|\`\)\.\(bash_profile\|z?login\|bash_login\|z?logout\)\' . sh-mode) (\(/\|\`\)\.\(bash_logout\|shrc\|[kz]shrc\|bashrc\|t?cshrc\|esrc\)\' . sh-mode) (\(/\|\`\)\.\([kz]shenv\|xinitrc\|startxrc\|xsession\)\' . sh-mode) (\.m?spec\' . sh-mode) (\.mm\' . nroff-mode) (\.me\' . nroff-mode) (\.ms\' . nroff-mode) (\.man\' . nroff-mode) (\.\(u?lpc\|pike\|pmod\)\' . pike-mode) (\.TeX\' . tex-mode) (\.sty\' . latex-mode) (\.cls\' . latex-mode) (\.clo\' . latex-mode) (\.bbl\' . latex-mode) (\.bib\' . bibtex-mode) (\.sql\' . sql-mode) (\.m4\' . m4-mode) (\.mc\' . m4-mode) (\.mf\' . metafont-mode) (\.mp\' . metapost-mode) (\.vhdl?\' . vhdl-mode) (\.article\' . text-mode) (\.letter\' . text-mode) (\.tcl\' . tcl-mode) (\.exp\' . tcl-mode) (\.itcl\' . tcl-mode) (\.itk\' . tcl-mode) (\.icn\' . icon-mode) (\.sim\' . simula-mode) (\.mss\' . scribe-mode) (\.f90\' . f90-mode) (\.indent\.pro\' . fundamental-mode) (\.pro\' . idlwave-mode) (\.lsp\' . lisp-mode) (\.awk\' . awk-mode) (\.prolog\' . prolog-mode) (\.tar\' . tar-mode) (\.\(arc\|zip\|lzh\|zoo\|jar\)\' . archive-mode) (\.\(ARC\|ZIP\|LZH\|ZOO\|JAR\)\' . archive-mode) (\`/tmp/Re . text-mode) (/Message[0-9]*\' . text-mode) (/drafts/[0-9]+\' . mh-letter-mode) (\.zone\' . zone-mode) (\`/tmp/fol/ . text-mode) (\.y\' . c-mode) (\.lex\' . c-mode) (\.oak\' . scheme-mode) (\.sgml?\' . sgml-mode) (\.xml\' . sgml-mode) (\.dtd\' . sgml-mode) (\.ds\(ss\)?l\' . dsssl-mode) (\.idl\' . idl-mode) ([]>:/\]\..*emacs\' . emacs-lisp-mode) (\`\..*emacs\' . emacs-lisp-mode) ([:/]_emacs\' . emacs-lisp-mode) (/crontab\.X*[0-9]+\' . shell-script-mode) (\.ml\' . lisp-mode) (\.\(asn\|mib\|smi\)\' . snmp-mode) (\.\(as\|mi\|sm\)2\' . snmpv2-mode) (\.\(diffs?\|patch\|rej\)\' . diff-mode) (\.\(dif\|pat\)\' . diff-mode) (\.[eE]?[pP][sS]\' . ps-mode) (configure\.\(ac\|in\)\' . autoconf-mode) (BROWSE\' . ebrowse-tree-mode) (\.ebrowse\' . ebrowse-tree-mode) (#\*mail\* . mail-mode) (\.~?[0-9]+\.[0-9][-.0-9]*~?\' ignore t) (\.[1-9]\' . nroff-mode) (\.g\' . antlr-mode))
;(add-to-list 'auto-mode-alist '("\\.m\\'"     . octave-mode)  )

;;-------------------------------------------------------------------------------- Save Session as Desktop
;;  use desktop-change-dir to /home/uri03204/.emacs.d/desktop to get it back
;;    say "no" to save-desktop?
;;    say "yes" to steal from PID?
;;(desktop-save-mode 1)  ; desktop-revert desktop-change-dir
;;(desktop-change-dir "/home/uri03204/myDocs/config")
;;(setq desktop-path "/home/kleyn/.emacs.d/desktop")
;;(desktop-save-mode 1)
;;(setq desktop-auto-save-timeout 300)

;;-------------------------------------------------------------------------------- History
(setq history-length 10000)
(savehist-mode 1)
; (list-command-history)
;;-------------------------------------------------------------------------------- Buffer List Menu
(global-set-key (kbd "C-x C-b") 'my-list-buffers)
(defun my-list-buffers (&optional files-only)
  "Display a list of existing buffers with file only"
  (interactive "P")
  (switch-to-buffer (list-buffers-noselect t)))
(setq Buffer-menu-name-width 40)

;;------------------------------------------------------------------------ Cycle Buffer
;(load-library "cycle-buffer")
(autoload 'cycle-buffer "cycle-buffer" "Cycle forward." t)
(autoload 'cycle-buffer-backward "cycle-buffer" "Cycle backward." t)
(autoload 'cycle-buffer-permissive "cycle-buffer" "Cycle forward allowing *buffers*." t)
(autoload 'cycle-buffer-backward-permissive "cycle-buffer" "Cycle backward allowing *buffers*." t)
(autoload 'cycle-buffer-toggle-interesting "cycle-buffer" "Toggle if this buffer will be considered." t)
;;------------------------------------------------------------------------ Kill buffer unconditionally
(defun kill-this-buffer-volatile ()
    "Kill current buffer, even if it has been modified."
    (interactive)
    (set-buffer-modified-p nil)
    (kill-this-buffer))

;;------------------------------------------------------------------------ Backup location
(setq backup-directory-alist          `((".*" . , "/home/kleyn/history/emacsBackups")))
(setq auto-save-file-name-transforms  `((".*" ,   "/home/kleyn/history/emacsBackups" t)))

;;------------------------------------------------------------------------ Org-Mode
(require 'org)
;(define-key global-map "\C-cl" 'org-store-link)
;(define-key global-map "\C-ca" 'org-agenda)
(defalias 'make-org-tbl  (kbd "ESC x org-mode RET ESC < C-SPC ESC > C-c |"))
(setq org-default-notes-file "~/myDocs/logbook/notes.org")
(setq org-cycle-include-plain-lists t)
(setq org-startup-folded nil)
;;(defalias 'see-logbooks  (kbd "C-x C-f ~/myDocs/logbook RET"))
(defun org-collapse()     (interactive) (org-shifttab 0))

(define-key org-mode-map (kbd "C-c C->") 'org-demote-subtree)
(define-key org-mode-map (kbd "C-c C-<") 'org-promote-subtree)
;; needs ox.el = org-exporter.el
;;(require 'ox-confluence)

(require 'cl)

(defun org-transpose-table-at-point ()
  "Transpose orgmode table at point, eliminate hlines."
  (interactive)
  (let ((contents (apply #'mapcar* #'list ;; <== LOB magic imported here
			 (remove-if-not 'listp ;; remove 'hline from list
					(org-table-to-lisp)))) ;; signals error if not table
	)
    (delete-region (org-table-begin) (org-table-end))
    (insert (mapconcat (lambda(x) (concat "| " (mapconcat 'identity x " | " ) "
  |\n" ))
		       contents
		       ""))
    (org-table-align)
    )
  )

;;-- python mode
;(add-hook 'python-mode-hook
;  #'(lambda ()
;      (define-key python-mode-map "\C-m" 'newline-and-indent)))
;(add-hook 'python-mode-hook
;		  (lambda ()
;			(setq-default indent-tabs-mode t)
;			(setq-default tab-width 4)
;			(setq-default python-indent 4)))
(add-hook 'python-mode-hook
		  (lambda ()
			(setq indent-tabs-mode t)
			(setq tab-width 4)
			(setq python-indent 4)))

;; --------- org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

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

;; -------------------------- new stuff
;; ;; Save point position between sessions.
;; (use-package saveplace)
;; (setq-default save-place t)
;; (setq save-place-file (expand-file-name "places" user-emacs-directory))

;; ;; Fix empty pasteboard error.
;; (setq save-interprogram-paste-before-kill nil)

;; ;; Auto refresh buffers when edits occur outside emacs
;; (global-auto-revert-mode 1)

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
(setq default-truncate-lines t)
(setq tab-width 4)
;;(setq tab-width 2)
(setq-default x-stretch-cursor t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(display-time-mode t)
 '(font-use-system-font nil)
 '(matlab-auto-fill nil)
 '(matlab-fill-code nil)
 '(org-confirm-babel-evaluate nil)
 '(package-selected-packages (quote (treemacs magit ein realgud org-trello neotree)))
 '(realgud:ipdb-command-name "ipdb3")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-remote-path
   (quote
    (tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin" "/data/data/com.termux/files/usr/bin/applets" tramp-own-remote-path))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier 10 Pitch" :foundry "bitstream" :slant normal :weight normal :height 107 :width normal)))))

;; TRAMP Above!
;; OOptions->Cusomize Emacs ->Browse -> Communication -> Tramp--> Tramp Remote Path -> add "/data/data/com.termux/files/usr/bin/applets"
;;(setq tramp-remote-path '("/data/data/com.termux/files/usr/bin/applets" "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin"))
;;(setq tramp-verbose 10)

;; 5.17 Android shell setup hints
;; Tramp uses the adb method to access Android devices. Android devices provide a restricted shell access through an USB connection. The local host must have the adb program installed. Usually, it is sufficient to open the file /adb::/. Then you can navigate in the filesystem via dired.
;; Alternatively, applications such as Termux or SSHDroid that run sshd process on the Android device can accept any ssh-based methods provided these settings are adjusted:
;;     sh must be specified for remote shell since Android devices do not provide /bin/sh. sh will then invoke whatever shell is installed on the device with this setting:
;;               (add-to-list 'tramp-connection-properties
;;               	     (list (regexp-quote "192.168.0.26") "remote-shell" "sh"))
;;     where ‘192.168.0.26’ is the Android device's IP address. (see Predefined connection information).
;;     Tramp requires preserving PATH environment variable from user settings. Android devices prefer /system/xbin path over /system/bin. Both of these are set as follows:
;;               (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
;;               (add-to-list 'tramp-remote-path "/system/xbin")
;;     When the Android device is not ‘rooted’, specify a writable directory for temporary files:
;;               (add-to-list 'tramp-remote-process-environment "TMPDIR=$HOME")
;;     Open a remote connection with the command C-x C-f /ssh:192.168.0.26#2222: <RET>, where sshd is listening on port ‘2222’.
;;     To add a corresponding entry to the ~/.ssh/config file (recommended), use this:
;;               Host android
;;                    HostName 192.168.0.26
;;                    User root
;;                    Port 2222
;;     To use the host name ‘android’ instead of the IP address shown in the previous example, fix the connection properties as follows:
;;               (add-to-list 'tramp-connection-properties
;;               	     (list (regexp-quote "android") "remote-shell" "sh"))
;; Open a remote connection with a more concise command C-x C-f /ssh:android: <RET>.

;; ------------------------------------------------------------------------------ Scroll One Line At a time
(defun scroll-one-line-up (&optional arg)
  "Scroll the selected window up (forward in the text) one line (or N lines)."
  (interactive "p")
  (scroll-up (or arg 1)))
(defun scroll-one-line-down (&optional arg)
  "Scroll the selected window down (backward in the text) one line (or N)."
  (interactive "p")
  (scroll-down (or arg 1)))

;; ------------------------------------------------------------------------------ Window Sizing
(defun window-hwiden (&optional arg)
  "Widen window"
  (interactive "p")
  (enlarge-window-horizontally 10))
(defun window-hshrink (&optional arg)
  "Shrink window"
  (interactive "p")
  (shrink-window-horizontally 10))

;; ------------------------------------------------------------------------------ transpose windows [kp-divide]
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

;; ------------------------------------------------------------- Buffer menu
(defun buffer-menu-sort-by-filename (&optional arg)
  (interactive "P")
  (Buffer-menu-sort 6))

;; ------------------------------------------------------------- Selective Display
(setq selective-display-lev 0)
(defun selective-display-level-incr (&optional arg)
	(interactive "P")
	(setq selective-display-lev (+ selective-display-lev 2))
	(set-selective-display selective-display-lev))
(defun selective-display-level-decr (&optional arg)
	(interactive "P")
	(setq selective-display-lev (- selective-display-lev 2))
	(set-selective-display selective-display-lev))
(defun selective-display-level-zero (&optional arg)
	(interactive "P")
	(setq selective-display-lev 0)
	(set-selective-display selective-display-lev))

;;--------------------------------------------------------------  unjustify
(defun unjustify-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

;;--------------------------------------------------------------  Enhanced Line Editing
(defun ed-copy-line (arg)
  "Copy lines to the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defun ed-dup-line ()
  "Duplicate line under cursor"
  (interactive)
  (let ((start-column (current-column)))
    (save-excursion                     ;save-excursion restores mark
      (forward-line -1)
      (ed-copy-line 1)
      (forward-line 1)
      (move-to-column 0)
      (yank))
    (move-to-column start-column))
  (message "line is dup'ed"))

;;---- option1 proto swap
(require 'regexp-opt)
(defun proto-swap (a b)
  (save-excursion
    (goto-char (point-min))
    (let ((re (regexp-opt (list a b))))
      (while (re-search-forward re nil t nil)
        (goto-char (match-beginning 0))
        ; (message (format "match %d" (point)))
        (when (looking-at (regexp-opt (list a)))
          ; (message "match a")
          (replace-match b))
        (when (looking-at (regexp-opt (list b)))
          ; (message "match b")
          (replace-match a))
        (goto-char (match-end 0))))))
(with-current-buffer (current-buffer)  (proto-swap "bar" "foo"))

;;---- option2 parallel swap
(require 'cl)
(defun parallel-swap (plist &optional start end)
  (interactive
   `(,(loop with input = (read-from-minibuffer "Swap: ")
            with limit = (length input)
            for (item . index) = (read-from-string input 0)
                            then (read-from-string input index)
            collect (prin1-to-string item t) until (<= limit index))
     ,@(if (use-region-p) `(,(region-beginning) ,(region-end)))))
  (let* ((alist (list (cons (car plist) (cadr plist)) (cons (cadr plist) (car plist))))
       ;;(alist (loop for (key val . tail) on plist by #'cddr collect (cons key val)))
         (matcher (regexp-opt (mapcar #'car alist) 'words)))
    (save-excursion
      (goto-char (or start (point)))
      (while (re-search-forward matcher (or end (point-max)) t)
        (replace-match (cdr (assoc-string (match-string 0) alist)))))))

;;-------------------------------------------------- parallel cursor editing
;; (defun parallel-replace-read-plist (input)
;;   (loop with limit = (length input)
;;         for (item . index) = (read-from-string input 0)
;;         then (read-from-string input index)
;;         collect (prin1-to-string item t) until (<= limit index)))

;; (defun parallel-replace (plist &optional start end)
;;   (interactive
;;    (cons
;;     (parallel-replace-read-plist (read-from-minibuffer "Replace: "))
;;     (when (use-region-p)
;;       (list (region-beginning) (region-end)))))
;;   (let* ((alist (loop for (key val . tail) on plist by #'cddr
;;                       collect (cons key val)))
;;          (matcher (regexp-opt (mapcar #'car alist) 'words)))
;;     (save-excursion
;;       (goto-char (or start (point)))
;;       (while (re-search-forward matcher (or end (point-max)) t)
;;         (replace-match (cdr (assoc-string (match-string 0) alist)))))))

;; (defvar parallel-replace-alist nil)

;; (defun parallel-query-replace (plist &optional start end)
;;   (interactive
;;    (cons
;;     (parallel-replace-read-plist (read-from-minibuffer "Replace: "))
;;     (when (use-region-p)
;;       (list (region-beginning) (region-end)))))
;;   (let* (matcher)
;;     (set (make-local-variable 'parallel-replace-alist)
;;          (loop for (key val . tail) on plist by #'cddr
;;                collect (cons key val)))
;;     (setq matcher (regexp-optp (mapcar #'car parallel-replace-alist) 'words))
;;     (query-replace-regexp matcher
;;                           '(replace-eval-replacement
;;                             replace-quote
;;                             (cdr (assoc-string (match-string 0) parallel-replace-alist case-fold-search)))
;;                           nil
;;                           start
;;                           end)))
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
;(w32-shell-execute "open" )

;;---------------------------------------------------------------------------- quotify list of items
(defun lines-to-cslist (start end &optional arg)
  (interactive "r\nP")
  (let ((insertion
         (mapconcat
          (lambda (x) (format "'%s'" x))
          (split-string (buffer-substring start end)) ", ")))
    (delete-region start end)
    (insert insertion)
    (when arg (forward-char (length insertion)))))

;;------------------------------------------------------------------------------- Open With
(defalias 'my-open-file  (kbd "C-a C-s / C-b C-s : C-x C-x ESC w C-x C-f C-a C-y DEL C-k RET")
(add-hook 'find-file-hook  ;; ensure file in production can't be modified via emacs
  '(lambda ()
     (when (string= (substring (buffer-file-name) 0 4) "/dls")
       (message "Toggle to read-only for existing file")
	   ; (read-only-mode ?)
       (toggle-read-only 1)))))

;;This isn't nearly as drastic as what you're looking for, but it is possible to customize how Emacs calls ls in dired-mode.
;;M-x customize-variable RET dired-listing-switches RET
;; I used it to omit the group ID of files with the -o option, saving some horizontal screen real estate.

(defun ergoemacs-open-in-external-app ()
  "Open the current file or dired marked files in external app."
  (interactive)
  (let (doIt (myFileList
	      (cond
	       ((string-equal major-mode "dired-mode") (dired-get-marked-files))
	       (t (list (buffer-file-name))) ) ) )
    (setq doIt (if (<= (length myFileList) 5)
                   t
                 (y-or-n-p "Open more than 5 files?") ) )
    (when doIt
      (cond
       ((string-equal system-type "window-nt")
        (mapc (lambda (fPath) (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" fPath t t)) ) myFileList))

       ((string-equal system-type "cygwin")
        (mapc (lambda (fPath) (message (concat "cygstart.exe " fPath))) myFileList)
        (mapc (lambda (fPath) (shell-command (concat "cygstart.exe " fPath))) myFileList))

       ((string-equal system-type "darwin")
        (mapc (lambda (fPath) (shell-command (format "open \"%s\"" fPath)) )  myFileList))

       ((string-equal system-type "gnu/linux")
        (mapc (lambda (fPath) (let ((process-connection-type nil)) (start-process "" nil "xdg-open" fPath)) ) myFileList))
       )
      )
    )
)

;;------------------------------------------------------------------------------ XML
;;{{{ XML

;; loading script
;; (load (concat emacs-dir "nxml-mode/rng-auto.el"))
;; (when (locate-library "nxml-mode")
;;   (progn
;;     ;; file types
;;     (add-to-list 'auto-mode-alist
;; 		 (cons (concat "\\." (regexp-opt '("xml"
;; 						   "html"
;; 						   "xul"
;; 						   "xsd"
;; 						   "sch"
;; 						   "rng"
;; 						   "xslt"
;; 						   "svg"
;; 						   "rss"
;; 						   "asp"
;; 						   "aspx"
;; 						   "zpt"
;; 						   "cpt"
;; 						   "pt") t) "\\'")
;; 		       'nxml-mode))
;;     ;; spaces insted of tabs
;;     (add-hook 'nxml-mode-hook
;; 	      (lambda () (setq indent-tabs-mode nil)))
;;    ))

;;}}}
;;----------------------------------------------------------------------------- SGML XML
;C-c C-v	sgml-validate
;C-M-h		sgml-mark-current-element
;C-c C-u C-a	sgml-unfold-all
;C-c C-u C-e	sgml-unfold-element
;C-c C-f C-e	sgml-fold-element
;(require 'psgml)
;(add-to-list 'auto-mode-alist '("\\.xml$"     . psgml-mode)   )
;(setq load-path (append load-path '("/home/uri03204/ulib/emacs/psgml-1.3.2"))) ;; (insert (format "%s" load-path))
;(load-library "psgml")
(setq sgml-basic-offset 2)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)
(add-hook 'xml-mode-hook		; XML-specific settings
	  (function (lambda()
		      (make-face 'sgml-comment-face) ; faces creation
		      (make-face 'sgml-start-tag-face)
		      (make-face 'sgml-end-tag-face)
		      (make-face 'sgml-doctype-face)

		      (set-face-foreground 'sgml-comment-face "SeaGreen") ; faces definitions
		      (set-face-foreground 'sgml-start-tag-face "DarkBlue")
					;(set-face-foreground 'sgml-end-tag-face "OrangeRed")
					;(set-face-foreground 'sgml-doctype-face "MintCream") ; markup to face mappings
					; (see http://www.lysator.liu.se/~lenst/about_psgml/psgml.html#Highlight for details)
		      (setq sgml-markup-faces
			    '((comment   . sgml-comment-face)
			      (start-tag . sgml-start-tag-face)
			      (end-tag   . sgml-end-tag-face)
			      (doctype   . sgml-doctype-face) ) )
		      (local-set-key [S-left]  'sgml-fold-element)
		      (local-set-key [S-right] 'sgml-unfold-element)
;sgml-fold-element  sgml-unfold-element
;sgml-fold-region
;sgml-fold-subelement
;sgml-unfold-all
;sgml-unfold-line
			  (setq sgml-set-face t) ; turn faces on
		      (setq sgml-indent-data t))))
; 3 bottom keys of keypad, upper 6 are work 6 virtual screens

;;--------------------------------------------------------------------------------nXML mode
;(add-to-list 'hs-special-modes-alist
;             '(sgml-mode
;               "<!--\\|<[^/>]*[^/]>"                    ;; regexp for start block
;               "-->\\|</[^/>]*[^/]>"                    ;; regexp for end block
;
;               "<!--"                                   ;; regexp for comment start. (need this??)
;               sgml-skip-tag-forward
;               nil))
; I tried using outline mode to fold blocks, as someone posted earlier,
; but had no luck with it. Here's something quick and (very) dirty that
; I whipped together using hideshow mode:

; (defun my-nxml-mode-hook ()
; "Functions to run when in nxml mode."
; (setq nxml-sexp-element-flag t)
; (hs-minor-mode 1))

; (add-hook 'nxml-mode-hook 'my-nxml-mode-hook)

; (eval-after-load "hideshow.el"
; (let ((nxml-mode-hs-info '(nxml-mode ("^\\s-*\\(<[^/].*>\\)\\s-*$" 1) "^\\s-*</.*>\\s-*$")))
; (when (not (member nxml-mode-hs-info hs-special-modes-alist))
; (setq hs-special-modes-alist
; (cons nxml-mode-hs-info hs-special-modes-alist)))))

; If anyone comes up with a better set of regexps, please post them!

;;------------------------------------------------------------------------------- ido Mode
;; TBD
;;(load-library "ido")
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)
;;(ido-mode t)
;;(windmove-default-keybindings 'shift)
;;--------------------------------------------------------------------------------
;; bing!
;     "http://www.bing.com/search?q="
;; (defun goog ()
;;   (interactive)
;;   (browse-url (concat "http://www.google.com/search?hl=en&q=" (if mark-active
;; 									 (buffer-substring (region-beginning) (region-end))
;; 								       (read-string "Goog: ")))))

;;-------------------------------------------------------------------------------- white space
;; (setq show-trailing-whitespace 1)
;;(setq show-trailing-whitespace t) local buffer only
(defun tog-whitespace ()
  "Toggle show-trailing-whitespace between t and nil"
  (interactive)
  (setq show-trailing-whitespace (not show-trailing-whitespace)))
;; C-c w        delete-trailing-whitespace
;;GNU Emacs 22 or later has library whitespace.el, which lets you highlight whitespace in several ways. See WhiteSpace.
;-------------------------------------------------------------------------------- ZeeTree
(add-to-list 'load-path "/home/kleyn/ulib/emacs/ztree-master")
 ;(push (substitute-in-file-name "path-to-ztree-directory") load-path)
 (require 'ztree-diff)
 (require 'ztree-dir)
 ;local binf to tab (ztree-perform-action)
 ;Call the ztree-diff interactive function: M-x ztree-diff

;;-------------------------------------------------------------------------------- Dired
;(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
;;(defun w32-browser (doc) (w32-shell-execute 1 doc))
;;(eval-after-load "dired" '(define-key dired-mode-map [f3]
;;			    (lambda ()
;;			      (interactive)
;;			      (w32-browser (dired-replace-ion-string "/" "\\" (dired-replace-in-string "/cygdrive/C/" "C:\\" (dired-get-filename)))))))
(add-hook 'dired-load-hook
   (lambda ()			;(load "dired-x")
     (require 'dired-x)
     (require 'wdired)
     (autoload 'wdired-change-to-wdired-mode "wdired")
     ;; Set dired-x global variables here.  For example:
     ;; (setq dired-guess-shell-gnutar "gtar")
     ;; (setq dired-x-hands-off-my-keys nil)
     (setq dired-omit-mode t)
     (setq dired-omit-files-p t)
     (setq dired-omit-files "^#\\|^\\.$|\\.\\.$")
     (setq dired-omit-files "^\\..*$")
     (setq dired-omit-extensions '(".asv" "~" ".o" ".pyc" ".class"))
     (setq dired-no-confirm '(revert-subdirs))))

(add-hook 'dired-mode-hook
	  (lambda ()
	    ;; Set dired-x buffer-local variables here.  For example:
	    (dired-omit-mode 1)
	    (progn
	      (setq dired-no-confirm '(revert-subdirs))
	      ;(define-key dired-mode-map [right] 'dired-go-subdir-kbm)
              ;(define-key dired-mode-map [left] 'dired-up-directory)
	      (defalias 'dired-up (kbd "ESC < C-e C-r / NUL C-a ESC w C-x d C-a C-y C-k C-a ESC \\ C-e RET C-x b RET C-x k RET"))
	      (defalias 'dired-go-subdir-kbm (kbd "f C-x b RET C-x k RET")))))
;
;Dired Listing Switches: Hide Value -ahl --time-style=long-iso
					;   State: SET for current session only.
;;(setq tramp-default-method "ssh")
(setq tramp-verbose 10)

;; /adb::/path/to/file.
;; C-x C-f /:adb::/storage/emulated/0
;; C-x C-f /adb::/storage/emulated/0
(defun diredKleyqs501()		(interactive) (dired "/scp:kleyn@62.233.104.49:/home/kleyn"))
(defun diredGemA()		(interactive) (dired "/adb::/data/data/com.termux/files/home/MyDocs"))  ;; /storage/emulated/0 ‘/ssh:daniel@melancholia#42:.emacs’  /ssh:foo@192.168.1.93#8022:
(defun diredGemA()		(interactive) (dired "/adb::/storage"))  ;; /storage/emulated/0 ‘/ssh:daniel@melancholia#42:.emacs’  /ssh:foo@192.168.1.93#8022:
(defun diredGem()		(interactive) (dired "/scp:u0_a94@192.168.1.93#8022:/data/data/com.termux/files/home/MyDocs"))  ;; ‘/ssh:daniel@melancholia#42:.emacs’  /ssh:foo@192.168.1.93#8022:
(defun diredGem2()		(interactive) (dired "/ssh:u0_a94@192.168.1.93#8022:/data/data/com.termux/files/home/MyDocs"))  ;; ‘/ssh:daniel@melancholia#42:.emacs’  /ssh:foo@192.168.1.93#8022:
(defun diredTuringIn()		(interactive) (dired "/scp:kleyn@192.168.1.243:/home/kleyn"))
(defun diredTuringOut()		(interactive) (dired "/scp:kleyn@192.168.1.8:/home/kleyn"))
(defun diredFaraday()		(interactive) (dired "/scp:kleyn@192.168.1.89:/home/kleyn"))
(defun diredHome ()		(interactive) (dired "/home/kleyn/" nil))
;;(defun see-nok900-doAndDone()	(interactive) (find-file "/scp:root@192.168.1.187:/home/user/MyDocs/aNotes/doAndDone.org"))
;;(defun diamond()		(interactive) (dired "/scp:uri03204@nx-staff.diamond.ac.uk:/home/uri03204/dot"))
(defun see-dotEmacs()		(interactive) (find-file "/home/kleyn/.emacs"))
(defun see-shell-output()	(interactive) (switch-to-buffer-other-window "*Shell Command Output*"))


;; when sorting in dired mode, move cursor back to top
(defadvice dired-sort-toggle-or-edit (after dired-sort-to-top activate)
   "Move to beginning of buffer (instead of keeping point on the current file)."
   (goto-char (point-min))
   (forward-line 3))

(setq load-path (append load-path '("/home/kleyn/ulib/emacs/dired-hacks"))) ;; (insert (format "%s" load-path))
(load-library "dired-subtree")
(setq dired-subtree-line-prefix "     ")

;; (add-hook 'dired-mode-hook
;;           (lambda ()
;;             (setq-local ace-jump-search-filter
;;                         (lambda ()
;;                           (get-text-property (point) 'dired-filename)))))

(define-key dired-mode-map [right]           'dired-go-subdir-kbm)
(define-key dired-mode-map [left]            'dired-up-directory)
(define-key dired-mode-map (kbd "<S-right>") 'dired-subtree-insert)
(define-key dired-mode-map (kbd "<S-left>")  'dired-subtree-remove)
(define-key dired-mode-map (kbd "<S-up>")    'dired-subtree-previous-sibling)
(define-key dired-mode-map (kbd "<S-down>")  'dired-subtree-next-sibling)
(define-key dired-mode-map (kbd "e")         'dired-subtree-only-this-file)
(define-key dired-mode-map "r"               'wdired-change-to-wdired-mode)
(define-key dired-mode-map "O"               'ergoemacs-open-in-external-app)
(define-key dired-mode-map "t"               'dired-omit-mode )
; (define-key dired-mode-map (kbd "p")  'dired-subtree-only-this-file) ; tbd: pick-off the path of the given file into clipboard
;; of emacs.  It is adviced to place bindings for these into a
;; convenient prefix key map, for example `C-,`

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

;(add-hook 'ediff-mode-hook (lambda () (setq ediff-shell "C:/cygwin/bin/mintty.exe")))
;(add-hook 'ediff-load-hook (lambda () (setq ediff-shell "C:/cygwin/bin/mintty.exe")))

;;--------------------------------------------------------------------- Misc
(defun instimestamp ()
   (interactive)
   (insert (format-time-string "%Y%m%d_%H:%M:%S")))
(defun indent-to-col ()
   (interactive)
   (indent-to-column 110))

;;--------------------------------------------------------------------- Key Bindings

;;; don't quit so easily
(global-unset-key "\C-x\C-c")                            ;; The following key-binding quits emacs -- we disable it too
(global-set-key "\C-x\C-c\C-v" 'save-buffers-kill-emacs) ;; But we establish a longer sequence that is harder to hit by accident:
;;(global-set-key [M-return]		'ffap)  ;; open file under cursor
(global-set-key [M-home]	'org-collapse)
;(global-set-key [M-up]	        'other-window)
(global-set-key "\M-$"		'query-replace-regexp)
;(global-unset-key (kbd "C-q"))
;(global-set-key "\C-q"		'quoted-insert)
(global-set-key "\C-cq"		'quick-calc)
(global-set-key "\C-cb"		'ediff-buffers)
(global-set-key "\C-cd"		'ediff-directories)
(global-set-key "\C-ch"		'diredHome)
(global-set-key "\C-ci"		'indent-to-col)
(global-set-key "\C-cl"		'ed-dup-line)
(global-set-key "\C-cq"		'lines-to-cslist)
(global-set-key "\C-cr"		'auto-revert-tail-mode)
(global-set-key "\C-cs"		'parallel-swap)
(global-set-key "\C-ct"		'org-table-convert-region)
(global-set-key "\C-cw"		'delete-trailing-whitespace)
(global-set-key "\C-xl"		'list-matching-lines)
(global-set-key "\C-xt"		'instimestamp)
(global-set-key "\C-z"		'replace-string)
(global-set-key [kp-divide]     'toggle-window-split)
;(define-key global-map "\C-co" 'org-capture)

(global-set-key [f1]            'see-nok900-doAndDone)
(global-set-key [f2]            'nok900) ; my-openfile  'neotree-show
(global-set-key [f3]            'see-dotEmacs)
(global-set-key [S-f3]          'see-dotBashrc)
(global-set-key [f4]            'my-list-buffers)
(global-set-key [S-f4]          'ergoemacs-open-in-external-app)

(global-set-key [f5]            'ffap) ; bookmark-bmenu-list
(global-set-key [f6]            'desktop-save)
;;(global-set-key [S-f6]            'ergo-emacs-open-in-external-app)
(global-set-key [f7]            'my-list-buffers)
(global-set-key [S-f7]          'buffer-menu-sort-by-filename)
(global-set-key [f8]            'ztree-dir)
(global-set-key [S-f8]          'dired-omit-mode)

(global-set-key [f9]		'ielm)  ;; open file under cursor
(global-set-key [f10]           'see-shell-output) ;ergoemacs-open-in-external-app
(global-set-key [f11]           'hs-show-block)
(global-set-key [f12]           'hs-hide-block)

;; ; M-kp ... conflicts with workspace navigation:
;; (global-set-key [S-M-kp-down] 'sgml-fold-subelement) 
;; (global-set-key [S-M-kp-end]  'sgml-fold-element)   ;  fold everything below current element
;; (global-set-key [S-M-kp-next] 'sgml-unfold-element)

(global-set-key "\C-c>"		'selective-display-level-incr)
(global-set-key "\C-c<"		'selective-display-level-decr)
(global-set-key [S-kp-6]        'selective-display-level-incr)
(global-set-key [S-kp-4]        'selective-display-level-decr)
(global-set-key [S-kp-5]        'selective-display-level-zero)
;(global-set-key [S-kp-insert]  'yank)
;(global-set-key [C-kp-insert]  'kill-ring-save)
(global-set-key [S-insert]      'clipboard-yank)
(global-set-key [C-insert]      'clipboard-kill-ring-save)


(global-set-key [(prior)]       'cycle-buffer-backward)
(global-set-key [C-up]          'cycle-buffer-backward)          ;(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key [(next)]        'cycle-buffer)
(global-set-key [C-down]        'cycle-buffer)       
(global-set-key [kp-subtract]   'kill-this-buffer-volatile)  ; end is to close
(global-set-key [C-left]        'kill-this-buffer-volatile)
;(global-set-key [C-right]       'windmove-right)       ;(global-set-key (kbd "C-c <right>") 'windmove-right)w


;(global-set-key "\C-!"         'shell-command) TBD

(global-set-key "\C-xd"         'dired)
(global-set-key "\C-xi"         'insertLastSexp)   ; eval-print-last-sexp) ; ielm
(global-set-key [M-f9]		'insertLastSexp)  ;; open file under cursor

(global-set-key (kbd "C-.")     'repeat)

;; with a C-0 prefix argument.
(global-set-key [C-kp-subtract] 'text-scale-decrease)
(global-set-key [C-kp-add]      'text-scale-increase)

(global-set-key [S-up]          'scroll-one-line-down)
(global-set-key [S-down]        'scroll-one-line-up)
(global-set-key [S-right]       'window-hwiden)
(global-set-key [S-left]        'window-hshrink)

;(global-set-key [C-up]          'windmove-up)          ;(global-set-key (kbd "C-c <up>")    'windmove-up)
;(global-set-key [C-down]        'windmove-down)        ;(global-set-key (kbd "C-c <down>")  'windmove-down)
;(global-set-key [C-left]        'windmove-left)        ;(global-set-key (kbd "C-c <left>")  'windmove-left)
;(global-set-key [C-right]       'windmove-right)       ;(global-set-key (kbd "C-c <right>") 'windmove-right)
;;-------------------------------------------------------------------------------
(dired "/home/kleyn" nil)
;(desktop-change-dir "/home/uri03204/myDocs/config")

(put 'narrow-to-region 'disabled nil)




;;(server-start)


(setq password-cache-expiry nil)

