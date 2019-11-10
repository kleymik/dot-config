;;; last command, command history
;; rectangle-number-lines

;; --- redo
;; 
;; (global-set-key "ESC-r" #'(lambda () (interactive)    (eval (car command-history))))
;; C-x M-: (mnemonic: like M-: but with the elisp expression already filled in for you). – phils Jan 27 '13 at 22:29
;; C-h w runs the command where-is (found in global-map), which is an
;; It is bound to C-h w, <help> w.
;; (where-is DEFINITION &optional INSERT)
;; Print message listing key sequences that invoke the command DEFINITION.
;; Argument is a command definition, usually a symbol with a function definition.
;; If INSERT (the prefix arg) is non-nil, insert the message in the buffer.

;;--------------------------------------------------------------- Handy commands quick ref
;;
;; TBD dired-find-file-otherwindow open a cygwin link by inspecting it
;; flush-lines
;; C-h f describe-function Info-goto-emacs-command-node
;; C-h F Info-goto-emacs-command-node
;;

(defun alignFoo (pat)
  (interactive "spattern?")
  (align-regexp (region-beginning) (region-end) (concat "\\(\\s-*\\)" pat) 1 1 nil)
  ;;(align-regexp beg end (concat "\\(\\s-*\\)" pat) 1 1 nil)
  )

;;(defalias 'flipslash     (kbd "C-SPC C-e C-SPC ESC < ESC w C-x b *scratch* RET C-e RET C-y C-r SPC C-f C-SPC C-r total SPC use C-x C-x C-w ESC \ 2*DEL / C-a ESC \ ESC x replace-string / RET \ RET C-a"))
;;
;;---------------------------------------------------------------------REVERT
;; revert buffer coding C-x C-m
;;   variable:  buffer-file-coding-system
;;          USE iso-latin..
;;          USE utf-16-unix
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

;; replace selected 
;;(defun replace-selected ()
;;  (interactive)
;;  (if (region-active-p)
;;      (replace-string "^\(.*[0-9]+?:[0-9]+\)" "[[https://www.lds.org/scriptures/search?lang=eng&query=\1&x=0&y=0][\1]]"
;;                      nil (region-beginning) (region-end))
;;     (replace-regexp "^\(.*[0-9]+?:[0-9]+\)" "[[https://www.lds.org/scriptures/search?lang=eng&query=\1&x=0&y=0][\1]]")
;;     ))




(defun insPyDb ()
  (interactive)
  (move-beginning-of-line nil)
  ;;(newline-and-indent)
  ;; (end-of-line)
  ;; (open-line)
  (indent-according-to-mode)
  (insert "from util import dbg_toolbag as t; t.brk()")
  ; (insert "from see import see; import ipdb; ipdb.set_trace(context=15) # breakpoint()")
  (newline)
  (indent-according-to-mode)
  )




;; cleanMlLog
;;[			;; self-insert-command
;;3*C-k			;; kill-line

(fset 'cleanMlLog [?\C-s ?\[ ?\C-q ?\C-h ?\C-a escape ?\C-k ?\C-k ?\C-k])

;;------------------------------------------------------------------------------ Eval
(defun shell-command-on-buffer (command)
  (interactive "sShell command on buffer: ")
  (shell-command-on-region (point-min) (point-max) command t))

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
;;-------------------------------------------------------------------------------- Kill buffer unconditionally
(defun kill-this-buffer-volatile ()
    "Kill current buffer, even if it has been modified."
    (interactive)
    (set-buffer-modified-p nil)
    (kill-this-buffer))

;;------------------------------------------------------------------------------- Org-Mode
(require 'org)
(require 'ob)
(require 'cl)
;(add-to-list 'org-file-apps '(directory . emacs)) always open in dired
;(define-key global-map "\C-cl" 'org-store-link)
;(define-key global-map "\C-ca" 'org-agenda)
(defalias 'make-org-tbl  (kbd "ESC x org-mode RET ESC < C-SPC ESC > C-c |"))


(setq org-default-notes-file "~/myDocs/history/logbook.org")
(setq org-cycle-include-plain-lists t)
(setq org-startup-folded nil)
(setq org-catch-invisible-edits 'show-and-error)
(setq org-cycle-separator-lines 0)
;;(defalias 'see-logbooks  (kbd "C-x C-f ~/myDocs/logbook RET"))
(defun org-collapse()     (interactive) (org-shifttab 0))

(setq org-src-fontify-natively t)



(defun org-transpose-table-at-point ()
  "Transpose orgmode table at point, eliminate hlines."
  (interactive)
  (let ((contents (apply #'mapcar* #'list ;; <== LOB magic imported here
                         (remove-if-not 'listp ;; remove 'hline from list
                                        (org-table-to-lisp)))) ;; signals error if not table
        )
    (delete-region (org-table-begin) (org-table-end))
    (insert (mapconcat (lambda(x) (concat "| " (mapconcat 'identity x " | " ) " |\n" ))
                       contents
                       ""))
    (org-table-align)))



(defun org-table-to-sql ()
  (interactive)
  (goto-char (point-min))
  (forward-line 2)
  (beginning-of-line)
  (push-mark)
  (goto-char (mark-marker)) (replace-regexp "^|"           "("      ) ;; replace leading  | with (
  (goto-char (mark-marker)) (replace-regexp "|$"         t     ) ;; replace trailing |/LOCAL/USR/MK with ),
  (goto-char (mark-marker)) (replace-regexp "|$"           "),"     ) ;; replace trailing | with ),
  (goto-char (mark-marker)) (replace-regexp "\|"           ","      ) ;; replace          | with ,
  (goto-char (mark-marker)) (replace-regexp "[0-9a-z._-]+" "'\\&'"  ) ;; wrap single quotes around words
  (goto-char (mark-marker)) (replace-regexp ",[ \t]+,"     ",NULL," ) ;; NULL in gaps 
  (goto-char (mark-marker)) (replace-regexp ",[ \t]+,"     ",NULL," ) ;; NULL in gaps  need to run twice!!!
  (goto-char (mark-marker)) (replace-regexp ",[ \t]+)"     ",NULL)" ) ;; NULL at end
  (goto-char (point-max)) (search-backward ",") (delete-char 1)       ;; delete comma after list end
  (goto-char (point-min))
  (forward-line 2)
  (insert "INSERT INTO [EQTYBASKETS_R].dbo.returnSeriesRecord")  (newline)
  (insert "(rsStrategyName, rsOrigin, rsCurrency, rsType, Description, rsAsOfDate, rsShortCode)") (newline)
  (insert "VALUES") (newline)
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



;;-------------------------------------------------------------------------------- python mode
;(add-hook 'python-mode-hook
;  #'(lambda ()
;      (define-key python-mode-map "\C-m" 'newline-and-indent)))
;(add-hook 'python-mode-hook
;          (lambda ()
;            (setq-default indent-tabs-mode t)
;            (setq-default tab-width 4)
;            (setq-default python-indent 4)))
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil) ;; spaces not tabs!
            (setq tab-width 4)
            (hs-minor-mode)
            (setq python-indent 4)))

;; -------------------------- new stuff
;; ;; Save point position between sessions.
;; (use-package saveplace)
;; (setq-default save-place t)
;; (setq save-place-file (expand-file-name "places" user-emacs-directory))

;; ;; Fix empty pasteboard error.
;; (setq save-interprogram-paste-before-kill nil)

;; ;; Auto refresh buffers when edits occur outside emacs
(global-auto-revert-mode 1)

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

;; transpose items in list
(defun my-transpose-sexps ()
  "If point is after certain chars transpose chunks around that.
   Otherwise transpose sexps."
  (interactive "*")
  (if (not (looking-back "[,]\\s-*" (point-at-bol)))
      (progn (transpose-sexps 1) (forward-sexp -1))
    (let ((beg (point)) end rhs lhs)
      (while (and (not (eobp))
                  (not (looking-at "\\s-*\\([,]\\|\\s)\\)")))
        (forward-sexp 1))
      (setq rhs (buffer-substring beg (point)))
      (delete-region beg (point))
      (re-search-backward "[,]\\s-*" nil t)
      (setq beg (point))
      (while (and (not (bobp))
                  (not (looking-back "\\([,]\\|\\s(\\)\\s-*" (point-at-bol))))
        (forward-sexp -1))
      (setq lhs (buffer-substring beg (point)))
      (delete-region beg (point))
      (insert rhs)
      (re-search-forward "[,]\\s-*" nil t)
      (save-excursion (insert lhs)))))

;; ------------------------------------------------------------------------------ Window Sizing
(defun window-hwiden (&optional arg)
  "Widen window"
  (interactive "p")
  (enlarge-window-horizontally 10))
(defun window-hshrink (&optional arg)
  "Shrink window"
  (interactive "p")
  (shrink-window-horizontally 10))

;; ------------------------------------------------------------- Buffer menu
(defun buffer-menu-sort-by-filename (&optional arg)
  (interactive "P")
  (Buffer-menu-sort 6))

;; for function keys
;; for function keys
(defun see-logbook1()      (interactive) (find-file "L:/MyDocs/history/logbook.org"))
(defun see-sql()           (interactive) (find-file "C:/MyMAQS/notebooks/sqlScripts.org"))
(defun see-matlab()        (interactive) (find-file "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK/vc/rs1/SSI.scratch.wt1/notebooks/matlabScripts.org"))
(defun see-dotBashRc()     (interactive) (find-file "L:/MyDocs/dot/dotBashrc"))
(defun see-dotEmacs()      (interactive) (find-file "L:/MyDocs/dot/dotEmacs.el"))
;;(defun nok900()          (interactive) (dired "/scpc:root@192.168.1.187:/home/user/MyDocs/aNotes/"))
(defun see-orglink-dired() (interactive) (org-open-at-point t)) ; (current-buffer)
(defun see-shell-output()  (interactive) (switch-to-buffer-other-window "*Shell Command Output*"))
(defun diredHome()         (interactive) (dired "L:/MyDocs/" nil))

;;-------------------------------------------------------------------------------- Dired
;(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
;;(defun w32-browser (doc) (w32-shell-execute 1 doc))
;;(eval-after-load "dired" '(define-key dired-mode-map [f3]
;;                (lambda ()
;;                  (interactive)
;;                  (w32-browser (dired-replace-in-string "/" "\\" (dired-replace-in-string "/cygdrive/C/" "C:\\" (dired-get-filename)))))))
(require 'dired-x)
(require 'wdired)

(defun dired-load-hook-addsettings ()
  (interactive)
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
  (setq dired-no-confirm '(revert-subdirs)))
(add-hook 'dired-load-hook 'dired-load-hook-addsettings)

(defun dired-mode-hook-addsettings ()
  (interactive)
  (dired-omit-mode 1)
  (setq dired-dwim-target t)
  (setq dired-listing-switches "-al")
  ;(setq dired-listing-switches "-alt")            
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
  (defalias 'dired-go-subdir-kbm (kbd "f C-x b RET C-x k RET")))
(add-hook 'dired-mode-hook 'dired-mode-hook-addsettings)

;; removing a hook
;;(remove-hook 'html-mode-hook 'xah-html-mode-keys)

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

;  (require 'dired-k)
;  (define-key dired-mode-map (kbd "K") 'dired-k)

(defun dired-ediff-git (&optional arg)
  (interactive)
  (setq ffn (dired-get-filename))
  (setq fn  (dired-get-filename "no-dir"))
  (setq-default fill-column     200)
  (ediff-revision fn)
  ;;(dired-rename-file ffn (concat "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/ARCHIVE/OLD/" fn))
  ;;dired-rename-file (file newname ok-if-already-exists)
)


(define-key dired-mode-map [right]           'dired-go-subdir-kbm)
(define-key dired-mode-map [left]            'dired-up) ;; dired-up-directory
(define-key dired-mode-map [M-up]            'dired-view-previous)  ; was dired-next-line
(define-key dired-mode-map [M-down]          'dired-view-next)      ; was dired-previous-line
(define-key dired-mode-map (kbd "<S-right>") 'dired-subtree-insert)
(define-key dired-mode-map (kbd "<S-left>")  'dired-subtree-remove)
(define-key dired-mode-map (kbd "<S-up>")    'dired-subtree-previous-sibling)
(define-key dired-mode-map (kbd "<S-down>")  'dired-subtree-next-sibling)
;'dired-view-current)     ; was dired-display-file
(define-key dired-mode-map (kbd "C-n")       'dired-next-line)
(define-key dired-mode-map (kbd "C-p")       'dired-previous-line)
(define-key dired-mode-map (kbd "e")         'dired-subtree-only-this-file)
(define-key dired-mode-map (kbd "c")         'dired-ediff-git)
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

;;--------------------------------------------------------------------- Misc
(defun instimestamp ()
   (interactive)
   (insert (format-time-string "%Y%m%d_%H:%M:%S")))
(defun indent-to-col ()
   (interactive)
   (indent-to-column 110))
;;--------------------------------------------------------------------- Key Bindings
(defun mk-new-buffer ()
  (interactive)
  (switch-to-buffer (generate-new-buffer (make-temp-name "foo")))
  (clipboard-yank))

   ;;(x-get-selection-value)

(defun my-revert-buffer ()
  (interactive)
  (revert-buffer nil t) ; don't ask to confirm
  (goto-char (point-max)))

;;; don't quit so easily
(global-unset-key "\C-x\C-c")                            ;; The following key-binding quits emacs -- we disable it too
(global-set-key "\C-x\C-c\C-v" 'save-buffers-kill-emacs) ;; But we establish a longer sequence that is harder to hit by accident:
;;(global-set-key [M-return]        'ffap)  ;; open file under cursor
(global-set-key [M-home]    'org-collapse)
;(global-set-key [M-up]            'other-window)
(global-set-key "\M-$"         'query-replace-regexp)
;(global-unset-key (kbd "C-q"))
(global-set-key "\C-q"         'quoted-insert)
;;(global-set-key "\C-Q"         'unfill-paragraph)
(global-set-key "\C-cq"        'quick-calc)
;(global-set-key "\C-cq"        'lines-to-cslist)
(global-set-key "\C-cr"        'auto-revert-tail-mode)
(global-set-key "\C-xp"         'my-transpose-sexps)

;(define-key global-map "\C-co" 'org-capture)


;; f4 for use by org-mode?

(global-set-key [f3]            'see-dotEmacs) ; my-openfile  'neotree-show
(global-set-key [f4]            'see-orglink-dired) ;;     'desktop-save)
(global-set-key [f5]            'ffap) ; bookmark-bmenu-list
(global-set-key [f6]            'ergoemacs-open-in-external-app)
(global-set-key [f7]            'go-to-column)
;;(global-set-key [f8]          'vigenere-decrypt-buffer)
(global-set-key [f9]            'kmacro-start-macro)
(global-set-key [f10]           'kmacro-end-and-call-macro) ; see-shell-output) ;ergoemacs-open-in-external-app
(global-set-key [f11]           'kmacro-end-macro)
(global-set-key [f12]           'hs-show-block)

(global-set-key [C-f1]          'mk-new-buffer)
(global-set-key [C-f4]          'org-transpose-table-at-point)
(global-set-key [C-f5]          '(lambda () (interactive) (dired "//lon06179/Logs" nil))) ; prod
(global-set-key [C-f6]          '(lambda () (interactive) (dired "//lon76179/" nil)))     ; dev //lon0302/dfs/DATA/MULTI_ASSET/MAQ?
(global-set-key [C-f7]          '(lambda () (interactive) (dired "C:/" nil)))
(global-set-key [C-f8]          '(lambda () (interactive) (dired "//lon0301/dfs/DATA/DTA/PERFDATA/Inv Risk/Stock Baskets/ForSharepoint/BasketPerfReport" nil)))
(global-set-key [C-f9]          '(lambda () (interactive) (dired "//lon0302/dfs/DATA/MULTI_ASSET/MAQS" nil)))
(global-set-key [C-f10]         '(lambda () (interactive) (dired "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK" nil)))
(global-set-key [C-f11]         '(lambda () (interactive) (dired "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK/vc/rs1" nil)))
(global-set-key [C-f12]         '(lambda () (interactive) (dired "L:/MyDocs" nil)))

(global-set-key [S-f1]          'my-revert-buffer) ; my-openfile  'neotree-show
(global-set-key [S-f2]          'my-list-buffers)
(global-set-key [S-f3]          'see-dotBashRc)
(global-set-key [S-f4]          'org-save-code-block)
(global-set-key [S-f5]          'my-revert-buffer)
(global-set-key [S-f6]          'bool-flip-do-flip)
(global-set-key [S-f7]          'show-hist)
(global-set-key [S-f8]          'dired-omit-mode)
(global-set-key [S-f9]          'insertLastSexp) ; (lambda () (interactive) (dired "C:/[pm][rya][qoadmp][parsd]*" nil)))
;;(global-set-key [S-f11]       'debug-function-on-entry)
(global-set-key [S-f12]         'hs-hide-block)

(global-set-key [M-f2]          'buffer-menu-sort-by-filename)
(global-set-key [M-f3]          '(lambda () (interactive) (dired "L:/MyDocs/history/bash/history_2019-*" nil)))
;;(global-set-key [M-f8]        'vigenere-encrypt-buffer)
(global-set-key [M-f9]          'ielm)  ;; open file under cursor ;;(global-set-key [M-f9]        'insertLastSexp);; insert result
(global-set-key [M-f10]         'see-shell-output) ;ergoemacs-open-in-external-app
(global-set-key [M-f11]         'set-debug-on)
(global-set-key [M-f12]         'set-debug-off)

;; M-kp ... conflicts with workspace navigation:
;; (global-set-key [S-M-kp-down] 'sgml-fold-subelement) 
;; (global-set-key [S-M-kp-end]  'sgml-fold-element)   ;  fold everything below current element
;; (global-set-key [S-M-kp-next] 'sgml-unfold-element)

(global-set-key "\C-c>"         'selective-display-level-incr)
(global-set-key "\C-c<"         'selective-display-level-decr)
(global-set-key [kp-left]       'selective-display-level-decr)
(global-set-key [kp-space]      'selective-display-level-zero)
(global-set-key [kp-right]      'selective-display-level-incr)
;(global-set-key [S-kp-6]       'selective-display-level-incr)
;(global-set-key [S-kp-4]       'selective-display-level-decr)
;(global-set-key [S-kp-5]       'selective-display-level-zero)
(global-set-key [kp-multiply]   'other-window)
;(global-set-key [S-kp-insert]  'yank)
;(global-set-key [C-kp-insert]  'kill-ring-save)
(global-set-key [S-insert]      'clipboard-yank)
(global-set-key [C-insert]      'clipboard-kill-ring-save)
(global-set-key "\C-c\C-y" '(lambda () (interactive) (popup-menu 'yank-menu)))

(global-set-key [(prior)]       'cycle-buffer-backward)
(global-set-key [C-up]          'cycle-buffer-backward)          ;(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key [(next)]        'cycle-buffer)
(global-set-key [C-down]        'cycle-buffer)        ;(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key [(end)]         'my-list-buffers)
(global-set-key [kp-subtract]   'kill-this-buffer-volatile)
(global-set-key [C-left]        'kill-this-buffer-volatile)
(global-set-key [S-wheel-up]    'previous-buffer)
(global-set-key [S-wheel-down]  'next-buffer) 

;(global-set-key "\C-!"         'shell-command) TBD

(global-set-key "\C-xc"         'filepath-on-clipboard)

;; magit-section-initial-visibility-alist ; ((stashes . hide))
;(setq magit-repository-directories
;      ("//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK/vc/rs1/SSI.scratch"
;       "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK/vc/rs3/SSI.scratch"))
; magit-list-repositories

;; (setq magit-repository-directories
;;         '(("~/.emacs.d"                . 0)
;;           ("~/.emacs.d/straight/repos" . 1)
;;           ("~/.emacs.d/lib/" . 1)
;;           ("//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK/vc/rs1/SSI.scratch" . 1)
;;           ("//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK/vc/rs3/SSI.scratch" . 1)))

(global-set-key  [C-tab]        'hs-toggle-hiding)

;; with a C-0 prefix argument.

;(global-set-key [C-up]          'windmove-up)          ;(global-set-key (kbd "C-c <up>")    'windmove-up)
;(global-set-key [C-down]        'windmove-down)        ;(global-set-key (kbd "C-c <down>")  'windmove-down)
;(global-set-key [C-left]        'windmove-left)        ;(global-set-key (kbd "C-c <left>")  'windmove-left)
;(global-set-key [C-right]       'windmove-right)       ;(global-set-key (kbd "C-c <right>") 'windmove-right)

;(global-set-key (kbd "<wheel-up>")   'previous-buffer)
;(global-set-key [S-wheel-up].
;(global-set-key [S-wheel-own].
;;-------------------------------------------------------------------------------
(dired "L:/" nil)
(setq dired-dwim-target t)
(setq org-list-allow-alphabetical t)

;(server-start)

