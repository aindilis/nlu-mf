(global-set-key "\C-cnme" 'nlu-mfs-switch-to-nlu-mf-edit-mode)

(define-derived-mode nlu-manual-formalization-edit-mode
 prolog-mode "NLU Manual Formalization Edit"
 "Major mode for editting formalized texts with NLU.
\\{prolog-mode-map}"
 (setq case-fold-search nil)
 (define-key nlu-manual-formalization-edit-mode-map "\C-cnfe" 'nlu-manual-formalization-mode)
 (define-key nlu-manual-formalization-edit-mode-map (kbd "TAB") 'formalog-complete-or-tab)

 (make-local-variable 'font-lock-defaults)
 (setq font-lock-defaults '(subl-font-lock-keywords nil nil))
 (re-font-lock))

(provide 'nlu-manual-formalization-edit-mode)
