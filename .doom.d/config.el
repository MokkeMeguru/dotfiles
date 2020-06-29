;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and s'nippets.
(setq user-full-name "MokkeMeguru"
      user-mail-address "meguru.mokke@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-Iosvkem)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-agenda-files
      (directory-files-recursively org-directory "\.org$"))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(require 'google-translate)
(defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))
(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "ja")


 ;; org mode
(require 'ox)
(require 'ox-latex)
(require 'org-ref)
(require 'ox-org)
(setq org-latex-create-formula-image-program 'imagemagick)
(setq org-ref-default-citation-link "citep")
(setq org-latex-caption-above nil)
(setq org-latex-with-hyperref nil)
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-minted-options
'(("frame" "lines") ("linenos=true")))


(org-babel-do-load-languages 'org-babel-load-languages
 '((shell . t)
 (python . t)
 (emacs-lisp . t)
 (latex . t)
 (R . t)
 (stan . t)))

(setq org-preview-latex-process-alist
       (quote
       ((dvipng :programs
         ("lualatex" "dvipng")
         :description "dvi > png" :message "you need to install the programs: latex and dvipng." :image-input-type "dvi" :image-output-type "png" :image-size-adjust
         (1.0 . 1.0)
         :latex-compiler
         ("lualatex -output-format dvi -interaction nonstopmode -output-directory %o %f")
         :image-converter
         ("dvipng -fg %F -bg %B -D %D -T tight -o %O %f"))
 (dvisvgm :programs
          ("latex" "dvisvgm")
          :description "dvi > svg" :message "you need to install the programs: latex and dvisvgm." :use-xcolor t :image-input-type "xdv" :image-output-type "svg" :image-size-adjust
          (1.7 . 1.5)
          :latex-compiler
          ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
          :image-converter
          ("dvisvgm %f -n -b min -c %S -o %O"))
 (imagemagick :programs
              ("latex" "convert")
              :description "pdf > png" :message "you need to install the programs: latex and imagemagick." :use-xcolor t :image-input-type "pdf" :image-output-type "png" :image-size-adjust
              (1.0 . 1.0)
              :latex-compiler
              ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
              :image-converter
              ("convert -density %D -trim -antialias %f -quality 100 %O")))))

(setq org-latex-pdf-process
'("platex --shell-escape --kanji=utf-8 %f"
"platex --shell-escape --kanji=utf-8 %f"
"bibtex %b"
;; "biber %b"
"platex --shell-escape--kanji=utf-8 %f"
"platex --shell-escape--kanji=utf-8 %f"
"platex --shell-escape--kanji=utf-8 %f"
"dvipdfmx %b.dvi"))

(setq org-latex-create-formula-image-program 'dvisvgm)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "red" :weight normal :height 2.5)))))

(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "M-%") 'vr/query-replace)

(require 'yasnippet)
(require 'yasnippet-snippets)

(setq-default evil-escape-key-sequence "jj")
(setq org-log-done 'time)
(setq evil-disable-insert-state-bindings t)
(global-set-key (kbd "C-e") 'move-end-of-line)
(define-key evil-visual-state-map "\C-e" 'move-end-of-line)
(define-key evil-normal-state-map "\C-e" 'move-end-of-line)

(define-key evil-normal-state-map "u" 'undo-fu-only-undo)
(define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)

(global-undo-tree-mode)

(use-package dap-mode
  :config
  (dap-mode 1)
  (require 'dap-mode)
  (require 'dap-go)
  (require 'dap-python)
  (require 'dap-gdb-lldb)
  (require 'dap-hydra)
  (add-hook 'dap-stopped-hook
            (lambda (arg) (call-interactively #'dap-hydra)))
  (use-package dap-ui
    :ensure nil
    :config
    (dap-ui-mode 1)))

(setq lsp-ui-doc-enable t)

(defun dap-python--pyenv-executable-find (command)
  "Find executable taking pyenv shims into account.
If the executable is a system executable and not in the same path
as the pyenv version then also return nil. This works around https://github.com/pyenv/pyenv-which-ext
"
  (if (executable-find "pipenv")
      (let
          ((pipenv-string (shell-command-to-string (concat "pipenv run which " command))))
        (string-trim pipenv-string))
      (executable-find command)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (python-black grip-mode forge transient company-jedi yasnippet-snippets php-mode org-ref evil-tutor-ja doom-themes dap-mode)))
 '(safe-local-variable-values
   (quote
    ((cider-default-cljs-repl . shadow)
     (cider-shadow-cljs-default-options . "app")))))


(require 'magit)



(defmacro transient-define-prefix (name arglist &rest args)
  "Define NAME as a transient prefix command.
ARGLIST are the arguments that command takes.
DOCSTRING is the documentation string and is optional.
These arguments can optionally be followed by key-value pairs.
Each key has to be a keyword symbol, either `:class' or a keyword
argument supported by the constructor of that class.  The
`transient-prefix' class is used if the class is not specified
explicitly.
GROUPs add key bindings for infix and suffix commands and specify
how these bindings are presented in the popup buffer.  At least
one GROUP has to be specified.  See info node `(transient)Binding
Suffix and Infix Commands'.
The BODY is optional.  If it is omitted, then ARGLIST is also
ignored and the function definition becomes:
  (lambda ()
    (interactive)
    (transient-setup \\='NAME))
If BODY is specified, then it must begin with an `interactive'
form that matches ARGLIST, and it must call `transient-setup'.
It may however call that function only when some condition is
satisfied; that is one of the reason why you might want to use
an explicit BODY.
All transients have a (possibly nil) value, which is exported
when suffix commands are called, so that they can consume that
value.  For some transients it might be necessary to have a sort
of secondary value, called a scope.  Such a scope would usually
be set in the commands `interactive' form and has to be passed
to the setup function:
  (transient-setup \\='NAME nil nil :scope SCOPE)
\(fn NAME ARGLIST [DOCSTRING] [KEYWORD VALUE]... GROUP... [BODY...])"
  (declare (debug (&define name lambda-list
                           [&optional lambda-doc]
                           [&rest keywordp sexp]
                           [&rest vectorp]
                           [&optional ("interactive" interactive) def-body]))
           (indent defun)
           (doc-string 3))
  (pcase-let ((`(,class ,slots ,suffixes ,docstr ,body)
               (transient--expand-define-args args)))
    `(progn
       (defalias ',name
         ,(if body
              `(lambda ,arglist ,@body)
            `(lambda ()
               (interactive)
               (transient-setup ',name))))
       (put ',name 'interactive-only t)
       (put ',name 'function-documentation ,docstr)
       (put ',name 'transient--prefix
            (,(or class 'transient-prefix) :command ',name ,@slots))
       (put ',name 'transient--layout
            ',(cl-mapcan (lambda (s) (transient--parse-child name s))
                         suffixes)))))


(defmacro transient-define-suffix (name arglist &rest args)
  "Define NAME as a transient suffix command.
ARGLIST are the arguments that the command takes.
DOCSTRING is the documentation string and is optional.
These arguments can optionally be followed by key-value pairs.
Each key has to be a keyword symbol, either `:class' or a
keyword argument supported by the constructor of that class.
The `transient-suffix' class is used if the class is not
specified explicitly.
The BODY must begin with an `interactive' form that matches
ARGLIST.  The infix arguments are usually accessed by using
`transient-args' inside `interactive'.
\(fn NAME ARGLIST [DOCSTRING] [KEYWORD VALUE]... BODY...)"
  (declare (debug (&define name lambda-list
                           [&optional lambda-doc]
                           [&rest keywordp sexp]
                           ("interactive" interactive)
                           def-body))
           (indent defun)
           (doc-string 3))
  (pcase-let ((`(,class ,slots ,_ ,docstr ,body)
               (transient--expand-define-args args)))
    `(progn
       (defalias ',name (lambda ,arglist ,@body))
       (put ',name 'interactive-only t)
       (put ',name 'function-documentation ,docstr)
       (put ',name 'transient--suffix
            (,(or class 'transient-suffix) :command ',name ,@slots)))))

(defmacro transient-define-infix (name _arglist &rest args)
  "Define NAME as a transient infix command.
ARGLIST is always ignored and reserved for future use.
DOCSTRING is the documentation string and is optional.
The key-value pairs are mandatory.  All transient infix commands
are equal to each other (but not eq), so it is meaningless to
define an infix command without also setting at least `:class'
and one other keyword (which it is depends on the used class,
usually `:argument' or `:variable').
Each key has to be a keyword symbol, either `:class' or a keyword
argument supported by the constructor of that class.  The
`transient-switch' class is used if the class is not specified
explicitly.
The function definitions is always:
   (lambda ()
     (interactive)
     (let ((obj (transient-suffix-object)))
       (transient-infix-set obj (transient-infix-read obj)))
     (transient--show))
`transient-infix-read' and `transient-infix-set' are generic
functions.  Different infix commands behave differently because
the concrete methods are different for different infix command
classes.  In rare case the above command function might not be
suitable, even if you define your own infix command class.  In
that case you have to use `transient-suffix-command' to define
the infix command and use t as the value of the `:transient'
keyword.
\(fn NAME ARGLIST [DOCSTRING] [KEYWORD VALUE]...)"
  (declare (debug (&define name lambda-list
                           [&optional lambda-doc]
                           [&rest keywordp sexp]))
           (indent defun)
           (doc-string 3))
  (pcase-let ((`(,class ,slots ,_ ,docstr ,_)
               (transient--expand-define-args args)))
    `(progn
       (defalias ',name ,(transient--default-infix-command))
       (put ',name 'interactive-only t)
       (put ',name 'function-documentation ,docstr)
       (put ',name 'transient--suffix
            (,(or class 'transient-switch) :command ',name ,@slots)))))

(use-package python-black
  :demand t
  :after python
  :config
  (python-black-on-save-mode))
