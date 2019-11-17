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
;; (replace-regexp  "in [0-9]+\.[0-9]+s)" "" nil (point-min) (point-max))
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

;; if Windows
;;  (when (string-equal system-type "windows-nt")
;;    (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" default-directory t t)))


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
                              ; give the attention back to the dired buffer

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
;;(setq dired-omit-files "^\\..+$")
