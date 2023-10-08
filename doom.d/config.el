;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; (exec-path-from-shell-copy-envs '("PATH"))
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and s'nippets.
(setq user-full-name "MokkeMeguru"
      user-mail-address "meguru.mokke@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

(setq doom-font (font-spec :family "HackGen35 Console" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'modus-vivendi-deuteranopia)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-agenda-files
      (directory-files-recursively org-directory "\.org$"))


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

;; (require 'google-translate)
;; (defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))
;; (setq google-translate-default-source-language "en")
;; (setq google-translate-default-target-language "ja")
;; (defun google-translate-json-suggestion (json)
;;   "Retrieve from JSON (which returns by the
;; `google-translate-request' function) suggestion. This function
;; does matter when translating misspelled word. So instead of
;; translation it is possible to get suggestion."
;;   (let ((info (aref json 7)))
;;     (if (and info (> (length info) 0))
;;         (aref info 1)
;;       nil)))

;; org mode
(autoload 'ox "ox")
(add-to-list 'auto-mode-alist '("\\.org$" . ox))

(autoload 'ox-latex "ox-latex")
(add-to-list 'auto-mode-alist '("\\.org$" . ox-latex))

(autoload 'ox-org "ox-org")
(add-to-list 'auto-mode-alist '("\\.org$" . ox-org))

(autoload 'org-ref "org-ref")
(add-to-list 'auto-mode-alist '("\\.org$" . org-ref))

(autoload 'org-gfm "org-gfm")
(add-to-list 'auto-mode-alist '("\\.org$" . org-gfm))

(eval-after-load 'org-mode
  '(progn
     (setq org-babel-clojure-backend 'cider)


     (setq org-latex-create-formula-image-program 'imagemagick)
     (setq org-ref-default-citation-link "citep")
     (setq org-latex-caption-above '(table))
     (setq org-latex-with-hyperref nil)
     (setq org-latex-listings 'minted)
     (add-to-list 'org-latex-packages-alist '("" "minted"))
     (setq org-latex-minted-options
           '(("frame" "lines") ("linenos=true")))


     (add-to-list 'org-latex-classes
                  '("extarticle"
                    "\\documentclass{extarticle}"
                    ("\\section{%s}" . "\\section*{%s}")
                    ("\\subsection{%s}" . "\\subsection*{%s}")
                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

     (add-to-list 'org-latex-classes
                  '("ieee"
                    "\\documentclass[conference]{IEEEtran}"
                    ("\\section{%s}" . "\\section*{%s}")
                    ("\\subsection{%s}" . "\\subsection*{%s}")
                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                    ))

     (add-to-list 'org-latex-classes
                  '("jreport3"
                    "\\documentclass[12pt,a4j,twoside]{jreport}"
                    ("\\chapter{%s}" . "\\chapter*{%s}")
                    ("\\section{%s}" . "\\section*{%s}")
                    ("\\subsection{%s}" . "\\subsection*{%s}")
                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                    ))

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
             ;; "bibtex %b"
             "biber %b"
             "platex --shell-escape--kanji=utf-8 %f"
             "platex --shell-escape--kanji=utf-8 %f"
             ;;"platex --shell-escape--kanji=utf-8 %f"
             "dvipdfmx %b.dvi"))

     (setq org-latex-create-formula-image-program 'dvisvgm)
     (setq org-latex-caption-above '(table))
     (setq org-log-done 'time)
     )
  )

(global-set-key (kbd "M-%") 'vr/query-replace)

(require 'yasnippet)
(require 'yasnippet-snippets)

(setq-default evil-escape-key-sequence "jk")
(setq evil-disable-insert-state-bindings t)
(global-set-key (kbd "C-e") 'move-end-of-line)
(define-key evil-visual-state-map "\C-e" 'move-end-of-line)
(define-key evil-normal-state-map "\C-e" 'move-end-of-line)

(define-key evil-normal-state-map "u" 'undo-fu-only-undo)
(define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)

(setq lsp-ui-doc-enable t)

(use-package python-black
  :demand t
  :after python
  :config
  (python-black-on-save-mode))

(with-eval-after-load 'python-mode
  (require 'python-black)
  (setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
  (setq +python-jupyter-repl-args '("--simple-prompt")))

(when (equal system-type 'gnu/linux)
  (exec-path-from-shell-initialize))

(with-eval-after-load 'markdown-mode
  (setq markdown-preview-stylesheets (list "~/.doom.d/github.css"
                                           "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.10/styles/vs.min.css"))
  (setq markdown-preview--preview-template "~/.doom.d/preview.html"))

(all-the-icons-dired-mode)
(all-the-icons-ivy-rich-mode)

(when (eq system-type 'darwin)
  (keyboard-translate ?\C-h ?\C-?))

(with-eval-after-load 'python-mode
  (require 'lsp-pyright))


(eval-after-load 'go-mode
  '(add-hook 'flycheck-mode-hook 'flycheck-golangci-lint-setup))

(setq flycheck-golangci-lint-config "~/.doom.d/golangci-lint/config.yml")


(with-eval-after-load "persp-mode"
  (global-set-key (kbd "C-x b") 'persp-switch-to-buffer)
  (global-set-key (kbd "C-x k") 'persp-kill-buffer))

;; aspell
(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))

;; typescript
(setq typescript-indent-level 2)

(after! lsp-mode
  (add-to-list 'lsp--formatting-indent-alist '(typescript-tsx-mode . typescript-indent-level)))

;; graphql
(add-hook 'graphql-mode-hook
          (lambda
            ()
            (make-local-variable 'graphql-indent-level)
            (setq graphql-indent-level 2)))

;; fix for bug: device x is not a termcap terminal device
(setq xterm-set-window-title t)
(defadvice! fix-xterm-set-window-title (&optional terminal)
  :before-while #'xterm-set-window-title
  (not (display-graphic-p terminal)))

(with-eval-after-load 'lsp-mode
  (lsp-register-custom-settings
   '(("gopls.completeUnimported" t t)
     ("gopls.staticcheck" t t)))


  (setq lsp-go-codelenses '(
                            (gc_details . t)
                            (generate . t)
                            (regenerate_cgo . t)
                            (tidy . :json-false)
                            (upgrade_dependency . :json-false)
                            (test . t)
                            (vendor . t))))

(with-eval-after-load 'lsp-ui
  (setq lsp-ui-doc-enable t))

(with-eval-after-load 'go-mode
  (setq gofmt-command "goimports")
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'after-save-hook 'gofmt nil 'make-it-local))))

(defun my/prettier ()
  (interactive)
  (shell-command
   (format "%s --write %s"
           (shell-quote-argument (executable-find "prettier"))
           (shell-quote-argument (expand-file-name buffer-file-name))))
  (revert-buffer t t t))

(add-hook 'typescript-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'my/prettier t t)))

(add-hook 'typescript-tsx-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'my/prettier t t)))

(with-eval-after-load 'lsp-mode
  (lsp-register-custom-settings
   '(("gopls.completeUnimported" t t)
     ("gopls.staticcheck" t t)))
  (setq lsp-go-codelenses '(
                            (gc_details . t)
                            (generate . t)
                            (regenerate_cgo . t)
                            (tidy . :json-false)
                            (upgrade_dependency . :json-false)
                            (test . t)
                            (vendor . t))))

(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))

(setq mermaid-flags "~/.doom.d/mermaid_config.json")

;; modeline
(poke-line-global-mode 1)
(poke-line-set-pokemon "pikachu")
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-workspace-name t)

(use-package doom-modeline
  :config
  (line-number-mode 0)
  (column-number-mode 0))
