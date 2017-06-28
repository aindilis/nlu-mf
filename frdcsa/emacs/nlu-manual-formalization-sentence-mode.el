(define-derived-mode nlu-manual-formalization-sentence-mode
 prolog-mode "NLU MFS"
 "Major mode for manually formalizing texts with NLU.
\\{prolog-mode-map}"
 (setq case-fold-search nil)
 (define-key nlu-manual-formalization-sentence-mode-map "qq" 'nlu-mfs-quit)
 (define-key nlu-manual-formalization-sentence-mode-map "qk" 'nlu-mfs-kill-buffer)
 (define-key nlu-manual-formalization-sentence-mode-map "qm" 'nlu-mfs-switch-to-nlu-mf-mode)
 (define-key nlu-manual-formalization-sentence-mode-map "qe" 'nlu-mfs-switch-to-nlu-mf-edit-mode)
 (define-key nlu-manual-formalization-sentence-mode-map "\C-cnfe" 'nlu-mfs-switch-to-nlu-mf-mode)
 (define-key nlu-manual-formalization-sentence-mode-map "E" 'nlu-mfs-edit-nlu-manual-formalization-sentence-mode-source)
 (define-key nlu-manual-formalization-sentence-mode-map "Aa" 'nlu-mf-autoprocess)
 (define-key nlu-manual-formalization-sentence-mode-map "Ab" 'nlu-mf-stupidly-autoprocess-buffer)
 (define-key nlu-manual-formalization-sentence-mode-map "Ar" 'nlu-mf-stupidly-autoprocess-region)
 (define-key nlu-manual-formalization-sentence-mode-map "sn" 'nlu-mf-next-nonempty-sentence)
 (define-key nlu-manual-formalization-sentence-mode-map "sp" 'nlu-mf-previous-nonempty-sentence)
 (define-key nlu-manual-formalization-sentence-mode-map "ss" 'nlu-mf-search)
 (define-key nlu-manual-formalization-sentence-mode-map "sf" 'nlu-mf-search-formalization-attempt-filenames)
 (define-key nlu-manual-formalization-sentence-mode-map "sas" 'nlu-mfc-speak-entry-sentence)
 (define-key nlu-manual-formalization-sentence-mode-map "saa" 'nlu-mf-speak-assertions)
 (define-key nlu-manual-formalization-sentence-mode-map "g" 'nlu-mfs-goto-sentence-number)
 (define-key nlu-manual-formalization-sentence-mode-map "rr" 'nlu-mfs-reload-nlu-manual-formalization-sentence-mode)
 (define-key nlu-manual-formalization-sentence-mode-map "vr" 'nlu-mf-view-ring)
 (define-key nlu-manual-formalization-sentence-mode-map "d" 'nlu-mfs-delete-sentence)

 (define-key nlu-manual-formalization-sentence-mode-map (kbd "TAB") 'formalog-complete-or-tab)

 (make-local-variable 'font-lock-defaults)
 (make-local-variable 'nlu-mfs-info)
 (setq font-lock-defaults '(subl-font-lock-keywords nil nil))
 (re-font-lock))

(defun nlu-mfs-edit-nlu-manual-formalization-sentence-mode-source ()
 ""
 (interactive)
 (find-file-other-window "/var/lib/myfrdcsa/codebases/minor/nlu/frdcsa/emacs/nlu-manual-formalization-sentence-mode.el"))

(defun nlu-mfs-quit ()
 ""
 (interactive)
 (nlu-mfs-switch-to-nlu-mf-mode))

(defun nlu-mfs-buffer-for-text-file-containing-sentence ()
 ""
 (let* ((filename (get-entry "text-file-name" nlu-mfs-info))
	(buffer (find-buffer-visiting filename)))
  (if (non-nil buffer)
   buffer
   (progn
    (ffap filename)
    (find-buffer-visiting filename)))))

(defun nlu-mfs-kill-buffer ()
 ""
 (interactive)
 (let ((buffer (nlu-mfs-buffer-for-text-file-containing-sentence)))
  (kill-buffer)
  (switch-to-buffer buffer)))

(defun nlu-mfs-switch-to-nlu-mf-mode ()
 ""
 (interactive)
 (switch-to-buffer (find-buffer-visiting (get-entry "text-file-name" nlu-mfs-info))))

(defun nlu-mfs-switch-to-nlu-mf-edit-mode ()
 ""
 (interactive)
 (nlu-mfs-switch-to-nlu-mf-mode)
 (nlu-manual-formalization-edit-mode))

(defun nlu-mfs-get-sentence-id ()
 ""
 (interactive)
 (get-entry "sentence-id" (get-entry "sentence-info" nlu-mfs-info)))

(defun nlu-mfs-get-sentence-contents ()
 ""
 (interactive)
 (get-entry "sentence-quoted" (get-entry "sentence-info" nlu-mfs-info)))

(defun nlu-mfs-goto-sentence-number (&optional num)
 ""
 (interactive)
 (nlu-mfs-quit)
 (nlu-mf-goto-sentence-number num))

(defun nlu-mfs-reload-nlu-manual-formalization-sentence-mode ()
 ""
 (interactive)
 (let ((buffer (current-buffer)))
  (nlu-mfs-edit-nlu-manual-formalization-sentence-mode-source)
  (kmax-eval-buffer)
  (switch-to-buffer buffer)
  (nlu-manual-formalization-sentence-mode)))

(defun nlu-mfs-delete-sentence ()
 ""
 (let* ((sentence-id (nlu-mfs-get-sentence-id)))
  (nlu-mfs-quit)
  (nlu-mfs-goto-sentence-number sentence-id)
  (nlu-mf-delete-sentence-at-point)))

(provide 'nlu-manual-formalization-sentence-mode)
