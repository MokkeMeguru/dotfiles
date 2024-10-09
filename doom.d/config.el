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

(setq doom-font (font-spec :family "HackGen35 Console" :size 14)
      doom-symbol-font (font-spec :family (if IS-MAC "Apple Color Emoji" "JuliaMono")))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-spacegrey)
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'frappe)
;;(setq catppuccin-flavor 'macchiato)

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


     (setq org-preview-latex-default-process 'imagemagick)
     (setq org-ref-default-citation-link "citep")
     (setq org-latex-caption-above '(table))
     (setq org-latex-hyperref-template nil)
     (setq org-latex-src-block-backend 'minted)
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

     (setq org-preview-latex-default-process 'dvisvgm)
     (setq org-latex-caption-above '(table))
     (setq org-log-done 'time)
     )
  )

;; yasnippet
(require 'yasnippet)
(require 'yasnippet-snippets)

;; os
(when (equal system-type 'gnu/linux)
  (exec-path-from-shell-initialize))

;; face
(all-the-icons-dired-mode)
(all-the-icons-ivy-rich-mode)

(defun set-alpha (alpha-num)
  `set frame parameter 'alpha`
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))

;; modeline
;; (poke-line-global-mode 1)
;; (poke-line-set-pokemon "pikachu")
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-workspace-name t)

(use-package doom-modeline
  :config
  (line-number-mode 0)
  (column-number-mode 0))

;;;; fix for bug: device x is not a termcap terminal device
(setq xterm-set-window-title t)
(defadvice! fix-xterm-set-window-title (&optional terminal)
  :before-while #'xterm-set-window-title
  (not (display-graphic-p terminal)))

;; keyboard utils
(global-set-key (kbd "M-%") 'vr/query-replace)

(setq-default evil-escape-key-sequence "jk")
(setq evil-disable-insert-state-bindings t)
(global-set-key (kbd "C-e") 'move-end-of-line)
(define-key evil-visual-state-map "\C-e" 'move-end-of-line)
(define-key evil-normal-state-map "\C-e" 'move-end-of-line)

(define-key evil-normal-state-map "u" 'undo-fu-only-undo)
(define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)

(when (eq system-type 'darwin)
  (keyboard-translate ?\C-h ?\C-?))

(with-eval-after-load "persp-mode"
  (global-set-key (kbd "C-x b") 'persp-switch-to-buffer)
  (global-set-key (kbd "C-x k") 'persp-kill-buffer))

;; treesit
(after! treesit
  (setq treesit-language-source-alist
        '((typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src" nil nil)
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src" nil nil)
          (bash "https://github.com/tree-sitter/tree-sitter-bash")
          (cmake "https://github.com/uyha/tree-sitter-cmake")
          (css "https://github.com/tree-sitter/tree-sitter-css")
          (elisp "https://github.com/Wilfred/tree-sitter-elisp")
          (go "https://github.com/tree-sitter/tree-sitter-go")
          (html "https://github.com/tree-sitter/tree-sitter-html")
          (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
          (json "https://github.com/tree-sitter/tree-sitter-json")
          (make "https://github.com/alemuller/tree-sitter-make")
          (markdown "https://github.com/ikatyang/tree-sitter-markdown")
          (python "https://github.com/tree-sitter/tree-sitter-python")
          (toml "https://github.com/tree-sitter/tree-sitter-toml")
          (yaml "https://github.com/ikatyang/tree-sitter-yaml"))))


;; lsp
(with-eval-after-load 'lsp-ui
  (setq lsp-ui-doc-enable t))

;; (after! lsp-mode
;;   ;; (setq lsp-clients-typescript-init-opts '(:importModuleSpecifierPreference "non-relative"))
;;   (lsp-make-interactive-code-action organize-imports-ts "source.organizeImports.ts-ls"))

;; typescript
(use-package typescript-ts-mode
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :config
  (progn
    (add-hook! '(typescript-ts-mode-hook tsx-ts-mode-hook) #'lsp!)
    (setq lsp-clients-typescript-prefer-use-project-ts-server t)
    (setq lsp-eldoc-render-all t)
    (setq lsp-eslint-auto-fix-on-save t)
    ;; (setq-local lsp-enabled-clients '(ts-ls eslint))
    ))

;; (map! :after lsp-mode
;;       (:map tsx-ts-mode-map
;;             "C-c C-o" #'lsp-eslint-fix-all)
;;       (:map typescript-mode-map
;;             "C-c C-o" #'lsp-eslint-fix-all)
;;       (:map typescript-ts-mode-map
;;             "C-c C-o" #'lsp-eslint-fix-all)
;;       ("C-c C-o" #'lsp-organize-imports))

;; (custom-set-variables
;;  '(lsp-clients-typescript-init-opts
;;    '(:importModuleSpecifierEnding "js" :generateReturnInDocTemplate t))
;;  )

;; (cl-defmethod project-root ((project (head eglot-project)))
;;   (cdr project))

;; (defun my-project-try-tsconfig-json (dir)
;;   (when-let* ((found (locate-dominating-file dir "tsconfig.json")))
;;     (cons 'eglot-project found)))

;; (add-hook 'project-find-functions
;;           'my-project-try-tsconfig-json nil nil)

;; (add-to-list 'eglot-server-programs
;;              '((typescript-mode) "typescript-language-server" "--stdio"))

;; (eval-after-load 'typescript-ts-mode
;;   '(add-hook 'typescript-ts-mode-hook #'add-node-modules-path))

;; (add-hook 'typescript-ts-mode-hook 'eglot-ensure)

;; (defun my/prettier ()
;;   (interactive)
;;   (shell-command
;;    (format "%s --write %s"
;;            (shell-quote-argument (executable-find "prettier"))
;;            (shell-quote-argument (expand-file-name buffer-file-name))))
;;   (revert-buffer t t t))
;; (add-hook 'typescript-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook 'my/prettier t t)))
;; (add-hook 'typescript-tsx-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook 'my/prettier t t)))
;; (setq typescript-indent-level 2)
;; (after! lsp-mode
;;   (add-to-list 'lsp--formatting-indent-alist '(typescript-tsx-mode . typescript-indent-level)))

;; golang
(with-eval-after-load 'go-ts-mode
  (setq flycheck-golangci-lint-config "~/.doom.d/golangci-lint/config.yml")
  (add-hook 'flycheck-mode-hook 'flycheck-golangci-lint-setup)
  (add-hook 'go-ts-mode-hook #'lsp-deferred)
  ;; Make sure you don't have other goimports hooks enabled.
  (defun lsp-go-ts-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-organize-imports))
  (add-hook 'go-ts-mode-hook #'lsp-go-ts-install-save-hooks))

(with-eval-after-load 'go-mode
  (setq flycheck-golangci-lint-config "~/.doom.d/golangci-lint/config.yml")
  (add-hook 'flycheck-mode-hook 'flycheck-golangci-lint-setup)
  (add-hook 'go-mode-hook #'lsp-deferred)
  ;; Make sure you don't have other goimports hooks enabled.
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-organize-imports))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks))


(with-eval-after-load 'lsp-mode
  (lsp-register-custom-settings
   '(("gopls.completeUnimported" t t)
     ("gopls.staticcheck" t t)
     ("gopls.codelenses" ((generate . t)
                          (test . t)
                          (fill_struct . t)
                          (references . t)
                          (extract_function . t)
                          (extract_variable . t))))))

;; (with-eval-after-load 'lsp-mode
;;   (lsp-register-custom-settings
;;    '(("gopls.completeUnimported" t t)
;;      ("gopls.staticcheck" t t)))
;;   (setq lsp-go-codelenses '(
;;                             (gc_details . t)
;;                             (generate . t)
;;                             (regenerate_cgo . t)
;;                             (tidy . :json-false)
;;                             (upgrade_dependency . :json-false)
;;                             (test . t)
;;                             (vendor . t))))

;; python
(use-package python-black
  :demand t
  :after python
  :config
  (python-black-on-save-mode))

(with-eval-after-load 'python-mode
  (require 'lsp-pyright)
  (require 'python-black)
  (setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
  (setq +python-jupyter-repl-args '("--simple-prompt")))

;; markdown
(with-eval-after-load 'markdown-mode
  (setq markdown-preview-stylesheets (list "~/.doom.d/github.css"
                                           "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.10/styles/vs.min.css"))
  (setq markdown-preview--preview-template "~/.doom.d/preview.html"))

;; aspell
(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))

;; graphql
(add-hook 'graphql-mode-hook
          (lambda
            ()
            (make-local-variable 'graphql-indent-level)
            (setq graphql-indent-level 2)))

;; mermaid
(setq mermaid-flags "~/.doom.d/mermaid_config.json")

;; copilot
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))


;; ruby
(require 'lsp-mode)
(add-hook 'ruby-mode-hook 'lsp)
(setq lsp-rubocop-use-bundler t)
(setq lsp-steep-use-bundler t)
(setq lsp-solargraph-use-bundler t)
(setq lsp-ruby-use-bundler t)

(use-package ruby-mode
  :mode (
         ("\\.rb\\'" . ruby-mode)
         ("\\.rake\\'" . ruby-mode)
         ("\\.gemspec\\'" . ruby-mode)
         ("\\Steepfile\\'" . ruby-mode)
         ("\\Gemfile\\'" . ruby-mode)
         ("\\Rakefile\\'" . ruby-mode)
         )
  :config
  (progn
    (setq-local lsp-enabled-clients '(ruby-ls solargraph))))

(use-package lsp-mode
  :hook (ruby-mode .lsp-deferred)
  :commands (lsp lsp-deferred))

(use-package! whitespace
  :config
  (progn
    (setq whitespace-style '(face tabs tab-mark spaces space-mark trailing lines-tail newline newline-mark))
    (setq whitespace-display-mappings '(
                                        (space-mark   ?\     [?\u00B7]     [?.])
                                        (space-mark   ?\xA0  [?\u00A4]     [?_])
                                        (newline-mark ?\n    [?¬ ?\n])
                                        (tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t])))))

(setq copilot-indent-offset-warning-disable t)

(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-ts-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-ts-mode))

(add-hook 'json-ts-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))
