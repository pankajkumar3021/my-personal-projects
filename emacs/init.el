(require 'package) ;; package.el
(package-initialize)

;; repositories
(setq package-archives
      '(("gnu-elpa"     . "https://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("melpa-stable" . 10)
        ("gnu-elpa"     . 5)
        ("melpa"        . 0)))
;;Using use-package to automatically install certain packages, as well as the ease of lazily loading them.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
;;(require 'org-pretty-table)
;;(require 'evil-org)





(load-theme 'manoj-dark)
(require 'org)
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
;;extra

;; key binding for directly going to orgmode file

(global-set-key (kbd "C-c a") 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(setq org-log-done t)

;;my current settings 
(setq  emacs-base-path "c:/pankaj/sw/my-personal-projects/emacs/")
(setq  my-org-path "c:/pankaj/sw/my-personal-projects/emacs/org/")
;;(setq  emacs-default-org-file "c:/pankaj/sw/my-personal-projects/emacs/org/projects.org")
(setq  personal-notes (concat my-org-path "personal-notes.org")
	   personal-work  (concat my-org-path "personal-notes.org")
	   personal-gtd  (concat my-org-path "personal-notes.org")

       
	   
	   office-notes  (concat my-org-path "office-notes.org")
       office-work (concat my-org-path  "office-work.org")
	   office-gtd  (concat my-org-path  "office-gtd.org")
	   office-meetings (concat my-org-path  "office-meetings.org")

	   )

(setq org-directory "c:/pankaj/sw/my-personal-projects/emacs/org/")

;;(setq org-agenda-files (list
  ;;    (concat org-directory "gtd.org")
   ;;   (concat org-directory "notes.org")
    ;;  (concat org-directory "work-log.org")
     ;; )
;;)



(global-set-key (kbd "C-c o") 
(lambda () (interactive) (find-file "c:/pankaj/sw/my-personal-projects/emacs/org/projects.org")))


(setq org-capture-templates
      '(    
        ("w" "Office Work Log Entry"
         entry (file+datetree office-work)
         "* %?"
         :empty-lines 0)
		 
		 ("a" "Personal Work Log Entry"
         entry (file+datetree personal-work)
         "* %?"
         :empty-lines 0)

        ("n" "Personal Notes"
         entry (file+headline personal-notes "Random Notes")
        "** %?"
         :empty-lines 0)

        ("b" "Work Notes"
         entry (file+headline office-notes "Random Notes")
         "** %?"
         :empty-lines 0)
		 
	    ("z" "Work Notes Review"
         entry (file+headline office-notes "Team Reports Review")
         "** %?"
         :empty-lines 0)

        ("d" "Door Codes"
         entry (file+headline "c:/pankaj/sw/emacs/.emacs.d/org/notes.org" "Door Codes")
         "** %?"
         :empty-lines 0)

        ("g" "General To-Do"
         entry (file+headline office-gtd "General Tasks")
         "* TODO [#B] %?\n:Created: %T\n "
         :empty-lines 0)
		 
		("h" "General To-Do"
         entry (file+headline personal-gtd "General Tasks")
         "* TODO [#B] %?\n:Created: %T\n "
         :empty-lines 0)

        ("m" "Meeting"
         entry (file+datetree office-meetings)
         "* %? :meeting:%^g \n:Created: %T\n** Attendees\n*** \n** Notes\n** Action Items\n*** TODO [#A] "
         :tree-type week
         :clock-in t
         :clock-resume t
         :empty-lines 0)
		 
	("c" "Code To-Do"
         entry (file+headline "c:/pankaj/sw/emacs/.emacs.d/org/todos.org" "Code Related Tasks")
         "* TODO [#B] %?\n:Created: %T\n%i\n%a\nProposed Solution: "
         :empty-lines 0)

        )

)

(setq org-todo-keywords
      '((sequence "TODO(t)" "PLANNING(p)" "IN-PROGRESS(i@/!)" "VERIFYING(v!)" "BLOCKED(b@)"  "|" "DONE(d!)" "OBE(o@!)" "WONT-DO(w@/!)" )
        ))

(setq org-todo-keyword-faces
      '(
        ("TODO" . (:foreground "GoldenRod" :weight bold))
        ("PLANNING" . (:foreground "DeepPink" :weight bold))
        ("IN-PROGRESS" . (:foreground "Cyan" :weight bold))
        ("VERIFYING" . (:foreground "DarkOrange" :weight bold))
        ("BLOCKED" . (:foreground "Red" :weight bold))
        ("DONE" . (:foreground "LimeGreen" :weight bold))
        ("OBE" . (:foreground "LimeGreen" :weight bold))
        ("WONT-DO" . (:foreground "LimeGreen" :weight bold))
        ))


;; Tags
(setq org-tag-alist '(
                      ;; Ticket types
                      (:startgroup . nil)
                      ("@bug" . ?b)
                      ("@feature" . ?u)
                      ("@spike" . ?j)                      
                      (:endgroup . nil)

                      ;; Ticket flags
                      ("@write_future_ticket" . ?w)
                      ("@emergency" . ?e)
                      ("@research" . ?r)

                      ;; Meeting types
                      (:startgroup . nil)
                      ("big_sprint_review" . ?i)
                      ("cents_sprint_retro" . ?n)
                      ("dsu" . ?d)
                      ("grooming" . ?g)
                      ("sprint_retro" . ?s)
                      (:endgroup . nil)

                      ;; Code TODOs tags
                      ("QA" . ?q)
                      ("backend" . ?k)
                      ("broken_code" . ?c)
                      ("frontend" . ?f)

                      ;; Special tags
                      ("CRITICAL" . ?x)
                      ("obstacle" . ?o)
                      
                      ;; Meeting tags
                      ("HR" . ?h)
                      ("general" . ?l)
                      ("meeting" . ?m)
                      ("misc" . ?z)
                      ("planning" . ?p)

                      ;; Work Log Tags
                      ("accomplishment" . ?a)
                      ))


;; Tag colors
(setq org-tag-faces
      '(
        ("planning"  . (:foreground "mediumPurple1" :weight bold))
        ("backend"   . (:foreground "royalblue1"    :weight bold))
        ("frontend"  . (:foreground "forest green"  :weight bold))
        ("QA"        . (:foreground "sienna"        :weight bold))
        ("meeting"   . (:foreground "yellow1"       :weight bold))
        ("CRITICAL"  . (:foreground "red1"          :weight bold))
        )
      )


;; Agenda View "d"
(defun air-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

    PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

(setq org-agenda-skip-deadline-if-done t)

(setq org-agenda-custom-commands
      '(

        ;; Daily Agenda & TODOs
        ("d" "Daily agenda and all TODOs"

         ;; Display items with priority A
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))

          ;; View 7 days in the calendar view
          (agenda "" ((org-agenda-span 7)))

          ;; Display items with priority B (really it is view all items minus A & C)
          (alltodo ""
                   ((org-agenda-skip-function '(or (air-org-skip-subtree-if-priority ?A)
                                                   (air-org-skip-subtree-if-priority ?C)
                                                   (org-agenda-skip-if nil '(scheduled deadline))))
                    (org-agenda-overriding-header "ALL normal priority tasks:")))

          ;; Display items with pirority C
          (tags "PRIORITY=\"C\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Low-priority Unfinished tasks:")))
          )

         ;; Don't compress things (change to suite your tastes)
         ((org-agenda-compact-blocks nil)))
        
        ;; James's Super View
        ("j" "James's Super View"
         (
          (agenda ""
                  (
                   (org-agenda-remove-tags t)                                       
                   (org-agenda-span 7)
                   )
                  )

          (alltodo ""
                   (
                    ;; Remove tags to make the view cleaner
                    (org-agenda-remove-tags t)
                    (org-agenda-prefix-format "  %t  %s")                    
                    (org-agenda-overriding-header "CURRENT STATUS")

                    ;; Define the super agenda groups (sorts by order)
                    (org-super-agenda-groups
                     '(
                       ;; Filter where tag is CRITICAL
                       (:name "Critical Tasks"
                              :tag "CRITICAL"
                              :order 0
                              )
                       ;; Filter where TODO state is IN-PROGRESS
                       (:name "Currently Working"
                              :todo "IN-PROGRESS"
                              :order 1
                              )
                       ;; Filter where TODO state is PLANNING
                       (:name "Planning Next Steps"
                              :todo "PLANNING"
                              :order 2
                              )
                       ;; Filter where TODO state is BLOCKED or where the tag is obstacle
                       (:name "Problems & Blockers"
                              :todo "BLOCKED"
                              :tag "obstacle"                              
                              :order 3
                              )
                       ;; Filter where tag is @write_future_ticket
                       (:name "Tickets to Create"
                              :tag "@write_future_ticket"
                              :order 4
                              )
                       ;; Filter where tag is @research
                       (:name "Research Required"
                              :tag "@research"
                              :order 7
                              )
                       ;; Filter where tag is meeting and priority is A (only want TODOs from meetings)
                       (:name "Meeting Action Items"
                              :and (:tag "meeting" :priority "A")
                              :order 8
                              )
                       ;; Filter where state is TODO and the priority is A and the tag is not meeting
                       (:name "Other Important Items"
                              :and (:todo "TODO" :priority "A" :not (:tag "meeting"))
                              :order 9
                              )
                       ;; Filter where state is TODO and priority is B
                       (:name "General Backlog"
                              :and (:todo "TODO" :priority "B")
                              :order 10
                              )
                       ;; Filter where the priority is C or less (supports future lower priorities)
                       (:name "Non Critical"
                              :priority<= "C"
                              :order 11
                              )
                       ;; Filter where TODO state is VERIFYING
                       (:name "Currently Being Verified"
                              :todo "VERIFYING"
                              :order 20
                              )
                       )
                     )
                    )
                   )
          ))
        ))
;;setq default-directory "C:\\pankaj\sw\emacs\\.emacs.d\\"
(setq default-directory emacs-base-path)
;;https://github.com/james-stoup/emacs-org-mode-tutorial
