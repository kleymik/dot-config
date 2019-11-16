;; Print message listing key sequences that invoke the command DEFINITION.
;; Argument is a command definition, usually a symbol with a function definition.
;; If INSERT (the prefix arg) is non-nil, insert the message in the buffer.

;; TBD dired-find-file-otherwindow open a cygwin link by inspecting it

;;------------------------------------------------------------------------------- Org-Mode
;; (print (cadr info) (get-buffer "*scratch*"))
;; (write-region (cadr info) nil "L:/MyDocs/history/matlabCmds/org_cmd.m")
;; (write-region (cadr info) nil "C:/MyMAQS/grepHist/aaa_org_cmd.m"))
;; (save-restriction (org-mark-subtree) (rot13-region (point) (mark))))

;; find-dired   calls unix find
;; Dired Listing Switches: Hide Value -ahl --time-style=long-iso
;; of emacs.  It is adviced to place bindings for these into a
;; convenient prefix key map, for example `C-,`

;;--------------------------------------------------------------------- Key Bindings

(global-set-key [f4]            'see-orglink-dired) ;;     'desktop-save)
;;(define-key global-map "\C-co" 'org-capture)
;;-------------------------------------------------------------------------------

(setq dired-dwim-target t)
(setq org-list-allow-alphabetical t)


