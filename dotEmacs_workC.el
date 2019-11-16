;; C-x M-: (mnemonic: like M-: but with the elisp expression already filled in for you). – phils Jan 27 '13 at 22:29
;; C-h w runs the command where-is (found in global-map), which is an
;; It is bound to C-h w, <help> w.
;; (where-is DEFINITION &optional INSERT)
;; Print message listing key sequences that invoke the command DEFINITION.
;; Argument is a command definition, usually a symbol with a function definition.
;; If INSERT (the prefix arg) is non-nil, insert the message in the buffer.


;; TBD dired-find-file-otherwindow open a cygwin link by inspecting it

;;(defalias 'flipslash     (kbd "C-SPC C-e C-SPC ESC < ESC w C-x b *scratch* RET C-e RET C-y C-r SPC C-f C-SPC C-r total SPC use C-x C-x C-w ESC \ 2*DEL / C-a ESC \ ESC x replace-string / RET \ RET C-a"))
;;

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

;;------------------------------------------------------------------------------- Org-Mode
;;(defalias 'see-logbooks  (kbd "C-x C-f ~/myDocs/logbook RET"))
;; (print (cadr info) (get-buffer "*scratch*"))
;; (write-region (cadr info) nil "L:/MyDocs/history/matlabCmds/org_cmd.m")
;; (write-region (cadr info) nil "C:/MyMAQS/grepHist/aaa_org_cmd.m"))
;; (save-restriction (org-mark-subtree) (rot13-region (point) (mark))))

;;-------------------------------------------------------------------------------- Dired
;; removing a hook
;;(remove-hook 'html-mode-hook 'xah-html-mode-keys)

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


;;(eval-after-load "dired" '(define-key dired-mode-map [f3] (lambda () (interactive) (w32-browser (dired-replace-in-string "/" "\\" (dired-get-filename))))))

;; find-dired   calls unix find
;Dired Listing Switches: Hide Value -ahl --time-style=long-iso
;; of emacs.  It is adviced to place bindings for these into a
;; convenient prefix key map, for example `C-,`

;;--------------------------------------------------------------------- Key Bindings

(global-set-key  [C-tab]        'hs-toggle-hiding)

(global-set-key "\M-$"          'query-replace-regexp)
(global-set-key [(end)]         'my-list-buffers)
(global-set-key [(next)]        'cycle-buffer)
(global-set-key [(prior)]       'cycle-buffer-backward)
(global-set-key [C-down]        'cycle-buffer)        ;(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key [C-f10]         '(lambda () (interactive) (dired "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK" nil)))
(global-set-key [C-f11]         '(lambda () (interactive) (dired "//lon0302/dfs/DATA/MULTI_ASSET/MAQS/dataCollection/FI/LOCAL/USR/MK/vc/rs1" nil)))
(global-set-key [C-f12]         '(lambda () (interactive) (dired "L:/MyDocs" nil)))
(global-set-key [C-f1]          'mk-new-buffer)
(global-set-key [C-f4]          'org-transpose-table-at-point)
(global-set-key [C-f5]          '(lambda () (interactive) (dired "//lon06179/Logs" nil))) ; prod
(global-set-key [C-f6]          '(lambda () (interactive) (dired "//lon76179/" nil)))     ; dev //lon0302/dfs/DATA/MULTI_ASSET/MAQ?
(global-set-key [C-f7]          '(lambda () (interactive) (dired "C:/" nil)))
(global-set-key [C-f8]          '(lambda () (interactive) (dired "//lon0301/dfs/DATA/DTA/PERFDATA/Inv Risk/Stock Baskets/ForSharepoint/BasketPerfReport" nil)))
(global-set-key [C-f9]          '(lambda () (interactive) (dired "//lon0302/dfs/DATA/MULTI_ASSET/MAQS" nil)))
(global-set-key [C-insert]      'clipboard-kill-ring-save)
(global-set-key [C-left]        'kill-this-buffer-volatile)
(global-set-key [C-up]          'cycle-buffer-backward)          ;(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key [M-f10]         'see-shell-output) ;ergoemacs-open-in-external-app
(global-set-key [M-f11]         'set-debug-on)
(global-set-key [M-f12]         'set-debug-off)
(global-set-key [M-f2]          'buffer-menu-sort-by-filename)
(global-set-key [M-f3]          '(lambda () (interactive) (dired "L:/MyDocs/history/bash/history_2019-*" nil)))
(global-set-key [M-f9]          'ielm)  ;; open file under cursor ;;(global-set-key [M-f9]        'insertLastSexp);; insert result
(global-set-key [M-home]        'org-collapse)
(global-set-key [S-f12]         'hs-hide-block)

(global-set-key [f11]           'kmacro-end-macro)
(global-set-key [f3]            'see-dotEmacs) ; my-openfile  'neotree-show
(global-set-key [f4]            'see-orglink-dired) ;;     'desktop-save)
(global-set-key [f5]            'ffap) ; bookmark-bmenu-list
(global-set-key [f7]            'go-to-column)

;(define-key global-map "\C-co" 'org-capture)
;(global-set-key "\C-cq"        'lines-to-cslist)
;(global-set-key [C-down]        'windmove-down)        ;(global-set-key (kbd "C-c <down>")  'windmove-down)
;(global-set-key [C-kp-insert]  'kill-ring-save)
;(global-set-key [C-left]        'windmove-left)        ;(global-set-key (kbd "C-c <left>")  'windmove-left)
;(global-set-key [C-right]       'windmove-right)       ;(global-set-key (kbd "C-c <right>") 'windmove-right)
;(global-set-key [C-up]          'windmove-up)          ;(global-set-key (kbd "C-c <up>")    'windmove-up)
;(global-set-key [M-up]            'other-window)
;(global-set-key [S-kp-insert]  'yank)
;(global-set-key [S-wheel-own].
;(global-set-key [S-wheel-up].
                                        ;(global-unset-key (kbd "C-q"))
;; (global-set-key [S-M-kp-down] 'sgml-fold-subelement) 
;; (global-set-key [S-M-kp-end]  'sgml-fold-element)   ;  fold everything below current element
;; (global-set-key [S-M-kp-next] 'sgml-unfold-element)
;; M-kp ... conflicts with workspace navigation:
;; f4 for use by org-mode?
;; magit-section-initial-visibility-alist ; ((stashes . hide))
;; with a C-0 prefix argument.
;;(global-set-key "\C-Q"         'unfill-paragraph)
;;(global-set-key [M-f8]        'vigenere-encrypt-buffer)
;;(global-set-key [M-return]        'ffap)  ;; open file under cursor
;;(global-set-key [S-f11]       'debug-function-on-entry)
;;(global-set-key [f8]          'vigenere-decrypt-buffer)
;;; don't quit so easily
;;-------------------------------------------------------------------------------
(dired "L:/" nil)
(setq dired-dwim-target t)
(setq org-list-allow-alphabetical t)


