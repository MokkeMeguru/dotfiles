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
(setq org-latex-create-formula-image-program 'dvipng)
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
("platex" "dvipng")
:description "dvi > png" :message "you need to install platex and dvipng"
:image-input-type "dvi" :image-output-type "png" :image-size-adjust (1.0 1.0)
:latex-compiler ("platex --shell-escape --kanji=utf-8 --interaction=nonstopmode -output-directory=%o %f")
:image-converter
("dvipng -fg %F -bg %B -D %D -T tight -o %O %f")))))
(setq org-latex-pdf-process
'("platex --shell-escape --kanji=utf-8 %f"
"platex --shell-escape --kanji=utf-8 %f"
"bibtex %b"
;; "biber %b"
"platex --shell-escape--kanji=utf-8 %f"
"platex --shell-escape--kanji=utf-8 %f"
"platex --shell-escape--kanji=utf-8 %f"
"dvipdfmx %b.dvi"))

(setq org-latex-create-formula-image-program 'dvipng)

(custom-set-faces
   '(aw-leading-char-face
     ((t (:foreground "red" :weight normal :height 2.5)))))

(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "M-%") 'vr/query-replace)

(require 'evil-tutor)
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
