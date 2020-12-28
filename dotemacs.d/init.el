(require 'package) ;; package.el
(package-initialize)

;; repositories
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

;;Using use-package to automatically install certain packages, as well as the ease of lazily loading them.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(load-theme 'manoj-dark)
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-todo-keywords
      '(
        (sequence  "TODO(t)" "STARTED(s)" "ANALYSIS(a)" "IMPLEMENTATION(i)" "REVIEW(r)" "|" "DONE(d)")
        (sequence "|" "CANCELED(c)" "DELEGATED(d)" "HOLD(h)")
        ))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "GoldenRod" :weight bold))
        ("STARTED" . (:foreground "IndianRed1" :weight bold))   
        ("ANALYSIS" . (:foreground "OrangeRed" :weight bold))
        ("IMPLEMENTATION" . (:foreground "coral" :weight bold)) 
		("REVIEW" . (:foreground "coral" :weight bold)) 
        ("CANCELED" . (:foreground "LimeGreen" :weight bold))
        ("DELEGATED" . (:foreground "LimeGreen" :weight bold))
        ("HOLD" . (:foreground "LimeGreen" :weight bold))
        ))  
		
		
(setq org-agenda-files (list "c:/pankaj/Factset/emacs-24.3-bin-i386/emacs-24.3/bin/org"))
(defun volatile-kill-buffer ()
   "Kill current buffer unconditionally."
   (interactive)
   (let ((buffer-modified-p nil))
     (kill-buffer (current-buffer))))

(global-set-key (kbd "C-x k") 'volatile-kill-buffer)     ;; Unconditionally kill unmodified buffers.
(setq org-agenda-start-day "-1d")
(setq org-agenda-span 5)
(setq org-agenda-start-on-weekday nil)
(setq org-columns-default-format
      "%25ITEM %TODO %3PRIORITY %TIMESTAMP")
;; archiving file
(require 'org-archive)                                                                               
(setq org-archive-save-context-info nil)                                                             
(setq org-archive-location "::* Archived Tasks")

;; let’s increase the cache before starting garbage collection:
(setq gc-cons-threshold 50000000)

;;I have learned to distrust tabs in my source code, so let’s make sure that we only have spaces
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;; yes y
(fset 'yes-or-no-p 'y-or-n-p)

;; which key
(use-package which-key
  :ensure t
  :defer 10
  :diminish which-key-mode
  :config

  ;; Replacements for how KEY is replaced when which-key displays
  ;;   KEY → FUNCTION
  ;; Eg: After "C-c", display "right → winner-redo" as "▶ → winner-redo"
  (setq which-key-key-replacement-alist
        '(("<\\([[:alnum:]-]+\\)>" . "\\1")
          ("left"                  . "◀")
          ("right"                 . "▶")
          ("up"                    . "▲")
          ("down"                  . "▼")
          ("delete"                . "DEL") ; delete key
          ("\\`DEL\\'"             . "BS") ; backspace key
          ("next"                  . "PgDn")
          ("prior"                 . "PgUp"))

        ;; List of "special" keys for which a KEY is displayed as just
        ;; K but with "inverted video" face... not sure I like this.
        which-key-special-keys '("RET" "DEL" ; delete key
                                 "ESC" "BS" ; backspace key
                                 "SPC" "TAB")

        ;; Replacements for how part or whole of FUNCTION is replaced:
        which-key-description-replacement-alist
        '(("Prefix Command" . "prefix")
          ("\\`calc-"       . "") ; Hide "calc-" prefixes when listing M-x calc keys
          ("\\`projectile-" . "𝓟/")
          ("\\`org-babel-"  . "ob/"))

        ;; Underlines commands to emphasize some functions:
        which-key-highlighted-command-list
        '("\\(rectangle-\\)\\|\\(-rectangle\\)"
          "\\`org-"))

  ;; Change what string to display for a given *complete* key binding
  ;; Eg: After "C-x", display "8 → +unicode" instead of "8 → +prefix"
  (which-key-add-key-based-replacements
    "C-x 8"   "unicode"
    "C-c T"   "toggles-"
    "C-c p s" "projectile-search"
    "C-c p 4" "projectile-other-buffer-"
    "C-x a"   "abbrev/expand"
    "C-x r"   "rect/reg"
    "C-c /"   "engine-mode-map"
    "C-c C-v" "org-babel")

  (which-key-mode 1))

;; image
(setq org-display-inline-images t) 
(setq org-redisplay-inline-images t)
(setq org-startup-with-inline-images "inlineimages")

;; undo
(global-set-key (kbd "C-z") 'undo)

