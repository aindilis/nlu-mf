(global-set-key "\C-cnmm" 'nlu-mfs-switch-to-nlu-mf-mode)

;; see /var/lib/myfrdcsa/codebases/minor/nlu/systems/mf
;; see /var/lib/myfrdcsa/codebases/minor/nlu/nlu_manual_formalization_repository.pl

(global-set-key "\C-c\C-k\C-vmf" 'nlu-mf-setup)

(global-set-key "\C-cnfs" 'nlu-mf-search-formalization-attempt-filenames)
(global-set-key "\C-cnfd" 'nlu-mf-declare-desire-to-formalize-text-from-digilib)
(global-set-key "\C-cnft" 'nlu-mf-formalize-text-from-digilib)
(global-set-key "\C-cnfot" 'nlu-mf-open-formalized-text-repository)
(global-set-key "\C-cnfp" 'nlu-mf-prologify-text-in-region)
(global-set-key "\C-cnfr" 'nlu-mf-prologify-text-in-region-and-replace)
(global-set-key "\C-cnfu" 'nlu-mf-toggle-line-comment)
(global-set-key "\C-cnfaa" 'nlu-mf-autoprocess)
(global-set-key "\C-cnfab" 'nlu-mf-stupidly-autoprocess-buffer)
(global-set-key "\C-cnfar" 'nlu-mf-stupidly-autoprocess-region)
(global-set-key "\C-cnfw" 'nlu-mf-define-swipl-predicate)
(global-set-key "\C-cnfG" 'nlu-mf-sync-texts-pagenos)
(global-set-key "\C-cnflp" 'nlu-mf-load-pagenos)
(global-set-key "\C-cnfc" 'nlu-mf-clean-up-formalization-backup-files)
(global-set-key "\M-gG" 'nlu-mf-goto-page)

(defvar nlu-mf-default-context "Org::FRDCSA::NLU::MF")

(defvar nlu-mf-text-dir "/var/lib/myfrdcsa/codebases/minor/nlu/data-git/formalized-texts/texts")
(defvar nlu-mfs-mode-source-filename "/var/lib/myfrdcsa/codebases/minor/nlu/frdcsa/emacs/nlu-manual-formalization-sentence-mode.el")
(defvar nlu-mf-mode-source-filename "/var/lib/myfrdcsa/codebases/minor/nlu/frdcsa/emacs/nlu-manual-formalization-mode.el")
(defvar nlu-mf-edit-mode-source-filename "/var/lib/myfrdcsa/codebases/minor/nlu/frdcsa/emacs/nlu-manual-formalization-edit-mode.el")
(defvar nlu-mf-prolog-filename "/var/lib/myfrdcsa/codebases/minor/nlu/frdcsa/emacs/nlu-manual-formalization-prolog.el")

(define-derived-mode nlu-manual-formalization-mode
 prolog-mode "NLU Manual Formalization"
 "Major mode for manually formalizing texts with NLU.
\\{prolog-mode-map}"
 (setq case-fold-search nil)
 (define-key nlu-manual-formalization-mode-map "o" 'nlu-mf-reorient)
 (define-key nlu-manual-formalization-mode-map "vs" 'nlu-mf-view-sentence)
 (define-key nlu-manual-formalization-mode-map "vo" 'nlu-mf-view-original-text)
 (define-key nlu-manual-formalization-mode-map "e" 'nlu-manual-formalization-edit-mode)
 (define-key nlu-manual-formalization-mode-map "\C-cnfe" 'nlu-manual-formalization-edit-mode)
 (define-key nlu-manual-formalization-mode-map "E" 'nlu-mf-edit-nlu-manual-formalization-mode-source)
 (define-key nlu-manual-formalization-mode-map "p" 'nlu-mf-previous-line)
 (define-key nlu-manual-formalization-mode-map "n" 'nlu-mf-next-line)
 (define-key nlu-manual-formalization-mode-map "P" 'nlu-mf-previous-entry-wrapper)
 (define-key nlu-manual-formalization-mode-map "N" 'nlu-mf-next-entry-wrapper)
 (define-key nlu-manual-formalization-mode-map "u" 'nlu-mf-toggle-line-comment)
 (define-key nlu-manual-formalization-mode-map "U" 'nlu-mf-toggle-comment-entire-entry)
 (define-key nlu-manual-formalization-mode-map "in" 'nlu-mf-insert-name)
 (define-key nlu-manual-formalization-mode-map "aa" 'nlu-mf-assert-stack)
 (define-key nlu-manual-formalization-mode-map "ad" 'nlu-mf-delete-assertion-at-point)
 (define-key nlu-manual-formalization-mode-map "ae" 'nlu-mf-edit-assertion-at-point)
 (define-key nlu-manual-formalization-mode-map "ag" 'nlu-mf-get-assertion-contents)
 (define-key nlu-manual-formalization-mode-map "ap" 'nlu-mf-prologify-text-in-region-and-replace)
 (define-key nlu-manual-formalization-mode-map "arp" 'nlu-mf-push-assertions-onto-ring)
 (define-key nlu-manual-formalization-mode-map "Aa" 'nlu-mf-autoprocess)
 (define-key nlu-manual-formalization-mode-map "Ab" 'nlu-mf-stupidly-autoprocess-buffer)
 (define-key nlu-manual-formalization-mode-map "Ar" 'nlu-mf-stupidly-autoprocess-region)
 (define-key nlu-manual-formalization-mode-map "sN" 'nlu-mf-next-empty-entry)
 (define-key nlu-manual-formalization-mode-map "sn" 'nlu-mf-next-nonempty-entry)
 (define-key nlu-manual-formalization-mode-map "sP" 'nlu-mf-previous-empty-entry)
 (define-key nlu-manual-formalization-mode-map "sp" 'nlu-mf-previous-nonempty-entry)
 (define-key nlu-manual-formalization-mode-map "Sa" 'nlu-mf-save)
 (define-key nlu-manual-formalization-mode-map "Sg" 'nlu-mf-commit-to-git)
 (define-key nlu-manual-formalization-mode-map "sas" 'nlu-mfc-speak-entry-sentence)
 (define-key nlu-manual-formalization-mode-map "saa" 'nlu-mf-speak-entry-assertions)
 (define-key nlu-manual-formalization-mode-map "fqf" 'nlu-mf-list-all-formalizations-from-text)

 (define-key nlu-manual-formalization-mode-map "g" 'nlu-mf-goto-entry-number)
 (define-key nlu-manual-formalization-mode-map "G" 'nlu-mf-sync-texts-pagenos)
 (define-key nlu-manual-formalization-mode-map "rr" 'nlu-mf-reload-nlu-manual-formalization-mode)
 (define-key nlu-manual-formalization-mode-map "vr" 'nlu-mf-view-ring)
 (define-key nlu-manual-formalization-mode-map "d" 'nlu-mf-delete-entry-at-point)
 (define-key nlu-manual-formalization-mode-map "c" 'nlu-mf-clean-up-formalization-backup-files)

 (define-key nlu-manual-formalization-mode-map (kbd "TAB") 'formalog-complete-or-tab)

 (make-local-variable 'font-lock-defaults)
 (setq font-lock-defaults '(subl-font-lock-keywords nil nil))
 (re-font-lock))

(add-to-list 'auto-mode-alist '("\\.nlu.pl\\'" . nlu-manual-formalization-mode))

(defvar nlu-mf-default-indentation (kmax-x " " 17))
(defvar nlu-mf-all-formalizations nil)

;;;;;;;;;;;;;;;;;;;;; begin functions

(defun nlu-mf-setup ()
 ""
 (interactive)
 (nlu-mf-load-latest-text)
 (kmax-not-yet-implemented))

(defun nlu-mf-load-latest-text ()
 ""
 (interactive)
 (ffap (frdcsa-el-concat-dir (list nlu-mf-text-dir "<BOOKDIR>/formalizations/prolog/<BOOKNAMEPREFIX>.txt.nlu.pl"))))

(defun nlu-mf-save ()
 ""
 (interactive)
 (save-buffer))

(defun nlu-mf-commit-to-git ()
 ""
 (interactive)
 (kmax-not-yet-implemented))

(defun nlu-mf-insert-name ()
 ""
 (interactive)
 (insert (nlu-mf-get-text-name)))

(defun nlu-mf-reload-nlu-manual-formalization-mode ()
 ""
 (interactive)
 (let ((buffer (current-buffer))
       (buffer-extant (nlu-mf-edit-nlu-manual-formalization-mode-source)))
  (kmax-eval-buffer)
  (pop-to-buffer buffer)
  (nlu-manual-formalization-mode)
  (if (not buffer-extant)
   (kill-buffer (find-buffer-visiting nlu-mf-mode-source-filename)))))

(defun nlu-mf-edit-nlu-manual-formalization-mode-source (&optional arg)
 ""
 (interactive "P")
 (let* ((buffer (find-buffer-visiting nlu-mf-mode-source-filename))
	(buffer-extant (kmax-buffer-exists-p buffer)))
  (if arg
   (set-buffer buffer)
   (find-file-other-window nlu-mf-mode-source-filename))
  buffer-extant))

(defun nlu-mf-previous-entry-wrapper ()
 ""
 (interactive)
 (nlu-mf-previous-entry)
 (nlu-mf-sync-texts-pagenos t))

(defun nlu-mf-previous-entry ()
 ""
 (interactive)
 (re-search-backward "^sentence(")
 (re-search-backward "^sentence(")
 (beginning-of-line)
 (nlu-mf-next-line 3)
 (nlu-mf-indent))

(defun nlu-mf-next-line (&optional num)
 (interactive)
 (cl-dotimes (i (or num 1)) (nlu-mf-next-line-1)))

(defun nlu-mf-next-line-1 ()
 (interactive)
 (end-of-line)
 (forward-char)
 (nlu-mf-indent))

(defun nlu-mf-previous-line (&optional num)
 (interactive)
 (cl-dotimes (i (or num 1)) (nlu-mf-previous-line-1)))

(defun nlu-mf-previous-line-1 ()
 (interactive)
 (beginning-of-line)
 (backward-char)
 (beginning-of-line)
 (nlu-mf-indent))

(defun nlu-mf-next-entry-wrapper ()
 ""
 (interactive)
 (nlu-mf-next-entry)
 (nlu-mf-sync-texts-pagenos t))

(defun nlu-mf-next-entry ()
 ""
 (interactive)
 (if
  (or
   (nlu-mf-line-is-commented)
   (and
    (eq (point) (line-beginning-position))
    (save-excursion
     (string-match "^sentence(" (nlu-mf-get-line)))))
  (re-search-forward "^sentence("))
 (re-search-forward "^sentence(")
 (beginning-of-line)
 (nlu-mf-next-line 3)
 (nlu-mf-indent))

(defun nlu-mf-indent ()
 (interactive)
 (indent-according-to-mode))

(defun nlu-mf-beginning-of-entry ()
 ""
 (interactive)
 (kmax-not-yet-implemented))

(defun nlu-mf-end-of-entry ()
 ""
 (interactive)
 (nlu-mf-start-of-next-entry)
 (backward-char 2))

(defun nlu-mf-start-of-next-entry ()
 ""
 (interactive)
 (nlu-mf-reorient)
 (nlu-mf-next-entry)   
 (nlu-mf-beginning-of-entry))

(defun nlu-mf-put-entry-into-region ()
 ""
 (interactive)
 (nlu-mf-put-entry-into-region-2)
 ;; (save-excursion
 ;;  (progn
 ;;   (nlu-mf-reorient)
 ;;   (nlu-mf-beginning-of-entry)
 ;;   (set-mark (point))
 ;;   (nlu-mf-end-of-entry)))
 )

(defun nlu-mf-put-entry-into-region-2 ()
 (interactive)
 (kmax-fixme "work for first and last entry" nil 0.1)
 (re-search-backward (concat "^" nlu-mf-match-whitespace "*" "$" ))
 (nlu-mf-next-line 1)
 (set-mark (point))
 (re-search-forward (concat "^" nlu-mf-match-whitespace "*" "$" ))
 (backward-char 1))

(defun nlu-mf-put-entry-up-to-next-entry-into-region ()
 ""
 (interactive)
 (progn
  (nlu-mf-reorient)
  (nlu-mf-beginning-of-entry)
  (set-mark (point))
  (nlu-mf-start-of-next-entry)))

(defun nlu-mf-get-entry-contents ()
 ""
 (interactive)
 (save-excursion
  (nlu-mf-put-entry-into-region)
  (buffer-substring-no-properties (mark) (point))))

(defun nlu-mf-delete-entry-at-point (&optional arg)
 ""
 (interactive "P")
 (if (or (not arg) (yes-or-no-p "Delete this entry? ")) 
  (progn
   (nlu-mf-put-entry-into-region)
   (kill-region (mark) (point))
   (delete-blank-lines)
   (nlu-mf-next-entry))))

(defun nlu-mf-beginning-of-entry ()
 ""
 (interactive)
 (re-search-backward "^sentence(")
 (beginning-of-line)
 (nlu-mf-previous-line 1)
 (beginning-of-line))

(defun nlu-mf-reorient ()
 (interactive)
 ;;; FIXME: doesn't work for last entry
 (nlu-mf-next-entry)
 (nlu-mf-previous-entry))

(defun nlu-mf-assert-stack ()
 "Assert the freekbs2-stack as a formula into the current buffer
local context"
 (interactive) 
 (nlu-mf-reorient)
 (kmax-check-one-of-modes (list 'nlu-manual-formalization-mode 'nlu-manual-formalization-edit-mode))
 (let* ((formula freekbs2-stack))
  (if (freekbs2-formula-p formula)
   (if (yes-or-no-p (concat "Insert into file formula <" (prin1-to-string formula) ">?: "))
    (nlu-mf-insert-formula formula))
   (error "error: freekbs2-stack not a valid freekbs2 formula"))))

(defun nlu-mf-assert-ring ()
 (interactive)
 (kmax-not-yet-implemented))

(defun nlu-mf-insert-formula (formula)
 (let ((result (freekbs2-importexport-convert (list formula) "Interlingua" "Prolog")))
  (if (assoc "Success" result)
   (insert
    (concat (cdr (assoc "Output" result)) ",\n" nlu-mf-default-indentation " "))
   (error (concat "Couldn't convert to Prolog: " (prin1-to-string formula))))))

(defun nlu-mf-edit-assertion-at-point ()
 (interactive)
 (kmax-not-yet-implemented))

(defun nlu-mf-delete-assertion-at-point ()
 (interactive)
 (kill-whole-line)
 (nlu-mf-indent))

(defun nlu-mf-load-assertion-at-point-into-stack-importexport ()
 (interactive)
 (interactive "P")
 (if arg
  (freekbs2-load-assertion-into-stack)
  (let ((item freekbs2-stack))
   (setq freekbs2-stack (freekbs2-get-assertion-importexport t "Prolog"))
   (freekbs2-ring-add-result item))))

(defun nlu-mf-goto-line-type (type)
 (interactive)
 (if (eq type 'sentence)
  (progn
   (nlu-mf-reorient)
   (re-search-backward "^sentence("))))
;; (progn
;;  (let ((tmp-line "sentence(<BOOKIDENTIFIERCONSTANT>,sentenceIdFn(14),<BOOKTITLE>)."))
;;   (string-match "^sentence(\\(.*?\\),sentenceIdFn\(\\(.+?\\)\),'\\(.*?\\)'\)." tmp-line)
;;   (see (match-string 3 tmp-line))))

(defun nlu-get-sentence ()
 (interactive)
 (see (nlu-mf-parse-line-type 'sentence))
 ;; (cdr (assoc 'sent (nlu-mf-parse-line-type 'sentence)))
 )

(defun nlu-mf-parse-line-type (type)
 ""
 (interactive)
 (if (eq type 'sentence)
  (save-excursion
   (nlu-mf-goto-line-type 'sentence)
   (let ((line (nlu-mf-get-line)))
    (string-match "^sentence(\\(.*?\\),sentenceIdFn\(\\(.+?\\)\),'\\(.*?\\)'\)." line)
    (list
     (list 'text (match-string 1 line))
     (list 'id (match-string 2 line))
     (list 'sentence (match-string 3 line)))))))

(defun nlu-mf-get-text-name ()
  ""
 (interactive)
 (save-excursion
  (nlu-mf-goto-line-type 'sentence)
  (let ((line (nlu-mf-get-line)))
   (string-match "^sentence(\\(.*?\\),sentenceIdFn\(\\(.+?\\)\),'\\(.*?\\)'\)." line)
   (match-string 1 line))))

(defun nlu-mf-get-sentence-info ()
  ""
 (interactive)
 (save-excursion
  (nlu-mf-goto-line-type 'sentence)
  (let ((line (nlu-mf-get-line)))
   (string-match "^sentence(\\(.*?\\),sentenceIdFn\(\\(.+?\\)\),'\\(.*?\\)'\)." line)
   (list
    (list "text-name" (match-string 1 line))
    (list "sentence-id" (match-string 2 line))
    (list "sentence-quoted" (match-string 3 line))))))

(defun nlu-mf-get-sentence-id ()
 ""
 (interactive)
 (save-excursion
  (nlu-mf-goto-line-type 'sentence)
  (let ((line (nlu-mf-get-line)))
   (string-match "^sentence(\\(.*?\\),sentenceIdFn\(\\(.+?\\)\),'\\(.*?\\)'\)." line)
   (match-string 2 line))))

(defun nlu-mfc-get-sentence-contents ()
 ""
 (interactive)
 (if (kmax-mode-is-derived-from 'nlu-manual-formalization-mode)
  (nlu-mf-get-sentence-contents)
  (if (kmax-mode-is-derived-from 'nlu-manual-formalization-sentence-mode)
   (nlu-mfs-get-sentence-contents)
   (error "Don't know how to find the sentence"))))

(defun nlu-mf-get-sentence-contents ()
 ""
 (interactive)
 (save-excursion
  (nlu-mf-goto-line-type 'sentence)
  (let ((line (nlu-mf-get-line)))
   (string-match "^sentence(\\(.*?\\),sentenceIdFn\(\\(.+?\\)\),'\\(.*?\\)'\)." line)
   (match-string 3 line))))

(defun nlu-mf-has-assertions ()
 ""
 (interactive)
 (non-nil (nlu-mf-get-assertion-contents)))

(defun nlu-mf-get-assertion-contents ()
 ""
 (interactive)
 (let* ((string (save-excursion
		 (nlu-mf-reorient)
		 (set-mark (point))
		 (beginning-of-line)
		 (re-search-forward (concat "\s+" "_" "\n"))
		 (re-search-backward (concat "_" "\n"))
		 (buffer-substring-no-properties (point) (mark))))
	(assertions (mapcar #'nlu-mf-remove-trailing-comma (split-string (kmax-remove-bordering-whitespace-on-each-line string) "[\n\r]"))))
  (shift assertions)
  assertions))

(defun nlu-mf-remove-trailing-comma (text)
 (if (string-match ",$" text)
  (substring text 0 (- (length text) 1))
  text))

(defun kmax-remove-bordering-whitespace-on-each-line (text)
 (interactive)
 (join "\n" (mapcar #'gnus-simplify-whitespace (split-string text "[\n\r]"))))

(defun nlu-mf-view-ring ()
 ""
 (interactive)
 (freekbs2-view-ring))

(defun nlu-mf-search ()
 ""
 (interactive)
 (kmax-not-yet-implemented))

(defun nlu-mf-goto-entry-number (&optional num)
 ""
 (interactive)
 (kmax-try
  (progn
   (re-search-forward (concat "sentenceIdFn(" (or num (prin1-to-string (ecb-read-number "Goto which sentence number? "))) ")"))
   (nlu-mf-reorient))
  nil nil
  "Entry doesn't exist (either out of bounds, or removed)"))

(defun nlu-mfc-speak-entry-sentence ()
 ""
 (interactive)
 (all-speak-text (nlu-mfc-get-sentence-contents)))

(defun nlu-mf-speak-entry-assertions ()
 ""
 (interactive)
 (all-speak-text (join "\n" (mapcar (lambda (text) (concat "assertion: " text)) (nlu-mf-get-assertion-contents)))))

(defvar nlu-mf-match-anything-regex "[[:ascii:][:nonascii:]\n]")
(defvar nlu-mf-match-whitespace "[\\sW\t   ]")
(defvar nlu-mf-match-whitespace-and-returns "[\\sW\t\n\r   ]")
(defvar nlu-mf-match-assertions-start-for-hasformalization
 (concat "hasFormalization(" nlu-mf-match-anything-regex "+?" "," "sentenceFn([0-9]+)" "," nlu-mf-match-whitespace-and-returns "+"
   "\\\[" nlu-mf-match-whitespace-and-returns "+"))

(defun nlu-mf-next-empty-entry ()
 ""
 (interactive)
 (nlu-mf-reorient)
 (re-search-forward (concat nlu-mf-match-assertions-start-for-hasformalization "_"))
 (backward-char 1))

(defun nlu-mf-next-nonempty-entry ()
 ""
 (interactive)
 (nlu-mf-reorient)
 (re-search-forward (concat nlu-mf-match-assertions-start-for-hasformalization "[a-zA-Z0-9]"))
 (backward-char 1))

(defun nlu-mf-previous-empty-entry ()
 ""
 (interactive)
 (nlu-mf-reorient)
 (nlu-mf-previous-line 3)
 (re-search-backward (concat nlu-mf-match-assertions-start-for-hasformalization "_"))
 (nlu-mf-reorient))

(defun nlu-mf-previous-nonempty-entry ()
 ""
 (interactive)
 (nlu-mf-reorient)
 (nlu-mf-previous-line 3)
 (re-search-backward (concat nlu-mf-match-assertions-start-for-hasformalization "[a-zA-Z0-9]"))
 (nlu-mf-reorient))

(defun nlu-mf-convert-prolog-to-emacs-interlingua (prolog-formulae)
 (interactive)
 (freekbs2-importexport-convert
  (join-smart "" ".\n" "." (mapcar #'nlu-mf-remove-trailing-comma prolog-formulae))
  "Prolog"
  "Interlingua"))

(defun join-smart (beginner separator ender strings)
 (interactive)
 (concat beginner (join separator strings) ender))

(defun nlu-mf-push-assertions-onto-ring ()
 ""
 (interactive)
 (let ((nlu-mf-assertions-interlingua
	(nlu-mf-convert-prolog-to-emacs-interlingua
	 (nlu-mf-get-assertion-contents))))
  (mapcar #'freekbs2-ring-push (cdr (assoc "Output" nlu-mf-assertions-interlingua)))))

(defvar nlu-manual-formalization-sentence-mode-buffer-name-prefix  "*NLU-MF Sentence:")
(defvar nlu-manual-formalization-sentence-mode-buffer-name-postfix  "*")

(defun get-entry (key alist)
 (interactive)
 (cadr (assoc key alist)))

(defun nlu-mf-view-sentence ()
 ""
 (interactive)
 (let* ((text-file-name (buffer-file-name))
	(sentence-info (nlu-mf-get-sentence-info))
	(buffer-name
	 (concat nlu-manual-formalization-sentence-mode-buffer-name-prefix
	  (get-entry "sentence-id" sentence-info)
	  " "
	  (get-entry "text-name" sentence-info)
	  nlu-manual-formalization-sentence-mode-buffer-name-postfix)))
  (if (kmax-buffer-exists-p buffer-name)
   (switch-to-buffer buffer-name)
   (progn
    (kmax-util-message-buffer buffer-name (get-entry "sentence-quoted" sentence-info))
    (nlu-manual-formalization-sentence-mode)
    (make-local-variable 'nlu-mfs-info)
    (setq-local nlu-mfs-info
     (list
      (list "sentence-info" sentence-info)
      (list "text-file-name" text-file-name)))))))

(defun nlu-mf-view-original-text ()
 (interactive)
 (ffap (nlu-mf-get-original-text-filename)))

;; (defun nlu-mf-get-original-text-filename ()
;;  (interactive)
;;  (let* ((original-text-basename (split-string (eshell/basename (buffer-file-name)) ".nlu.pl"))
;; 	(dir-name "<BOOKDIRNAME>"))
;;   (shift original-text-basename)
;;   (concat nlu-mf-text-dir dir-name "/original-text/txt/" (car original-text-basename))))

(defun nlu-mf-formalog-query (variables query)
 ""
 (interactive)
 (if (flp-running-p)
  (cdr
   (nth 1
    (nth 0
     (formalog-query variables query))))
  (error "FLP not running")))

(defun nlu-mf-formalog-query-and-push-result-to-stack (variables query)
 ""
 (interactive)
 (freekbs2-load-onto-stack (nlu-mf-formalog-query variables query)))

(defun nlu-mf-list-all-formalizations-from-text-and-push-result-to-stack (variables query)
 ""
 (interactive)
 (freekbs2-load-onto-stack (nlu-mf-list-all-formalizations-from-text)))

(defun nlu-mf-list-all-formalizations-from-text-cached ()
 ""
 (unless nlu-mf-all-formalizations
  (setq nlu-mf-all-formalizations
   (nlu-mf-list-all-formalizations-from-text)))
 nlu-mf-all-formalizations)



(defun nlu-mf-choose-formalizations ()
 (interactive)
 (org-frdcsa-manager-dialog--subset-select
  (nlu-mf-get-all-assertions-from
   (nlu-mf-list-all-formalizations-from-text-cached))
  'concat))

(defun nlu-mf-list-all-formalizations-from-text ()
 ""
 (interactive)
 ;; (formalog-query (list 'var-X) (list "constant_complete" "has" 'var-X))
 (nlu-mf-formalog-query
  (list 'var-allformalizations)
  (list "list_all_formalizations_of_text" "<BOOKIDENTIFIERCONSTANT>" 'var-allformalizations)))

(defun nlu-mf-predicate-complete (pattern)
 (interactive)
 (nlu-mf-complete-hash pattern "predicate" nlu-mf-predicates))

(defun nlu-mf-constant-complete (pattern)
 (interactive)
 (nlu-mf-complete-hash pattern "constant" nlu-mf-constants))

(defun nlu-mf-complete-hash (pattern type hash)
 (let ((completions (kmax-hash-keys hash)))
  (completing-read (concat "Complete " type ": ") completions nil nil (try-completion pattern completions))))

(defun nlu-mf-build-completion-indexes ()
 ""
 (interactive)
 (let ((all-assertions (nlu-mf-list-all-formalizations-from-text)))
  (nlu-mf-obtain-all-predicates-and-constants
   (nlu-mf-get-all-assertions-from
    all-assertions))))

(defun nlu-mf-obtain-all-predicates-and-constants (all-assertions)
 ""
 (interactive)
 (setq nlu-mf-predicates nil)
 (setq nlu-mf-constants nil)
 (setq nlu-mf-strings nil)
 (setq nlu-mf-predicates (make-hash-table :test 'equal))
 (setq nlu-mf-constants (make-hash-table :test 'equal))
 (setq nlu-mf-strings (make-hash-table :test 'equal))
 (mapcar
  #'nlu-mf-get-predicates-constants-and-strings-from-assertion
  all-assertions))

(defun nlu-mf-get-all-assertions-from (all-assertions)
 (interactive)
 (mapcar
  (lambda (entry)
   (pop entry)
   (shift entry)
   (car entry))
  all-assertions))

(defun nlu-mf-get-predicates-constants-and-strings-from-assertion (assertion)
 (let ((predicate (pop assertion)))
  (if (not (gethash predicate nlu-mf-predicates))
   (puthash predicate t nlu-mf-predicates)))
 (mapcar
  (lambda (argument)
   (if (listp argument)
    (nlu-mf-get-predicates-constants-and-strings-from-assertion argument)
    (if (stringp argument)
     ;; (if (not (gethash argument nlu-mf-strings))
     ;;  (puthash argument t nlu-mf-strings))
     (if (not (gethash argument nlu-mf-constants))
      (puthash argument t nlu-mf-constants)))))
  assertion))

(defun nlu-mf-get-constants-from-assertion (assertion)
 (pop assertion)
 (mapcar (lambda (argument) (if (listp argument) (nlu-mf-get-predicates-from-assertion argument))) assertion))

;; (setq cycl-prolog-assertions
;;  "[['cyc-assert',[quote,['#$titleOfCW','<BOOKCYCCONSTANT>',\"<BOOKTITLE>\"]],'#$BaseKB'],
;; ['cyc-assert',[quote,['#$subtitleOfCW','<BOOKCYCCONSTANT>',\"<BOOKSUBTITLE>\"]],'#$BaseKB'],
;; ['cyc-assert',[quote,['#$subtitleOfCW','<BOOKCYCCONSTANT>',\"<BOOKSUBTITLE>\"]],'#$BaseKB']]")

;; (mapcar #'see (cdr (assoc "Output" (freekbs2-importexport-convert cycl-prolog-assertions "Prolog" "CycL String"))))


;; (nlu-mf-region-is-commented "%% <SUBJECT>
;; // sentence(<BOOKIDENTIFIERCONSTANT>,sentenceIdFn(18),'<SUBJECT>.').
;; // hasFormalization(<BOOKIDENTIFIERCONSTANT>,sentenceFn(18),
;; // 		 [
;; // 		  bookHasSubject(<BOOKIDENTIFIERCONSTANT>,<SUBJECTCONSTANT>),
;; // 		  _
;; // 		 ]).")

(defun nlu-mf-entire-entry-is-commented ()
 (interactive)
 (nlu-mf-region-is-commented (nlu-mf-get-entry-contents)))

(defun nlu-mf-text-is-commented (text)
 (interactive)
 (let ((items-list (mapcar #'list (split-string text "[\n\r]+"))))
  (shift items-list)
  (kmax-check-function-all-true-for-list
   (lambda (items)
    (or
     (string-match (concat "^" nlu-mf-match-whitespace "*" "%") (car items))
     (string-match (concat "^" nlu-mf-match-whitespace "*" "/") (car items))))
   (mapcar #'list items-list))))

(defun nlu-mf-toggle-comment-entire-entry ()
 ""
 (interactive)
 (if (nlu-mf-entire-entry-is-commented) 
  (nlu-mf-uncomment-entire-entry)
  (nlu-mf-comment-entire-entry)))

(defun nlu-mf-comment-entire-entry ()
 ""
 (interactive)
 (save-excursion
  (nlu-mf-put-entry-into-region)
  (nlu-mf-comment-region (point) (mark))))

(defun nlu-mf-overwrite-region (start end text)
 (interactive)
 (kill-region start end)
 (insert text))

(defun nlu-mf-comment-region (start end)
 (interactive)
 (let ((region-text (buffer-substring-no-properties start end)))
  (nlu-mf-overwrite-region start end
   (join "\n"
    (mapcar
     (lambda (text) (concat "%% " text))
     (split-string region-text "[\n\r]"))))))

(defun nlu-mf-uncomment-entire-entry ()
 ""
 (interactive)
 (save-excursion
  (nlu-mf-put-entry-into-region)
  (uncomment-region (mark) (point))))

(defun nlu-mf-kb-search (&optional search)
 ""
 (interactive)
 (let ((search (or search-arg (read-from-minibuffer "KB Search: "))))
  (shell-command
   (concat
    "grep -iE "
    (shell-quote-argument search)
    " /var/lib/myfrdcsa/codebases/internal/freekbs2/data-git/KBs/cyc/kb.pl"))))

(if nil
 (progn
  (nlu-mf-build-completion-indexes)
  (nlu-mf-constant-complete "the")
  (nlu-mf-predicate-complete "has")))

(defun nlu-mf-search-formalization-attempt-filenames (&optional arg)
 ""
 (interactive "P")
 (let ((extension-list (list "\\.nlu\\.pl$" "\\.subl$")))
  (nlu-mf-search-formalization-attempt-filenames-helper
   (if (not arg)
    "\\.nlu\\.pl$"
    (ido-completing-read
     "Choose extension: "
     extension-list nil nil)))))

;; (try-completion "" extension-list)

(defun nlu-mf-search-formalization-attempt-filenames-helper (extension)
 (interactive)
 (let* ((files (kmax-find-name-dired nlu-mf-text-dir extension))
	(nlu-mf-formalization-file-tmp
	 (ido-completing-read
	  "Please choose formalization file: "
	  files nil nil (try-completion "" files)))
	(tmp-tmp
	 (progn
	  (kmax-open-arbitrarily-large-file nlu-mf-formalization-file-tmp)
	  (setq-local nlu-mf-formalization-file nlu-mf-formalization-file-tmp)))
	(nlu-mf-original-file-tmp
	 (setq-local
	  nlu-mf-original-file
	  (nlu-mf-get-original-file-from-formalization-file
	   nlu-mf-formalization-file-tmp)))
	(nlu-mf-text-file-tmp
	 (setq-local
	  nlu-mf-text-file
	  (nlu-mf-get-text-file-from-formalization-file
	   nlu-mf-formalization-file-tmp))))
  (nlu-mf-document-formats)))

;; (defun nlu-mf-search-formalization-attempt-filenames-helper (extension)
;;  (interactive)
;;  (let* ((files (kmax-find-name-dired nlu-mf-text-dir extension))
;; 	(filename (ido-completing-read
;; 	  "Please choose formalization file: "
;; 	  files nil nil (try-completion "" files))))
;;   (nlu-mf-search-formalization-attempt-filenames-helper-2 filename)))

;; (defun nlu-mf-search-formalization-attempt-filenames-helper-2 (nlu-mf-formalization-file-tmp)
;;  (interactive)
;;  (let*
;;   ((tmptmp
;;     (nlu-mf-formalization-file-tmp filename)
;;     (progn
;;      (kmax-open-arbitrarily-large-file nlu-mf-formalization-file-tmp)
;;      (setq-local nlu-mf-formalization-file nlu-mf-formalization-file-tmp)))
;;    (nlu-mf-original-file-tmp
;;     (setq-local
;;      nlu-mf-original-file
;;      (nlu-mf-get-original-file-from-formalization-file
;;       nlu-mf-formalization-file-tmp)))
;;    (nlu-mf-text-file-tmp
;;     (setq-local
;;      nlu-mf-text-file
;;      (nlu-mf-get-text-file-from-formalization-file
;;       nlu-mf-formalization-file-tmp))))
;;   (nlu-mf-document-formats)))

(defun nlu-mf-get-original-file-from-formalization-file (nlu-mf-formalization-file)
 ""
 (interactive)
 (let* ((root-dir
	 (progn
	  (string-match "^\\(.*?\\)/formalizations/" nlu-mf-formalization-file)
	  (match-string 1 nlu-mf-formalization-file)))
	(original-texts
	 (frdcsa-el-concat-dir (list root-dir "original-text")))
	(nlu-mf-original-file
	 (nth 0 (kmax-grep-list-regexp
		 (kmax-find-name-dired
		  original-texts
		  "\\.pdf$") "\\.pdf$"))))
  nlu-mf-original-file))

(defun nlu-mf-get-text-file-from-formalization-file (nlu-mf-formalization-file)
 ""
 (interactive)
 (let* ((root-dir
	 (progn
	  (string-match "^\\(.*?\\)/formalizations/" nlu-mf-formalization-file)
	  (match-string 1 nlu-mf-formalization-file)))
	(original-texts
	 (frdcsa-el-concat-dir (list root-dir "original-text")))
	(nlu-mf-original-file
	 (nth 0 (kmax-grep-list-regexp
		 (kmax-find-name-dired
		  original-texts
		  "\\.txt$") "\\.txt$"))))
  nlu-mf-original-file))

(defun nlu-mf-document-formats ()
 ""
 (interactive)
 (kmax-open-arbitrarily-large-file nlu-mf-formalization-file)
 (delete-other-windows)
 (split-window-right)
 (other-window 1)
 (academician-open-file nlu-mf-original-file)
 (other-window 1)
 ;; now extract out
 (nlu-mf-load-pagenos))

(defun nlu-mf-load-pagenos ()
 ""
 (interactive)
 (if (not (boundp 'nlu-mf-pagenos))
  (let* ((command
	  (concat
	   "/var/lib/myfrdcsa/codebases/internal/clear/scripts/extract-page-correspondences.pl -f "
	   (shell-quote-argument  nlu-mf-text-file)))
	 (result
	  (progn
	   (message "Started Loading PageNos.")
	   (read
	    (shell-command-to-string
	     command)))))
   (see result)
   (setq-local nlu-mf-pagenos result)
   (message "Finished Loading PageNos."))))

(defun nlu-mf-formalize-text ()
 ""
 (interactive)
 (let ((digilib-book (digilib-process-incoming-book-into-digilib)))
  (nlu-mf-formalize-text-from-digilib digilib-book)))

(defun nlu-mf-formalize-text-from-digilib (&optional digilib-book-arg)
 ""
 (interactive)
 (let ((digilib-book
	(or
	 digilib-book-arg
	 (digilib-get-book-from-collection-book-dir))))
  (nlu-mf-cross-reference-text-from-digilib digilib-book)))

;; (digilib-ensure-text-dir "/var/lib/myfrdcsa/codebases/internal/digilib/data/collections/special/books/artificial-general-intelligence--goertzel-pennachin/txt/")

(defun nlu-mf-get-book-title-from-book-dir (book-dir)
 (interactive)
 (string-match "^\\(.+\\)--" book-dir)
 (concat (nlu-mf-prologify (replace-regexp-in-string "-" " " (match-string 1 book-dir))) "_TheBook"))

(defun nlu-mf-cross-reference-text-from-digilib (book-dir)
 ""
 (interactive)
 (see book-dir)
 (let* ((book-origin-dir (frdcsa-el-concat-dir (list digilib-collection-books-dir book-dir)))
	(book-origin-txt-dir (frdcsa-el-concat-dir (list book-origin-dir "txt")))
	(book-origin-pdf-dir (frdcsa-el-concat-dir (list book-origin-dir "pdf")))
	(book-incoming-dir (frdcsa-el-concat-dir (list nlu-mf-text-dir book-dir)))
	(book-incoming-original-dir (frdcsa-el-concat-dir (list book-incoming-dir "original-text")))
	(book-incoming-original-txt-dir (frdcsa-el-concat-dir (list book-incoming-original-dir "txt")))
	(book-incoming-original-pdf-dir (frdcsa-el-concat-dir (list book-incoming-original-dir "pdf")))
	(book-prolog-dir (frdcsa-el-concat-dir (list book-incoming-dir "formalizations" "prolog")))
	(book-title (nlu-mf-get-book-title-from-book-dir book-dir)))
  (kmax-mkdir-p book-incoming-original-dir)
  (kmax-mkdir-p (frdcsa-el-concat-dir (list book-incoming-dir "formalizations" "subl")))
  (kmax-mkdir-p (frdcsa-el-concat-dir (list book-incoming-dir "formalizations" "kbs2")))
  (kmax-mkdir-p (frdcsa-el-concat-dir (list book-incoming-dir "formalizations" "prolog")))
  (digilib-ensure-text-dir book-origin-txt-dir)
  (let ((command-list nil))
   (if (not (file-directory-p book-incoming-original-txt-dir))
    (push (concat "ln -s " (shell-quote-argument book-origin-txt-dir) " "
	   (shell-quote-argument book-incoming-original-txt-dir)) command-list))
   (if (not (file-directory-p book-incoming-original-pdf-dir))
    (push (concat "ln -s " (shell-quote-argument book-origin-pdf-dir) " "
	   (shell-quote-argument book-incoming-original-pdf-dir)) command-list))
   (manager-approve-commands
    (append
     command-list
     (mapcar 
      (lambda (file)
       (concat "cd "
	(shell-quote-argument book-incoming-original-txt-dir)
	" && nlu-mf-prepare-text-for-nlu-manual-formalization.pl -c "
	(shell-quote-argument book-title) " "
	(shell-quote-argument file)))
      (kmax-directory-files-no-hidden book-origin-txt-dir))
     (list
      (concat "mv "
       (frdcsa-el-concat-dir (list book-origin-txt-dir "*.nlu.pl"))
       " " (shell-quote-argument book-prolog-dir))))))
  (nlu-mf-search-formalization-attempt-filenames)))

(defun nlu-mf-prologify (text)
 (interactive)
 (let* ((tokens (split-string text " ")))
  (join "" (append (list (nlu-mf-clean-token (downcase (car tokens))))
		 (mapcar #'nlu-mf-clean-token (mapcar #'nlu-mf-to-camelcase (cdr tokens)))))))

(defun nlu-mf-prologify-text-in-region (start end)
 (interactive "r")
 (nlu-mf-prologify (buffer-substring-no-properties start end)))

(defun nlu-mf-prologify-text-in-region-and-replace (start end)
 (interactive "r")
 (let ((prologified-text (nlu-mf-prologify-text-in-region start end)))
  (kmax-insert-over-region start end prologified-text)))

(defun nlu-mf-to-camelcase (text)
 (capitalize text))

(defun nlu-mf-clean-token (token)
 (replace-regexp-in-string "[^a-zA-Z0-9]+" "_" token))

(defun nlu-mf-toggle-line-comment ()
 ""
 (interactive)
 (if (nlu-mf-line-is-commented)
  (nlu-mf-uncomment-line)
  (nlu-mf-comment-line)))

(defun nlu-mf-get-line ()
 (interactive)
 (kmax-get-line))

(defun nlu-mf-line-is-commented ()
 ""
 (interactive)
 (non-nil (string-match "^%% " (nlu-mf-get-line))))

(defun nlu-mf-uncomment-line ()
 ""
 (interactive)
 (save-excursion
  (move-beginning-of-line nil)
  (set-mark (point))
  (move-end-of-line nil)
  (uncomment-region (mark) (point))))

(defun nlu-mf-comment-line ()
 ""
 (interactive)
 (save-excursion
  (move-end-of-line nil)
  (set-mark (point))
  (move-beginning-of-line nil)
  (nlu-mf-comment-region (point) (mark))))

(defvar nlu-mf-autoprocess-mapping
 '(("<BOOKNAME>" . (("<BOOKIDENTIFIERCONSTANT>" . "book")))
   ("Andy" . (("andrewDougherty" . "self")))
   ("Andrew" . (("andrewDougherty" . "self")))
   ))

(setq nlu-mf-autoprocess-mapping
 '(("<BOOKNAME>" . (("<BOOKIDENTIFIERCONSTANT>" . "book")))
   ("Andy" . (("andrewDougherty" . "self")))
   ("Andrew" . (("andrewDougherty" . "self")))
   ))

(defun nlu-mf-autoprocess (start end)
 (interactive "r")
 (let* ((text-in-region (buffer-substring-no-properties start end)))
  ;; basically what we want to do here is to have it map objects like
  ;; "<BOOKTITLE>" to the Prolog/CycL/KBS2, etc:
  ;; i.e. <BOOKIDENTIFIERCONSTANT>
  (let ((lookup (assoc text-in-region nlu-mf-autoprocess-mapping )))
   (see (completing-read "Please choose the formalization: " (cdr lookup))))))

(defun nlu-mf-stupidly-autoprocess-buffer ()
 (interactive)
 (let ((autoprocessed (nlu-mf-stupidly-autoprocess-text (kmax-buffer-contents))))
  (switch-to-buffer (get-buffer-create "*NLU Manual Formalization Prolog*"))
  (insert autoprocessed)))

(defun nlu-mf-stupidly-autoprocess-region (start end)
 (interactive "r")
 (let ((autoprocessed (nlu-mf-stupidly-autoprocess-text (buffer-substring-no-properties start end))))
  (kill-region start end)
  (insert autoprocessed)))

(defun nlu-mf-stupidly-autoprocess-text (text)
 (setq nlu-mf-text text)
 (mapcar
  (lambda (entry)
   (setq nlu-mf-text (replace-regexp-in-string (concat "\\b" (car entry) "\\b") (caadr entry) nlu-mf-text t)))
  nlu-mf-autoprocess-mapping)
 nlu-mf-text)

(defun nlu-mf-define-swipl-predicate ()
 ""
 (interactive)
 (run-in-shell (concat "swipl -g 'help(" (thing-at-point 'symbol) ").'") "*SWILI Help*"))

(defun nlu-mf-open-formalized-text-repository ()
 ""
 (interactive)
 (ffap nlu-mf-text-dir))

;; (defun nlu-mf-get-document-files (defun file)
;;  (filename (frdcsa-el-concat-dir (list "/var/lib/myfrdcsa/codebases/minor/nlu/data-git/formalized-texts/texts" book-dir "formalizations/prolog" txt-nlu-pl-file)))
;;  ;; a-fluent-calculus-semantics-for-adl-with-plan-constraints--drescher-and-thielscher/formalizations/prolog/JELIA08.txt.nlu.pl 
;;  (list
;;   ('book-origin-dir (frdcsa-el-concat-dir (list digilib-collection-books-dir book-dir)))
;;   ('book-origin-txt-dir (frdcsa-el-concat-dir (list book-origin-dir "txt")))
;;   ('book-origin-pdf-dir (frdcsa-el-concat-dir (list book-origin-dir "pdf")))
;;   ('book-incoming-dir (frdcsa-el-concat-dir (list nlu-mf-text-dir book-dir)))
;;   ('book-incoming-original-dir (frdcsa-el-concat-dir (list book-incoming-dir "original-text")))
;;   ('book-incoming-original-txt-dir (frdcsa-el-concat-dir (list book-incoming-original-dir "txt")))
;;   ('book-incoming-original-pdf-dir (frdcsa-el-concat-dir (list book-incoming-original-dir "pdf")))
;;   ('book-prolog-dir (frdcsa-el-concat-dir (list book-incoming-dir "formalizations" "prolog")))
;;   ('book-title (nlu-mf-get-book-title-from-book-dir book-dir)))
;;  )

(defun nlu-mf-open-txt-file-for-pdf-file ())

(defun nlu-mf-open-pdf-file-for-txt-file ())

(defvar nlu-mf-update-on-moves-between-sentences nil)

(defun nlu-mf-sync-texts-pagenos (&optional arg)
 ""
 (interactive)
 (cond
  ((kmax-mode-is-derived-from 'nlu-manual-formalization-mode)
   (nlu-mf-sync-texts-pagenos-nlu-manual-formalization-mode arg))
  ((kmax-mode-is-derived-from 'academician-mode)
   (nlu-mf-sync-texts-pagenos-academician-mode arg))))

(defun nlu-mf-goto-page (&optional page-no-arg)
 ""
 (interactive)
 (assert
  (kmax-mode-is-derived-from 'academician-mode))
 (save-excursion
  (let* ((buffer-name (current-buffer))
	 (page-no (if page-no-arg
		   page-no-arg
		   (read-from-minibuffer "Book Page: ")))
	  (regex
	   (concat "sentence('.+',sentenceIdFn(\\([0-9]+\\)),'" page-no "')."))
	  (current-line
	   (progn
	    ;; (switch-to-buffer (find-buffer-visiting nlu-mf-text-file))
	    (other-window 1)
	    (beginning-of-buffer)
	    (re-search-forward regex)
	    (kmax-get-line)))
	  (sentence-no
	   (progn
	    (string-match regex current-line)
	    (match-string 1 current-line)))
	  (document-page-no
	   (nlu-mf-get-original-page-no-from-sentence-no sentence-no)))
	 (pop-to-buffer buffer-name)
	 (doc-view-goto-page document-page-no))))

(defun nlu-mf-get-original-page-no-from-sentence-no (sentence-no)
 ""
 (interactive)
 (+ (nth (string-to-number sentence-no) nlu-mf-pagenos) 1))

(defun nlu-mf-sync-texts-pagenos-nlu-manual-formalization-mode (&optional arg)
 (if (and
      (boundp 'nlu-mf-pagenos)
      (if arg nlu-mf-update-on-moves-between-sentences t))
  (let* ((sentence-no
	  (nlu-mf-get-sentence-id))
	 (original-page-no
	  (nlu-mf-get-original-page-no-from-sentence-no sentence-no)))
   (see
    (concat
     "Go to page-no " (prin1-to-string original-page-no)
     " for sentence-no " sentence-no) 0.1)
   (academician-goto-page-of-doc original-page-no nlu-mf-original-file))))

(defun nlu-mf-sync-texts-pagenos-academician-mode (&optional arg)
 (if (if arg nlu-mf-update-on-moves-between-sentences t)
  (let* ((original-page-no
	  (- (academician-current-page-or-node) 1))
	 (sentence-no
	  (progn
	   (pop-to-buffer (get-buffer "Computational Autism.txt.nlu.pl"))
	   (kmax-get-index-of-first-item-in-list original-page-no nlu-mf-pagenos))))
   (see
    (concat
     "Go to sentence-no " (prin1-to-string sentence-no)
     " for page-no " (prin1-to-string original-page-no)) 0.1)
   (nlu-mf-goto-sentence sentence-no))))

(defun nlu-mf-goto-sentence (&optional sentence-no-arg)
 ""
 (interactive)
 (let* ((sentence-no (or sentence-no-arg (read-from-minibuffer "Sentence No: "))))
  (kmax-check-mode 'nlu-manual-formalization-mode)
  (beginning-of-buffer)
  (re-search-forward (concat "sentenceFn(" (prin1-to-string sentence-no) ")"))
  (nlu-mf-reorient)))

(defun nlu-mf-clean-up-formalization-backup-files ()
 ""
 (interactive)
 (kmax-not-yet-implemented))

(require 'nlu-manual-formalization-edit-mode)
(require 'nlu-manual-formalization-sentence-mode)

(provide 'nlu-manual-formalization-mode)

;; (freekbs2-importexport-convert (list freekbs2-stack) "Interlingua" "Prolog")
