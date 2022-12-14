;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Mingjun Wang"
      user-mail-address "none.wmj@live.com")

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
;; (setq doom-font (font-spec :family "SauceCodePro NF" :size 30 :weight 'Regular)
;;      doom-variable-pitch-font (font-spec :family "SauceCodePro NF" :size 30))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-molokai)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/SynologyDrive/Documents/org/")
(setq org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
      org-fancy-priorities-mode t
      org-todo-keyword-faces
      '(("TODO" :foreground "#7c7c75" :weight normal :underline t)
        ("WAITING" :foreground "#9f7efe" :weight normal :underline t)
        ("DOING" :foreground "#0098dd" :weight normal :underline t)
        ("DONE" :foreground "#50a14f" :weight normal :underline t)
        ("CANCELLED" :foreground "#ff6480" :weight normal :underline t)))

(setq org-journal-dir "~/SynologyDrive/Documents/org/journals/")
(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%Y-%m-%d, %A"
      org-journal-file-format "%Y-%m-%d.org"
      org-journal-enable-agenda-integration t)

(setq org-roam-directory "~/SynologyDrive/Documents/org/roam/")

(setq deft-directory "~/SynologyDrive/Documents/org/Notes/"
      deft-extensions '("org" "txt")
      deft-recursive t)

;; (setq org-agenda-file-regexp "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'")
;; (add-to-list 'org-agenda-files org-journal-dir)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; coding system
(prefer-coding-system 'utf-8)
(set-language-environment 'UTF-8)

;; maximize
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; default directory
(setq default-directory "~/")

;; chinese input
(pyim-wbdict-v86-enable)
(setq default-input-method "pyim")
(setq pyim-default-scheme 'wubi)

;; company
(after! company
  (setq company-idle-delay 0.1
        company-tooltip-align-annotations t
        company-show-quick-access t
        company-minimum-prefix-length 1))
;; (setq company-backends '(:separate company-yasnippet company-capf))
(setq +lsp-company-backends '(:separate company-yasnippet company-capf))

;; python
(setq python-indent-guess-indent-offset nil)
(setq python-indent-offset 2)

;; (use-package! lsp-pyright
;;   :init (when (executable-find "python3")
;;           (setq lsp-pyright-python-executable-cmd "python3"))
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-pyright)
;;                           (lsp))))  ; or lsp-deferred

;; (use-package! lsp-mode
;;   ;; :hook ((verilog-mode vhdl-mode) . lsp)
;;   :config
;;   (setq lsp-log-io nil
;;         lsp-auto-configure t
;;         lsp-auto-guess-root t
;;         lsp-completion-enable t
;;         lsp-enable-xref t
;;         lsp-enable-indentation t
;;         lsp-response-timeout 10
;;         lsp-restart 'auto-restart
;;         lsp-keep-workspace-alive nil
;;         lsp-eldoc-render-all t
;;         lsp-enable-snippet t
;;         lsp-enable-folding t
;;         lsp-enable-file-watchers t
;;         lsp-file-watch-threshold 1000)
;;   (advice-add 'lsp :before (lambda (&rest _args) (eval '(setf (lsp-session-server-id->folders (lsp-session)) (ht)))))
;;   )
