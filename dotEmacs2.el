;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(ivy-mode)

;; ;;; File name: ` ~/.emacs '
;; ;;--------------------------------------------------------------- Handy commands quick ref
;; ;; rot13-region  (C-c C-r)
;; ;; telnet host port     to open
;; ;; ^Q^] close           to close
;; 
;; ;; new 
;; ;; (xclip-mode 1) for emacs in terminal , export kill-yank
;; ;; C-c C-b associate ielm with buffer
;; ;; M-6 M-x Buffer-menu-sort = sort by file name
;; ;; (setq Buffer-menu-sort-column 6)
;; ;; C-x C-v = find alternate file   -> then grab filepath
;; ;; (setq header-line-format mode-line-format)
(setq uniquify-buffer-name-style 'forward)
(require 'uniquify)
;; proced       to view processes
;; find-dired   calls unix find
;; tail-mode    auto-revert-tail-mode (C-cr)
;; set-buffer-file-coding-system unix <--format

(setq default-truncate-lines t)
(setq inhibit-splash-screen t)
;; (setq use-file-dialog nil)
;; (setq use-dialog-box nil)
(fset 'yes-or-no-p 'y-or-n-p)
;; (tool-bar-mode -1)
(show-paren-mode 1)
(setq display-time-day-and-date t) (display-time)
(setq visible-bell t)
(setq line-number-mode t)
(setq column-number-mode t)
;; (setq global-hl-line-mode nil)
;; (setq-default frame-title-format "%b %p %p(%f)")
;; (setq-default frame-title-format "%f")
;; (setq-default line-spacing 0.06)
;; ;(global-mark-ring-max 50)
;; ;(setq set-mark-command-repeat-pop 1) - needs emacs version 22
;; ;(global-set-key [M-SPC] 'pop-global-mark)
;; ;(global-set-key "\C-." 'pop-global-mark)
;; ;(setq mark-ring-max 50)
(global-set-key [S-right] 'forward-word)
;; 										; M-x clone-indirect-buffer RET
;; ;;------------------------------------------------------------------------------ Eval
;; ;; (global-set-key [remap eval-expression] 'pp-eval-expression)
;; (defun eval-and-insert ()
;;   "Eval expression and insert value after the expression"
;;   (interactive)
;;   (eval-last-sexp 0)
;;     (eval-print-last-sexp 0))
;; ;;  (insert (format "%s" load-path) )
;; 
;; ;; Normally, this function truncates long output according to the value
;; ;; of the variables `eval-expression-print-length' and
;; ;; `eval-expression-print-level'.  With a prefix argument of zero,
;; ;; however, there is no such truncation.  Such a prefix argument
;; ;; lso causes integers to be printed in several additional formats
;; ;; (octal, hexadecimal, and character).
;; 
;; 
;; ;;------------------------------------------------------------------------------ Shell
(setq shell-file-name "bash")
(setq explicit-shell-file-name shell-file-name)
;; 
;; (defun shell-command-on-buffer (command)
;;   (interactive "sShell command on buffer: ")
;;   (shell-command-on-region (point-min) (point-max) command t))
;; 
;;
;;
;; trello
;;(require 'org-trello)
;;(add-hook 'org-mode-hook 'org-trello-mode)
;;(setq org-trello-consumer-key "fc03dd5cd067337dcb8d40c124e43a15"
;;      org-trello-access-token "c321f58405ebeff317a262cbbf52f99c89bea2cc322fff040f1c19bfa0b0e3e2")
;;org-trello-install-key-and-token
;;org-trello-update-board-metadata

;; ;;------------------------------------------------------------------------------ Line Spacing
;; (defun toggle-line-spacing ()
;;   "Toggle line spacing between no extra space to extra half line height."
;;   (interactive)
;;   (if (eq line-spacing nil)
;;       (setq-default line-spacing 0.05)	; add 0.5 height between lines
;;     (setq-default line-spacing nil)))	; no extra heigh between lines
;; ;;------------------------------------------------------------------------------- Colour
;; (set-background-color "black")
;; (set-background-color "darkgrey")
;; (set-background-color "bisque")
;; (set-background-color "bisque2")
;; (set-background-color "bisque3")
;; (set-face-background 'default "green3")
;; (set-face-background 'default "lightyellow2")
;; (set-face-background 'default "palevioletred")
;; (set-face-background 'default "lightblue")
;; (set-face-background 'default "paleturquoise")
;; (set-face-background 'default "lightblue")
;; 
;; 
;; ;;------------------------------------------------------------------------------- iedit Mode
;; ;; TBD (autoload 'iedit-mode "/home/uri03204/myDocs/ulib/emacs/iedit.elc" "Enter iedit mode" t)
;; 

;; ;;-------------------------------------------------------------------------------- Save Session as Desktop
;; ;;  use desktop-change-dir to /home/uri03204/.emacs.d/desktop to get it back
;; ;;    say "no" to save-desktop?
;; ;;    say "yes" to steal from PID?
;; ;;(desktop-save-mode 1)  ; desktop-revert desktop-change-dir
;; ;;(desktop-change-dir "/home/uri03204/myDocs/config")
;; (setq desktop-path "/home/kleyn/.emacs.d/desktop")
;; (desktop-save-mode 1)
;; (setq desktop-auto-save-timeout 300)
;; (org-babel-load-file "~/.emacs.d/configuration.org") 
;;(org-babel-load-file "~/.emacs.d/configuration.org")  ;;-------------------------------------------------------------------------------- History
;; (setq history-length 10000)
;; (savehist-mode 1)
;; ; (list-command-history)
;; ;;-------------------------------------------------------------------------------- Buffer List Menu
;; (global-set-key (kbd "C-x C-b") 'my-list-buffers)
;; (defun my-list-buffers (&optional files-only)
;;   "Display a list of existing buffers with file only"
;;   (interactive "P")
;;   (switch-to-buffer (list-buffers-noselect t)))
;; (setq Buffer-menu-name-width 40)
;; 

;; ;;------------------------------------------------------------------------ Kill buffer unconditionally
(defun kill-this-buffer-volatile (&optional arg)
     "Kill current buffer, even if it has been modified."
     (interactive)
     (set-buffer-modified-p nil)
     (kill-this-buffer))
;; 
;; ;;------------------------------------------------------------------------ Backup location
;;  /data/data/com.termux/files/home/storage/external/backups
(setq backup-directory-alist          `((".*" . , "/data/data/com.termux/files/home/storage/external/backups")))
(setq auto-save-file-name-transforms  `((".*" ,   "/data/data/com.termux/files/home/storage/external/backups" t)))
;; 
;; ;;------------------------------------------------------------------8- python mode
;; ;(add-hook 'python-mode-hook
;; ;  #'(lambda ()
;; ;      (define-key python-mode-map "\C-m" 'newline-and-indent)))
;; ;(add-hook 'python-mode-hook
;; ;		  (lambda ()
;; ;			(setq-default indent-tabs-mode t)
;; ;			(setq-default tab-width 4)
;; ;			(setq-default python-indent 4)))
;; (add-hook 'python-mode-hook
;; 		  (lambda ()
;; 			(setq indent-tabs-mode t)
;; 			(setq tab-width 4)
;; 			(setq python-indent 4)))
;; 
;; ;;------------------------------------------------------------------------ Org-Mode
;; ;(define-key global-map "\C-cl" 'org-store-link)
;; ;(define-key global-map "\C-ca" 'org-agenda)
;; (defalias 'make-org-tbl  (kbd "ESC x org-mode RET ESC < C-SPC ESC > C-c |"))
;; (setq org-default-notes-file "~/myDocs/logbook/notes.org")
;; (setq org-cycle-include-plain-lists t);; (setq org-startup-folded nil)
;; ;;(defalias 'see-logbooks  (kbd "C-x C-f ~/myDocs/logbook RET"))
;; (defun org-collapse()     (interactive) (org-shifttab 0))
;; 
;;(define-key org-mode-map (kbd "C-c d") 'org-demote-subtree)
;;(define-key org-mode-map (kbd "C-c p") 'org-promote-subtree)
;; ;; needs ox.el = org-exporter.el
;; ;;(require 'ox-confluence)
;; 
;; (require 'cl)
;; 
;; (defun org-transpose-table-at-point ()
;;   "Transpose orgmode table at point, eliminate hlines."
;;   (interactive)
;;   (let ((contents (apply #'mapcar* #'list ;; <== LOB magic imported here
;; 			 (remove-if-not 'listp ;; remove 'hline from list
;; 					(org-table-to-lisp)))) ;; signals error if not table
;; 	)
;;     (delete-region (org-table-begin) (org-table-end))
;;     (insert (mapconcat (lambda(x) (concat "| " (mapconcat 'identity x " | " ) "
;;   |\n" ))
;; 		       contents
;; 		       ""))
;;     (org-table-align)
;;     )
;;   )
;; 
;; ;; --------- org-mode
;; ;(org-babel-do-load-languages
;; ; 'org-babel-load-languages
;; ; '((python . t)))
;; 
;; ;;C-c c       (org-capture)          Call the command org-capture. Note that this key binding is global and not active by default: you need to install it. If you have templates defined see Capture templates, it will offer these templates for selection or use a new Org outline node as the default template. It will insert the template into the target file and switch to an indirect buffer narrowed to this new node. You may then insert the information you want.
;; ;;C-c C-c     (org-capture-finalize) Once you have finished entering information into the capture buffer, C-c C-c will return you to the window configuration before the capture process, so that you can resume your work without further distraction. When called with a prefix arg, finalize and then jump to the captured item.
;; ;;C-c C-w     (org-capture-refile)   Finalize the capture process by refiling (see Refile and copy) the note to a different place. Please realize that this is a normal refiling command that will be executed—so the cursor position at the moment you run this command is important. If you have inserted a tree with a parent and children, first move the cursor back to the parent. Any prefix argument given to this command will be passed on to the org-refile command.
;; ;;C-c C-k     (org-capture-kill)     Abort the capture process and return to the previous state.
;; ;;You can also call org-capture in a special way from the agenda, using the k c key combination. With this access, any timestamps inserted by the selected capture template will default to the cursor date in the agenda, rather than to the current date.
;; ;;To find the locations of the last stored capture, use org-capture with prefix commands:
;; ;;C-u C-c c                          Visit the target location of a capture template. You get to select the template in the usual way.
;; ;;C-u C-u C-c c                      Visit the last stored capture item in its buffer.
;; 
;; ;; You can also jump to the bookmark org-capture-last-stored, which
;; ;; will automatically be created unless you set org-capture-bookmark
;; ;; to nil.
;; ;; To insert the capture at point in an Org buffer, call org-capture
;; ;; with a C-0 prefix argument.
;; ;;
;; 
;; ;; -------------------------- new stuff
;; ;; ;; Save point position between sessions.
;; ;; (use-package saveplace)
;; ;; (setq-default save-place t)
;; ;; (setq save-place-file (expand-file-name "places" user-emacs-directory))
;; 
;; ;; ;; Fix empty pasteboard error.
;; ;; (setq save-interprogram-paste-before-kill nil)
;; 
;; ;; ;; Auto refresh buffers when edits occur outside emacs
;; ;; (global-auto-revert-mode 1)
;; 
;; ;; ;; Also auto refresh dired, but be quiet about it
;; ;; (setq global-auto-revert-non-file-buffers t)
;; ;; (setq auto-revert-verbose nil)
;; 
;; ;; ;; Show keystrokes in progress
;; ;; (setq echo-keystrokes 0.1)
;; (global-subword-mode 1)
;; ;; from 'better-defaults.el'
;; ;; Allow clipboard from outside emacs
;; ;; (setq x-select-enable-clipboard t
;; ;;       x-select-enable-primary t
;; ;;       save-interprogram-paste-before-kill t
;; ;;       apropos-do-all t
;; ;;       mouse-yank-at-point t)
;; 
;; ;; ------------------------------------------------------------------------------ Custom Variables
(setq tab-width 4)
;; ;;(setq tab-width 2)
;; (setq-default x-stretch-cursor t)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(blink-cursor-mode nil)
;;  '(display-time-mode t)
;;  '(setq show-paren-mode t)
;;  '(tool-bar-mode nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
;; 

;; 
;; ;; ------------------------------------------------------------- Buffer menu
;; (defun buffer-menu-sort-by-filename (&optional arg)
;;   (interactive "P")
;;   (Buffer-menu-sort 6))

;; ;;--------------------------------------------------------------  unjustify
;; (defun unjustify-paragraph ()
;;   (interactive)
;;   (let ((fill-column (point-max)))
;;     (fill-paragraph nil)))
;; 
;; ;;--------------------------------------------------------------  Enhanced Line Editing
;; (defun ed-copy-line (arg)
;;   "Copy lines to the kill ring"
;;   (interactive "p")
;;   (kill-ring-save (line-beginning-position)
;;                   (line-beginning-position (+ 1 arg)))
;;   (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
;; 
;; (defun ed-dup-line ()
;;   "Duplicate line under cursor"
;;   (interactive)
;;   (let ((start-column (current-column)))
;;     (save-excursion                     ;save-excursion restores mark
;;       (forward-line -1)
;;       (ed-copy-line 1)
;;       (forward-line 1)
;;       (move-to-column 0)
;;       (yank))
;;     (move-to-column start-column))
;;   (message "line is dup'ed"))
;; 
;; ;;---- option1 proto swap
;; (require 'regexp-opt)
;; (defun proto-swap (a b)
;;   (save-excursion
;;     (goto-char (point-min))
;;     (let ((re (regexp-opt (list a b))))
;;       (while (re-search-forward re nil t nil)
;;         (goto-char (match-beginning 0))
;;         ; (message (format "match %d" (point)))
;;         (when (looking-at (regexp-opt (list a)))
;;           ; (message "match a")
;;           (replace-match b))
;;         (when (looking-at (regexp-opt (list b)))
;;           ; (message "match b")
;;           (replace-match a))
;;         (goto-char (match-end 0))))))
;; (with-current-buffer (current-buffer)  (proto-swap "bar" "foo"))
;; 
;; ;;---- option2 parallel swap
;; (defun parallel-swap (plist &optional start end)
;;   (interactive
;;    `(,(loop with input = (read-from-minibuffer "Swap: ")
;;             with limit = (length input)
;;             for (item . index) = (read-from-string input 0)
;;                             then (read-from-string input index)
;;             collect (prin1-to-string item t) until (<= limit index))
;;      ,@(if (use-region-p) `(,(region-beginning) ,(region-end)))))
;;   (let* ((alist (list (cons (car plist) (cadr plist)) (cons (cadr plist) (car plist))))
;;        ;;(alist (loop for (key val . tail) on plist by #'cddr collect (cons key val)))
;;          (matcher (regexp-opt (mapcar #'car alist) 'words)))
;;     (save-excursion
;;       (goto-char (or start (point)))
;;       (while (re-search-forward matcher (or end (point-max)) t)
;;         (replace-match (cdr (assoc-string (match-string 0) alist)))))))
;; 


;; ;;------------------------------------------------------------------------------- Open With
;; (defalias 'my-open-file  (kbd "C-a C-s / C-b C-s : C-x C-x ESC w C-x C-f C-a C-y DEL C-k RET")
;; (add-hook 'find-file-hook  ;; ensure file in production can't be modified via emacs
;;   '(lambda ()
;;      (when (string= (substring (buffer-file-name) 0 4) "/dls")
;;        (message "Toggle to read-only for existing file")
;; 	   ; (read-only-mode ?)
;;        (toggle-read-only 1)))))
;; 
;; ;;This isn't nearly as drastic as what you're looking for, but it is possible to customize how Emacs calls ls in dired-mode.
;; ;;M-x customize-variable RET dired-listing-switches RET
;; ;; I used it to omit the group ID of files with the -o option, saving some horizontal screen real estate.
;; 
;; (defun ergoemacs-open-in-external-app ()
;;   "Open the current file or dired marked files in external app."
;;   (interactive)
;;   (let (doIt (myFileList
;; 	      (cond
;; 	       ((string-equal major-mode "dired-mode") (dired-get-marked-files))
;; 	       (t (list (buffer-file-name))) ) ) )
;;     (setq doIt (if (<= (length myFileList) 5)
;;                    t
;;                  (y-or-n-p "Open more than 5 files?") ) )
;;     (when doIt
;;       (cond
;;        ((string-equal system-type "window-nt")
;;         (mapc (lambda (fPath) (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" fPath t t)) ) myFileList))
;; 
;;        ((string-equal system-type "cygwin")
;;         (mapc (lambda (fPath) (message (concat "cygstart.exe " fPath))) myFileList)
;;         (mapc (lambda (fPath) (shell-command (concat "cygstart.exe " fPath))) myFileList))
;; 
;;        ((string-equal system-type "darwin")
;;         (mapc (lambda (fPath) (shell-command (format "open \"%s\"" fPath)) )  myFileList))
;; 
;;        ((string-equal system-type "gnu/linux")
;;         (mapc (lambda (fPath) (let ((process-connection-type nil)) (start-process "" nil "xdg-open" fPath)) ) myFileList))
;;        )
;;       )
;;     )
;; )
;; 
;; ;;------------------------------------------------------------------------------- ido Mode
;; ;; TBD
;; ;;(load-library "ido")
;; ;;(setq ido-enable-flex-matching t)
;; ;;(setq ido-everywhere t)
;; ;;(ido-mode 1)
;; ;;(ido-mode t)
;; ;;(windmove-default-keybindings 'shift)
;; ;;--------------------------------------------------------------------------------
;; ;; bing!
;; ;     "http://www.bing.com/search?q="
;; ;; (defun goog ()
;; ;;   (interactive)
;; ;;   (browse-url (concat "http://www.google.com/search?hl=en&q=" (if mark-active
;; ;; 									 (buffer-substring (region-beginning) (region-end))
;; ;; 								       (read-string "Goog: ")))))
;; 
;; ;;-------------------------------------------------------------------------------- white space
;; ;; (setq show-trailing-whitespace 1)
;; ;;(setq show-trailing-whitespace t) local buffer only
;; (defun tog-whitespace ()
;;   "Toggle show-trailing-whitespace between t and nil"
;;   (interactive)
;;   (setq show-trailing-whitespace (not show-trailing-whitespace)))
;; ;; C-c w        delete-trailing-whitespace
;; ;;GNU Emacs 22 or later has library whitespace.el, which lets you highlight whitespace in several ways. See WhiteSpace.
;; ;-------------------------------------------------------------------------------- ZeeTree
;; (add-to-list 'load-path "/home/kleyn/ulib/emacs/ztree-master")
;; ;(push (substitute-in-file-name "path-to-ztree-directory") load-path)
;; (require 'ztree-diff)
;; (require 'ztree-dir)
;; ;local binf to tab (ztree-perform-action)
;; ;Call the ztree-diff interactive function: M-x ztree-diff
;; 
;; ;;-------------------------------------------------------------------------------- Dired
(setq dired-use-ls-dired nil)
;; ;(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
;; ;;(defun w32-browser (doc) (w32-shell-execute 1 doc))
;; ;;(eval-after-load "dired" '(define-key dired-mode-map [f3]
;; ;;	(lambda () (interactive)
;; ;;	   (w32-browser (dired-replace-in-string "/" "\\" (dired-replace-in-string "/cygdrive/C/" "C:\\" (dired-get-filename)))))))
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
; 	    ;; Set dired-x buffer-local variables here.  For example:
 	    (dired-omit-mode 1)
; 	    (progn
 	      (setq dired-no-confirm '(revert-subdirs))
	      ;; (define-key dired-mode-map [right] 'dired-go-subdir-kbm)
	      (define-key dired-mode-map [right] 'dired-find-file)
 	      (define-key dired-mode-map [left]  'dired-up-directory)
	      (define-key dired-mode-map (kbd "t") 'dired-omit-mode)
              (define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
	      ;; (defalias 'dired-up (kbd "ESC < C-e C-r / NUL C-a ESC w C-x d C-a C-y C-k C-a ESC \\ C-e RET C-x b RET C-x k RET"))
	      ;; (defalias 'dired-go-subdir-kbm (kbd "f C-x b RET C-x k RET")))
	      )
	  )
;; ;Dired Listing Switches: Hide Value -ahl --time-style=long-iso
;; ;   State: SET for current session only.
(defun da() (interactive)   (find-file "/data/data/com.termux/files/home/org/access.org"))
(defun dd() (interactive)   (find-file "/data/data/com.termux/files/home/org/doAndDone.org"))
(defun db() (interactive)   (find-file "/data/data/com.termux/files/home/.bashrc"))
(defun de() (interactive)   (find-file "/data/data/com.termux/files/home/.emacs"))
(defun dk() (interactive)   (dired     "/scp:kleyn@62.233.104.49:/home/kleyn"))
(defun dz() (interactive)   (progn
			      (ztree-dir "/data/data/com.termux/files/home")
			      (split-window-right 50)))
(defun maxw() (interactive) (dired "/scp:kleyn@192.168.1.130:/home/kleyn"))
; (defun nokl900()           (interactive) (dired "/scpc:root@192.168.0.6:/home/user/MyDocs/aNotes/")) ;; barnes
; (defun turing()           (interactive) (dired "/scpc:kleyn@192.168.1.243:/home/kleyn"))
; (defun diamond()          (interactive) (dired "/scpc:uri03204@nx-staff.diamond.ac.uk:/home/uri03204/dot"))
; (defun see-shell-output() (interactive) (switch-to-buffer-other-window "*Shell Command Output*")); (defun diredHome ()       (interactive) (dired "/home/kleyn/" nil))
;; 
;; ;; when sorting in dired mode, move cursor back to top
;; (defadvice dired-sort-toggle-or-edit (after dired-sort-to-top activate)
;;    "Move to beginning of buffer (instead of keeping point on the current file)."
;;    (goto-char (point-min))
;;    (goto-line 3))
;; 
;; (setq load-path (append load-path '("/home/kleyn/ulib/emacs/dired-hacks"))) ;; (insert (format "%s" load-path))
;; (load-library "dired-subtree")
;; (setq dired-subtree-line-prefix "     ")
;; 
;; ;; (add-hook 'dired-mode-hook
;; ;;           (lambda ()
;; ;;             (setq-local ace-jump-search-filter
;; ;;                         (lambda ()
;; ;;                           (get-text-property (point) 'dired-filename)))))
;; 
;; (define-key dired-mode-map [right]           'dired-go-subdir-kbm)
;; (define-key dired-mode-map (kbd "<S-right>") 'dired-subtree-insert)
;; (define-key dired-mode-map (kbd "<S-left>")  'dired-subtree-remove)
;; (define-key dired-mode-map (kbd "<S-up>")    'dired-subtree-previous-sibling)
;; (define-key dired-mode-map (kbd "<S-down>")  'dired-subtree-next-sibling)
;; (define-key dired-mode-map (kbd "e")         'dired-subtree-only-this-file)
;; 
;; ; (define-key dired-mode-map (kbd "p")  'dired-subtree-only-this-file) ; tbd: pick-off the path of the given file into clipboard
;; ;; of emacs.  It is adviced to place bindings for these into a
;; ;; convenient prefix key map, for example `C-,`
;; 
;; ;; * `dired-subtree-remove`
;; ;; * `dired-subtree-revert`
;; ;; * `dired-subtree-narrow`
;; ;; * `dired-subtree-up`
;; ;; * `dired-subtree-down`
;; ;; * `dired-subtree-previous-sibling`
;; ;; * `dired-subtree-beginning`
;; ;; * `dired-subtree-end`
;; ;; * `dired-subtree-mark-subtree`
;; ;; * `dired-subtree-unmark-subtree`
;; ;; * `dired-subtree-only-this-file`
;; ;; * `dired-subtree-only-this-directory`
;; 
;; ;(add-hook 'ediff-mode-hook (lambda () (setq ediff-shell "C:/cygwin/bin/mintty.exe")))
;; ;(add-hook 'ediff-load-hook (lambda () (setq ediff-shell "C:/cygwin/bin/mintty.exe")))
;; 
;; ;;--------------------------------------------------------------------- Misc
(defun instimestamp () (interactive) (insert (format-time-string "%Y%m%d_%H:%M:%S")))
;; (defun indent-to-col ()
;;    (interactive)
;;    (indent-to-column 110))
;; 
;; ;;--------------------------------------------------------------------- Key Bindings
;; ;;; don't quit so easily
(global-unset-key "\C-x\C-c")                            ;; The following key-binding quits emacs -- we disable it too
(global-set-key "\C-x\C-c\C-v" 'save-buffers-kill-emacs) ;; But we establish a longer sequence that is harder to hit by accident:
(global-set-key "\C-xl"		'list-matching-lines)
(global-set-key "\C-xt"		'instimestamp)
(global-set-key "\C-z"		'undo)
(global-set-key "\C-cq"		'quick-calc)
(global-set-key [C-up]          'previous-buffer)
(global-set-key [C-down]  'next-buffer)
(global-set-key [C-left]  'kill-this-buffer-volatile) ;;kill-buffer)
(global-set-key [S-up]    'scroll-one-line-down)
(global-set-key [S-down]  'scroll-one-line-up)
(global-set-key [S-right] 'window-hwiden)
(global-set-key [S-left]  'window-hshrink)
;; ;;(global-set-key [M-return]		'ffap)  ;; open file under cursor
;; (global-set-key [M-home]	        'org-collapse)
;; ;(global-set-key [M-up]	        'other-window)
;; (global-set-key "\M-$"		'query-replace-regexp)
;; ;(global-unset-key (kbd "C-q"))
;; ;(global-set-key "\C-q"		'quoted-insert)
;; (global-set-key "\C-cb"		'ediff-buffers)
;; (global-set-key "\C-cd"		'ediff-directories)
;; (global-set-key "\C-ch"		'diredHome)
;; (global-set-key "\C-ci"		'indent-to-col)
;; (global-set-key "\C-cl"		'ed-dup-line)
;; (global-set-key "\C-cq"		'lines-to-cslist)
;; (global-set-key "\C-cr"		'auto-revert-tail-mode)
;; (global-set-key "\C-cs"		'parallel-swap)
;; (global-set-key "\C-ct"		'org-table-convert-region)
;; (global-set-key "\C-cw"		'delete-trailing-whitespace)
;; (global-set-key "\C-z"	   'replace-string)
;; (global-set-key [kp-divide]     'toggle-window-split)
;; ;(define-key global-map "\C-co" 'org-capture)
;; 
;; (global-set-key [f5]            'ffap) ; bookmark-bmenu-list
;; (global-set-key [f6]            'ergoemacs-open-in-external-app)
;; (global-set-key [f7]            'my-list-buffers)
;; (global-set-key [S-f7]          'buffer-menu-sort-by-filename)
;; (global-set-key [f8]            'ztree-dir)
;; (global-set-key [S-f8]          'dired-omit-mode)
;; 
;; (global-set-key [f9]		   'ielm)  ;; open file under cursor
;; (global-set-key [f10]           'see-shell-output) ;ergoemacs-open-in-external-app
;; (global-set-key [f11]           'hs-show-block)
;; (global-set-key [f12]           'hs-hide-block)
;; 
;; ;; ; M-kp ... conflicts with workspace navigation:
;; ;; (global-set-key [S-M-kp-down] 'sgml-fold-subelement) 
;; ;; (global-set-key [S-M-kp-end]  'sgml-fold-element)   ;  fold everything below current element
;; ;; (global-set-key [S-M-kp-next] 'sgml-unfold-element)
;; 
;; (global-set-key "\C-c>"	   'selective-display-level-incr)
;; (global-set-key "\C-c<"	   'selective-display-level-decr)
;; (global-set-key [S-kp-6]        'selective-display-level-incr)
;; (global-set-key [S-kp-4]        'selective-display-level-decr)
;; (global-set-key [S-kp-5]        'selective-display-level-zero)
;; ;(global-set-key [S-kp-insert]  'yank)
;; ;(global-set-key [C-kp-insert]  'kill-ring-save)
;; (global-set-key [S-insert]      'clipboard-yank)
;; (global-set-key [C-insert]      'clipboard-kill-ring-save)
;; 
;; (global-set-key [(prior)]       'cycle-buffer-backward)
;; (global-set-key [(next)]        'cycle-buffer)
;; (global-set-key [end]           'kill-this-buffer-volatile)
;; 
;; ;(global-set-key "\C-!"         'shell-command) TBD
;; (global-set-key "\C-xi"         'eval-print-last-sexp) ; ielm
;; (global-set-key (kbd "C-.")     'repeat)
;; 
;; ;; with a C-0 prefix argument.
;; (global-set-key [M--] 'text-scale-decrease)
;; (global-set-key [M-+] 'text-scale-increase)
;;
;; 
;; (global-set-key [C-up]          'windmove-up)          ;(global-set-key (kbd "C-c <up>")    'windmove-up)
;; (global-set-key [C-down]        'windmove-down)        ;(global-set-key (kbd "C-c <down>")  'windmove-down)
;; (global-set-key [C-left]        'windmove-left)        ;(global-set-key (kbd "C-c <left>")  'windmove-left)
;; (global-set-key [C-right]       'windmove-right)       ;(global-set-key (kbd "C-c <right>") 'windmove-right)
;; ;;-------------------------------------------------------------------------------
;; ;(desktop-change-dir "/home/uri03204/myDocs/config")'
;; 
;; (put 'narrow-to-region 'disabled nil)
;; 
;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(blink-cursor-mode nil)
;;  '(column-number-mode t)
;;  '(display-time-mode t)
;;  '(show-paren-mode t)
;;  '(tool-bar-mode nil))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:stipple nil :background "bisque" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 102 :width normal :foundry "bitstream" :family "Courier 10 Pitch")))))
;; 
;; 
;; ;;(server-start)
;; 
;; 
;(dired "/data/data/com.termux/files/home" nil)
;;(ztree-dir "/data/data/com.termux/files/home")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (ztree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
