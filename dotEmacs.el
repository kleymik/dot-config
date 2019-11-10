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
;; from 'better-defaults.el'
;; Allow clipboard from outside emacs
;; (setq x-select-enable-clipboard t
;;       x-select-enable-primary t
;;       save-interprogram-paste-before-kill t
;;       apropos-do-all t
;;       mouse-yank-at-point t)

;; ---------------------------------------------------- Eval
;; (global-set-key [remap eval-expression] 'pp-eval-expression)
;;  (insert (format "%s" load-path) )
;; Normally, this function truncates long output according to the value
;; of the variables `eval-expression-print-length' and
;; `eval-expression-print-level'.  With a prefix argument of zero,
;; however, there is no such truncation.  Such a prefix argument
;; lso causes integers to be printed in several additional formats
;; (octal, hexadecimal, and character).


