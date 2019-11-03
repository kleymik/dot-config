;; --- redo
;; repeat last         command C-x z, then z again
;; repeat last complex command C-x ESC ESC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; see also  c:/Users/kleynmi/AppData/Roaming/.emacs
;;; File name: ` ~/.emacs '
;; indent-to-column
;; read-kbd-macro
;; (setq tab-stop-list '(60))
;; (server-start)
;;;
;;;

(ivy-mode 1)  ; M-i to insert and modify
(counsel-mode 1)

;;(define-key counsel-find-file-map (kbd "C-x C-f") 'counsel-find-file-fallback-command)
(define-key ivy-minibuffer-map (kbd "<up>") 'previous-line-or-history-element)
(define-key ivy-minibuffer-map (kbd "<down>") 'next-line-or-history-element)

;; previous-line-or-history-element

(defun counsel-find-file-fallback-command ()
  "Fallback to non-counsel version of current command."
  (interactive)
  (when (bound-and-true-p ivy-mode)
    (ivy-mode -1)
    (add-hook 'minibuffer-setup-hook
              'counsel-find-file-fallback-command--enable-ivy))
  (ivy-set-action
   (lambda (current-path)
     (let ((old-default-directory default-directory))
       (let ((i (length current-path)))
         (while (> i 0)
           (push (aref current-path (setq i (1- i))) unread-command-events)))
       (let ((default-directory "")) (call-interactively 'find-file))
       (setq default-directory old-default-directory))))
  (ivy-done))

(defun counsel-find-file-fallback-command--enable-ivy ()
  (remove-hook 'minibuffer-setup-hook
               'counsel-find-file-fallback-command--enable-ivy)
  (ivy-mode t))

;;Ivy-based interface to standard commands

;;(global-set-key (kbd "C-s") 'swiper-isearch)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "M-y") 'counsel-yank-pop)
;;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;(global-set-key (kbd "<f1> l") 'counsel-find-library)
;;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;;(global-set-key (kbd "<f2> j") 'counsel-set-variable)
;;(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
;;(global-set-key (kbd "C-c v") 'ivy-push-view)
;;(global-set-key (kbd "C-c V") 'ivy-pop-view)

;;Ivy-based interface to shell and system tools
;;(global-set-key (kbd "C-c c") 'counsel-compile)
;;(global-set-key (kbd "C-c g") 'counsel-git)
;;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;;(global-set-key (kbd "C-c L") 'counsel-git-log)
;;(global-set-key (kbd "C-c k") 'counsel-rg)
;;(global-set-key (kbd "C-c m") 'counsel-linux-app)
;;(global-set-key (kbd "C-c n") 'counsel-fzf)
;;(global-set-key (kbd "C-x l") 'counsel-locate)
;;(global-set-key (kbd "C-c J") 'counsel-file-jump)
;;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;;(global-set-key (kbd "C-c w") 'counsel-wmctrl)

;;Ivy-resume and other commands
;;ivy-resume resumes the last Ivy-based completion.
;;(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;(global-set-key (kbd "C-c b") 'counsel-bookmark)
;;(global-set-key (kbd "C-c d") 'counsel-descbinds)
;;(global-set-key (kbd "C-c g") 'counsel-git)
;;(global-set-key (kbd "C-c o") 'counsel-outline)
;;(global-set-key (kbd "C-c t") 'counsel-load-theme)
;;(global-set-key (kbd "C-c F") 'counsel-org-file)
;; alias al echo $eshell-command-aliases-list
;;; last command, command history
;;(global-set-key "\C-r" #'(lambda () (interactive) (eval (car command-history))))
;; rectangle-number-lines

(defun describe-last-function() 
  (interactive) 
  (describe-function last-command))

;;; dired copy path M-0 w

(setq max-lisp-eval-depth 1200) ; 800
;;; edif-revision
;;; vc-ediff
;;; indent-to-column
;;; read-kbd-macro
;;; (setq tab-stop-list '(60))
;;; (server-start)

;;(global-set-key "ESC-r" #'(lambda () (interactive)    (eval (car command-history))))
;; C-x M-: (mnemonic: like M-: but with the elisp expression already filled in for you). – phils Jan 27 '13 at 22:29
;; C-h w runs the command where-is (found in global-map), which is an
;; It is bound to C-h w, <help> w.
;; (where-is DEFINITION &optional INSERT)
;; Print message listing key sequences that invoke the command DEFINITION.
;; Argument is a command definition, usually a symbol with a function definition.
;; If INSERT (the prefix arg) is non-nil, insert the message in the buffer.

;;--------------------------------------------------------------- Handy commands quick ref
;; rot13-region  (C-c C-r)
;; telnet host port     to open
;; ^Q^] close           to close

;;
;; TBD dired-find-file-otherwindow open a cygwin link by inspecting it
;;
;;
;; flush-lines
;; C-h f describe-finction Info-goto-emacs-command-node
;; C-h F Info-goto-emacs-command-node
;; REPLACE REGEXP
;; replace unprintable ""
;; (replace-string "" "")
;; (replace-string "" "")
;; (replace-string "" "")
;; (replace-regexp  "in [0-9]+\.[0-9]+s)" "" nil (point-min) (point-max))
;; (replace-regexp "0\.999999([0-9]+)[$,]" "" nil (point-min) (point-max))
;; (replace-regexp "[ \t]+" " ")    ; REPLACE mutli-space with single-space
;; (replace-regexp "[ \t]+|" "_" )    % space -> _
;; (replace-regexp "'[ \t]+'" "|" )   % space between quotes ->
;; (goto-char (mark-marker))
;; (replace-regexp "A" "B" nil (if (and transient-mark-mode mark-active) (region-beginning)) (if (and transient-mark-mode mark-active) (region-end)) nil)
;; (replace-regexp "A" "B" nil (mark-marker) (point-max))
;; (replace-regexp "(line [0-9]+)" "" nil (point-min) (point-max)) ; clear (line 62)
;; (replace-regexp " [0-9][0-9]:[0-9][0-9]:[0-9][0-9]" "" nil (point-min) (point-max)) ; clear " HH:MM:SS" 
;; N.B. TBD drop last ","
;; (goto-char (mark-marker))
;; (goto-char (pop-global-mark))
;;  beginning-of-line
;; end-of-line
;;

(defun filepath-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(defun alignFoo (pat)
  (interactive "spattern?")
  (align-regexp (region-beginning) (region-end) (concat "\\(\\s-*\\)" pat) 1 1 nil)
  ;;(align-regexp beg end (concat "\\(\\s-*\\)" pat) 1 1 nil)
  )

(defun slashFwd () (interactive) (replace-string "\\"  "/" nil (line-beginning-position) (line-end-position)))
(defun slashBwd () (interactive) (replace-string  "/" "\\" nil (line-beginning-position) (line-end-position)))

;;(defalias 'flipslash     (kbd "C-SPC C-e C-SPC ESC < ESC w C-x b *scratch* RET C-e RET C-y C-r SPC C-f C-SPC C-r total SPC use C-x C-x C-w ESC \ 2*DEL / C-a ESC \ ESC x replace-string / RET \ RET C-a"))
;;
(defun hide-ctrl-M ()
  "Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))
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

;;-------------------------------------------------------------------- WEB PROXY
;(setq url-proxy-services '(("no_proxy" . "work\\.com")
;                           ("http" . "proxy.work.com:911")))
;; (setq url-proxy-services
;;    '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;      ("http" . "proxy.com:8080")
;;      ("https" . "proxy.com:8080")))

;; (setq url-http-proxy-basic-auth-storage
;;     (list (list "proxy.com:8080"
;;                 (cons "Input your LDAP UID !"
;;                       (base64-encode-string "LOGIN:PASSWORD")))))
;;   http:   http://SCHRODERS.COM\username:password@cfactive.london.schroders.com:8080
;;   https: https://SCHRODERS.COM\username:password@cfactive.london.schroders.com:8080

;;-------------------------------------------------------------------- DEBUG
;;Go to where your function is defined and type M-x edebug-defun,
;;This will work the next time the function is called. You can check the docs[1]or just type ?.

;; edebug-defun inside function definition  <- revert by re-evaluating the defun
;; debug-on-entry
;; (toggle-debug-on-error)
;; toggle-debug-on-quit
;; insert (debug)
(defun set-debug-on()   (interactive) (setq debug-on-error t))
(defun set-debug-off()  (interactive) (setq debug-on-error nil))
;;(setq debug-on-error t)
;;(setq debug-on-error t)
;;(setq debug-on-error nil)

;; S     Stop: don't execute any more of the program, but wait for more Edebug commands (edebug-stop). 
;; <SPC> Step: stop at the next stop point encountered (edebug-step-mode).
;; d     display stack
;; n     Next: stop at the next stop point encountered after an expression (edebug-next-mode). Also see edebug-forward-sexp in Jumping. 
;; t     Trace: pause (normally one second) at each Edebug stop point (edebug-trace-mode). 
;; T     Rapid trace: update the display at each stop point, but don't actually pause (edebug-Trace-fast-mode). 
;; g     Go: run until the next breakpoint (edebug-go-mode). See Breakpoints. 
;; c     Continue: pause one second at each breakpoint, and then continue (edebug-continue-mode). 
;; C     Rapid continue: move point to each breakpoint, but don't pause (edebug-Continue-fast-mode). 
;; G     Go non-stop: ignore breakpoints (edebug-Go-nonstop-mode). You can still stop the program by typing S, or any editing command.
;; ESC-: eval expr

;; Edebug can record an execution trace, storing it in a buffer named *edebug-trace*. This is a log of function calls and returns, showing the function names and their arguments and values. To enable trace recording, set edebug-trace to a non-nil value.
;; Making a trace buffer is not the same thing as using trace execution mode (see Edebug Execution Modes).
;; When trace recording is enabled, each function entry and exit adds lines to the trace buffer. A function entry record consists of ‘::::{’, followed by the function name and argument values. A function exit record consists of ‘::::}’, followed by the function name and result of the function.
;; The number of ‘:’s in an entry shows its recursion depth. You can use the braces in the trace buffer to find the matching beginning or end of function calls.
;; You can customize trace recording for function entry and exit by redefining the functions edebug-print-trace-before and edebug-print-trace-after.
;; — Macro: edebug-tracing string body...
;; This macro requests additional trace information around the execution of the body forms. The argument string specifies text to put in the trace buffer, after the ‘{’ or ‘}’. All the arguments are evaluated, and edebug-tracing returns the value of the last form in body.
;; — Function: edebug-trace format-string &rest format-args
;; This function inserts text in the trace buffer. It computes the text with (apply 'format format-string format-args). It also appends a newline to separate entries.
;; edebug-tracing and edebug-trace insert lines in the trace buffer whenever they are called, even if Edebug is not active. Adding text to the trace buffer also scrolls its window to show the last lines inserted.


;;-------------------- mouse and region
(setq mouse-drag-copy-region t)
(setq save-interprogram-paste-before-kill t)
;;(setq x-select-enable-primary t)
;;(setq select-enable-primary t)
;;(setq mouse-drag-copy-region t)

;; replace selected 
;;(defun replace-selected ()
;;  (interactive)
;;  (if (region-active-p)
;;      (replace-string "^\(.*[0-9]+?:[0-9]+\)" "[[https://www.lds.org/scriptures/search?lang=eng&query=\1&x=0&y=0][\1]]"
;;                      nil (region-beginning) (region-end))
;;     (replace-regexp "^\(.*[0-9]+?:[0-9]+\)" "[[https://www.lds.org/scriptures/search?lang=eng&query=\1&x=0&y=0][\1]]")
;;     ))

(defun swaperooni ()
  "Swap two tab-separated fields in each line in buffer."
  (interactive)
  (let ((re-1 "\\(.+\\)\t\\(.+\\)") (re-2 "\\2\t\\1"))
    (save-restriction
      (save-excursion
        (save-match-data
          (widen)
          (goto-char (point-min))
          (while (not (eobp))
            (let ((line (buffer-substring (point-at-bol) (point-at-eol))))
              (when (string-match re-1 line)
                (delete-region (point-at-bol) (point-at-eol))
                (insert (replace-regexp-in-string re-1 re-2 line)))
              (forward-line 1))))))))

(defun align-repeat (start end regexp)
  "Repeat alignment with respect to the given regular expression. Provide arg [[:space:]]+"
  (interactive "r\nsAlign regexp: ")
  ;; 1) First, the regular expression to align with. This expression begins with \(\s-*\), which stands for “an arbitrary number of spacing characters”.
  ;; 2) Then the parenthesis group to modify, 1 by default. This will align the expression by modifying the matching whitespaces in front of the regular expression, if any.
  ;;   The modification amounts to adding some number of whitespaces to that part of the regular expression.
  ;; 3) Additional number of whitespaces to add, the default 1 is fine. Set to 0 if no additional whitespace is needed.
  ;; 4) Finally, answer n/y, depending whether the alignment must be done once or repeated.
  (align-regexp start end (concat "\\(\\s-*\\)" regexp) 1 1 t))

;(require 'ido)
;(define-key ido-file-completion-map [up]   'ido-prev-work-directory)
;(define-key ido-file-completion-map [down] 'ido-next-work-directory)
;(setq ido-auto-merge-work-directories-length -1)
;(ido-mode nil)



(defun number-region (start end)
  (interactive "r")
  (let* ((count 1)
     (indent-region-function (lambda (start end)
                   (save-excursion
                     (setq end (copy-marker end))
                     (goto-char start)
                     (while (< (point) end)
                       (or (and (bolp) (eolp))
                       (insert (format ",%d " count))
                       (setq count (1+ count)))
                       (forward-line 1))
                     (move-marker end nil)))))
    (indent-region start end)))

;;; Stefan Monnier <foo at acm.org>. It is the opposite of 
;;; fill-paragraph. Takes a multi-line paragraph and makes 
;;; it into a single line of text.
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun insertLastSexp ()
    (interactive)
    (let ((value (eval (preceding-sexp))))
      ;;(kill-sexp -1)
      (insert (format " = %S" value))))

(defun insPyDb ()
  (interactive)
  (move-beginning-of-line nil)
                                        ;(newline-and-indent)
  ; (end-of-line)
  ; (open-line)
  (indent-according-to-mode)
  (insert "from util import dbg_toolbag as t; t.brk()")
  ; (insert "from see import see; import ipdb; ipdb.set_trace(context=15) # breakpoint()")
  (newline)
  (indent-according-to-mode)
  )


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
;; C-x r w w; C-x r j w                        Save windows config in register "w" ; jump back (where <register> is a single character) to jump back to it.
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

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("melpa-stable" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives   '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;;; ----------------------------------------------------------------------  diff
(setq ediff-shell "C:/cygwin64/bin/mintty.exe")
(if (file-directory-p "C:/cygwin64/bin")      (add-to-list 'exec-path "C:/cygwin64/bin"))
;;------------------------------------------------------------------------------- Switches
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

;;------------------------------------------------------------------------------ Colour
(set-background-color "bisque")
;(set-background-color "bisque2")
;(set-background-color "bisque3")
;(set-face-background 'default "green3")
;(set-face-background 'default "lightyellow2")
;(set-face-background 'default "palevioletred")
;(set-face-background 'default "lightblue")
;(set-face-background 'default "paleturquoise")
;(set-face-background 'default "lightblue")

;;------------------------------------------------------------------------------ Matlab Mode
;; (require 'matlab)
;; (setq matlab-indent-function t)
;; (setq matlab-shell-command "matlab")
;; ;(autoload 'matlab-mode "L:/myDocs/ulib/emacs/matlab.elc" "Enter Matlab mode." t)
;; ;(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons '("\\.m\\'" . octave-mode) auto-mode-alist))
;; ;;; User Level customizations:
;; ;;;   (setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
;; (defun my-matlab-mode-hook ()
;;   ; (matlab-mode-hilit)             ; Turn highlight on
;;   (setq font-lock-mode 1)
;;   (setq fill-column 276)        ; where auto-fill should wrap
;;   (setq-default fill-column     276)
;;   (setq matlab-indent-function t)    ; if you want function bodies indented
;;   (setq matlab-indent-level  4)         ; set matlab indentation
;;   (setq matlab-verify-on-save-flag nil)
;;   ; (set matlab-fill-code nil)  
;;   (setq indent-tabs-mode nil))
;; (add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
;; ;(remove-hook 'matlab-mode-hook 'my-matlab-mode-hook)

;;------------------------------------------------------------------------------ Diff Stuff
;; make patch files look like ediff
(require 'diffview)
;; (diffview-current)
;; scroll-all-mode < toggles
;; (defun mwheel-scroll-all-function-all (func &optional arg)
;;   (if (and scroll-all-mode arg)
;;       (save-selected-window
;;         (walk-windows
;;          (lambda (win)
;;            (select-window win)
;;            (condition-case nil
;;                (funcall func arg)
;;              (error nil)))))
;;     (funcall func arg)))
;(defun mwheel-scroll-all-scroll-up-all (&optional arg)  (mwheel-scroll-all-function-all 'scroll-up arg))

;(defun mwheel-scroll-all-scroll-down-all (&optional arg)  (mwheel-scroll-all-function-all 'scroll-down arg))

;;(setq mwheel-scroll-up-function 'mwheel-scroll-all-scroll-up-all)
;;(setq mwheel-scroll-down-function 'mwheel-scroll-all-scroll-down-all)

;;------------------------------------------------------------------------------ TFS Version Control
;; ;; 1. Place `tfs.el' in your `load-path'.
;; ;; 2. In your .emacs file:
;; (require 'tfs)
;; (setq tfs/tf-exe  "C:\\TF.exe")
;; (setq tfs/tf-exe  "C:\\Program Files \(x86\)\\TF.exe")
;; ;;(setq tfs/tf-exe  "C:\\Program\ Files\ \(x86\)\\Microsoft Visual Studio 12.0\\Common7\\IDE\\tf.exe")
;; ;;(setq tfs/tf-exe  "C:\\Program Files\ \(x86\)\\Microsoft\ Visual\ Studio\ 12.0\\Common7\\IDE\\TF.exe")
;; (setq tfs/login "/login:snd\\kleynmi,password")
;; ;; 3. also in your .emacs file:
;; ;;      set local or global key bindings for tfs commands.  like so:

;; (global-set-key  "\C-xvo" 'tfs/checkout)
;; (global-set-key  "\C-xvi" 'tfs/checkin)
;; (global-set-key  "\C-xvp" 'tfs/properties)
;; (global-set-key  "\C-xvg" 'tfs/get)
;; (global-set-key  "\C-xvh" 'tfs/history)
;; (global-set-key  "\C-xvu" 'tfs/undo)
;; (global-set-key  "\C-xvd" 'tfs/diff)
;; (global-set-key  "\C-xvs" 'tfs/status)
;; (global-set-key  "\C-xva" 'tfs/annotate)
;; (global-set-key  "\C-xvw" 'tfs/workitem)
;; (global-set-key  "\C-xv+" 'tfs/add)
;; (global-set-key  "\C-xv-" 'tfs/delete)
;; (global-set-key  "\C-xvc" 'tfs/changeset)
 
;; ----------------------------------------------------------------------------- DOS Mode
;;(autoload 'dos-mode "/home/uri03204/myDocs/ulib/emacs/dos.elc" "Enter DOS CMD mode." t)7

;; ----------------------------------------------------------------------------- OPEN with associated app
(defun w32-browser (doc)
  (message (concat "win2-browse: " doc))
  (w32-shell-execute "open" doc))
;; if Windows
;;  (when (string-equal system-type "windows-nt")
;;    (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" default-directory t t)))

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

;; I have this working. You need to be sure that python-shell-interpreter is set to an executable 
;; in your path rather than a precise path to the file 
;; ("ipython" rather than "c:/Users/me/stuff/python_stuff/ipython.exe")
;; Second, you need to tell pyvenv where to find your environments. 
;; For me, this is: (setenv "WORKON_HOME" "c:/Users/xxxxx/AppData/Local/Continuum/Anaconda3/envs")
;; you could also try the solution here which, if I remember correctly, can be used if the above solution doesn't work.
;; permalinkembed

;;------------------------------------------------------------------------------- Language Modes
(add-to-list 'auto-mode-alist '("\\.sas\\'"   . sas-mode)     )
(add-to-list 'auto-mode-alist '("\\.m\\'"     . octave-mode)   )
(add-to-list 'auto-mode-alist '("\\.cp\\'"    . c++-mode)     )

(add-to-list 'auto-mode-alist '("\\.proc\\'"  . sql-mode)     )
(add-to-list 'auto-mode-alist '("\\.sql\\'"   . sql-mode)     )

(add-to-list 'auto-mode-alist '("\\.make\\'"  . makefile-mode))

(add-to-list 'auto-mode-alist '("\\.org$"     . org-mode)     )
(add-to-list 'auto-mode-alist '("\\.csv$"     . org-mode)     )
(add-to-list 'auto-mode-alist '("\\.bat$"     . bat-mode)     )

(add-to-list 'auto-mode-alist '("\\.xml$"     . xml-mode)     )
(add-to-list 'auto-mode-alist '("\\.aspx$"    . xml-mode)     )
(add-to-list 'auto-mode-alist '("\\.master$"  . xml-mode)     )

(add-to-list 'auto-mode-alist '("\\.mocha\\'" . java-mode)    )
(add-to-list 'auto-mode-alist '("\\.java\\'"  . java-mode)    )
(add-to-list 'auto-mode-alist '("\\.js\\'"    . java-mode)    )
(add-to-list 'auto-mode-alist '("\\.jad\\'"   . java-mode)    )

(add-to-list 'auto-mode-alist '("\\.cs$"      . csharp-mode)  )

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

(setq org-file-apps '( ("\\.xlsx\\'"    . w2-browser)
                       ("\\.mm\\'"      . default)
                       ("\\.x?html?\\'" . default)
                       ("\\.pdf\\'"     . default)
                       (directory . emacs)
                       (auto-mode . emacs)
                       ))

;; You can configure how Org handles file links by customizing the
;; variable org-file-apps.

;; By default Org will check auto-mode-alist and open the file in
;; Emacs if it finds a match. If you would rather use the default
;; system application for .xls files you can add something like this
;; to your init file:

;; (add-to-list 'org-file-apps '("\\.xls\\'" . default))
;; You can also use prefix arguments to choose how to open a link on a case-by-case basis:

;; C-c C-o will open the link according to your configuration
;; C-u C-c C-o will visit the file in Emacs
;; C-u C-u C-c C-o will let the system decide how to open the file

;(add-to-list 'org-file-apps '("\\.xlsx\\'" . w2-browser))
;(auto-mode . emacs)
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

(define-key org-mode-map (kbd "C-c C->")  'org-demote-subtree)
(define-key org-mode-map (kbd "C-c C-<")  'org-promote-subtree)
(define-key org-mode-map (kbd "<S-up>")   'scroll-one-line-down)
(define-key org-mode-map (kbd "<S-down>") 'scroll-one-line-up)
(define-key org-mode-map (kbd "<C-up>")   'outline-up-heading)

(setq org-src-fontify-natively t)
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
   (when (equal (nth 0 info) "sql")    (write-region (cadr info) nil "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK/vc/rs1/SSI.scratch/notebooks/SQL_QUERY_CMD.sql")))
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
;; NO: (add-to-list 'load-path "L:/MyDocs/ulib/emacs/org-trello-master/")
;;its here: /home/kleynmi/l_C/cygwin64/home/kleynmi/.emacs.d/elpa/org-trello-0.8.1/org-trello.el:

;; (require 'org-trello)
;; (add-hook 'org-mode-hook 'org-trello-mode)
;; (setq org-trello-consumer-key "fc03dd5cd067337dcb8d40c124e43a15"
;;       org-trello-access-token "c321f58405ebeff317a262cbbf52f99c89bea2cc322fff040f1c19bfa0b0e3e2")

;;(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
;; (progn 
;;   (require 'org)
;;   (require 'org-trello-utils)
;;   (require 'org-trello-log)
;;   (require 'org-trello-hash)
;;   (require 'dash)
;;   (require 'org-trello))
;;---------------------------------------------------------------------Org-confluence

;; needs ox.el = org-exporter.el
;;(require 'ox-confluence)
;(require 'org-exp)
;(require 'org-export)
;(require 'org-confluence)

;;-------------------------------------------------------------------------------- eshell
;(eshell/alias "ff" "find-file $1")
;(eshell/alias "fw" "find-file-other-window $1")
;(eshell/alias "fr" "find-file-other-frame $1")
(setq eshell-prompt-function
      (lambda ()
        (concat (format-time-string "%Y%m%d|%H:%M" (current-time)) "|" (substring (pwd) (max -25 (- (length (pwd)))))
                (if (= (user-uid) 0) " # " " $ "))))
(setq eshell-save-history-on-exit t)
(setq eshell-hist-ignoredups t)

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

;; ------------------------------------------------------------------------------ Custom Variables
(setq default-truncate-lines t)
(setq tab-width 4) ;;(setq tab-width 2)
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
(defun scroll-one-line-up (&optional arg)
  "Scroll the selected window up (forward in the text) one line (or N lines)."
  (interactive "p")
  (scroll-up (or arg 1)))
(defun scroll-one-line-down (&optional arg)
  "Scroll the selected window down (backward in the text) one line (or N)."
  (interactive "p")
  (scroll-down (or arg 1)))

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

;; ------------------------------------------------------------------------------ Window Flip
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

;; ------------------------------------------------------------- Selective Display
(setq selective-display-lev 0)
(defun selective-display-level-incr (&optional arg)
    (interactive "P")
    (setq selective-display-lev (% (+ selective-display-lev 2) 16))
    (set-selective-display selective-display-lev))
(defun selective-display-level-decr (&optional arg)
    (interactive "P")
    (setq selective-display-lev (- selective-display-lev 2))
    (set-selective-display selective-display-lev))
(defun selective-display-level-zero (&optional arg)
    (interactive "P")
    (setq selective-display-lev 0)
    (set-selective-display selective-display-lev))

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
  (defalias 'dired-up            (kbd "^ C-x b RET C-x k RET"))  ;; deletes prvious dired
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

;; git-timemachine!!
(defun dired-vc-annotate (&optional arg)
  (interactive)
  (setq ffn (dired-get-filename))
  (message ffn)
  (setq fn  (dired-get-filename "no-dir"))
  (message fn)
  (dired-find-file-other-window)
  (setq-default fill-column  200)
  (vc-annotate fn nil)
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
(define-key dired-mode-map (kbd "H")         'dired-vc-annotate)
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

(global-set-key "\C-x\C-b" 'ibuffer)
;;; don't quit so easily
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "C-y") 'yank)
(global-unset-key "\C-x\C-c")                            ;; The following key-binding quits emacs -- we disable it too
(global-set-key "\C-x\C-c\C-v" 'save-buffers-kill-emacs) ;; But we establish a longer sequence that is harder to hit by accident:
;;(global-set-key [M-return]   'ffap)  ;; open file under cursor
(global-set-key [M-home]       'org-collapse)
;(global-set-key [M-up]        'other-window)
(global-set-key "\M-$"         'query-replace-regexp)
;(global-unset-key (kbd "C-q"))
(global-set-key "\C-q"         'quoted-insert)
;;(global-set-key "\C-Q"       'unfill-paragraph)
(global-set-key "\C-cb"        'ediff-buffers)
(global-set-key "\C-cd"        'ediff-directories)
(global-set-key "\C-ch"        'diredHome)
(global-set-key "\C-ci"        'indent-to-column)
(global-set-key "\C-cl"        'ed-dup-line)
(global-set-key "\C-cq"        'quick-calc)
;(global-set-key "\C-cq"       'lines-to-cslist)
(global-set-key "\C-cr"        'auto-revert-tail-mode)
(global-set-key "\C-cs"        'parallel-swap)
(global-set-key "\C-ct"        'org-table-convert-region)
(global-set-key "\C-cw"        'delete-trailing-whitespace)
(global-set-key "\C-xd"        'dired) ;  not counsel dired
;;(define-key counsel-mode-map [remap find-file] nil)
(global-set-key "\C-xl"        'list-matching-lines)
(global-set-key "\C-xt"        'instimestamp)
(global-set-key "\C-xp"        'my-transpose-sexps)
(global-set-key "\C-xh"        'vc-annotate)  ; walk through file history was mark whole buffer
;;(global-set-key "\C-xb"      'switch-to-buffer) ;  'magite-blame-addition)
(global-set-key "\C-z"         'undo)
(global-set-key [kp-divide]    'toggle-window-split)

;(define-key global-map "\C-co" 'org-capture)


;;(global-set-key "\C-r" #'(lambda () (interactive) (eval (car command-history))))
(global-set-key [M-f8] #'(lambda () (interactive) (eval (car command-history))))

;; f4 for use by org-mode?

(global-set-key [f1]            'see-logbook1)
(global-set-key [f2]            'see-matlab)
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
(global-set-key [C-f3]          'eshell) 
(global-set-key [C-f4]          'org-transpose-table-at-point)
(global-set-key [C-f5]          '(lambda () (interactive) (dired "//lon06179/Logs" nil))) ; prod
(global-set-key [C-f6]          '(lambda () (interactive) (dired "//lon76179/" nil)))     ; dev //lon0302/dfs/DATA/MULTI_ASSET/MAQ?
(global-set-key [C-f7]          '(lambda () (interactive) (dired "C:/MyData" nil)))
(global-set-key [C-f8]          '(lambda () (interactive) (dired "//lon0301/dfs/DATA/DTA/PERFDATA/Inv Risk/Stock Baskets" nil)))
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

(global-set-key "\C-xg"         'magit-status)
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
(global-set-key "\C-xd"         'dired)
(global-set-key "\C-xi"         'eval-print-last-sexp) ; ielm
(global-set-key (kbd "C-.")     'repeat)
(global-set-key (kbd "\C-c;")    'comment-or-uncomment-region)

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

;(global-set-key (kbd "<wheel-up>")   'previous-buffer)
;(global-set-key [S-wheel-up].
;(global-set-key [S-wheel-own].
;;-------------------------------------------------------------------------------
(dired "L:/" nil)
(setq dired-dwim-target t)
(setq org-list-allow-alphabetical t)

;(server-start)
; statr(

;;(setq dired-omit-files "^\\..+$")
