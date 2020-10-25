;; Speed up garbage collector during startup
(setq gc-cons-threshold (* 50 1000 1000))

;; Package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
    (unless (file-exists-p bootstrap-file)
     (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))

;; Name
(setq user-full-name "Maxzymus Dominick"
      user-mail-address "muevoid@protonmail.com")

;; Use Package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Debug
;(use-package esup
;  :ensure t
;  :commands (esup))

;; Setting up
(use-package emacs
  :preface
  (defvar mue/indent-width 4)
  :config
  (setq frame-title-format '("MueMacs")
    ring-bell-function 'ignore
    frame-resize-pixelwise t
    default-directory "~/")

  (tool-bar-mode -1)
  (menu-bar-mode -1)

  (setq scroll-margin 0
    scroll-conservatively 101 ; > 100
    scroll-preserve-screen-position t
    auto-window-vscroll nil)

  ;; Spaces always win
  (setq-default indent-tabs-mode nil
        tab-width mue/indent-width))
(use-package diminish
  :defer 1
  :demand t)

;; Enable Evil (We do this first cause I cannot live without)
(use-package evil
  :defer t
  :diminish undo-tree-mode
  :init
  (setq evil-want-C-u-scroll t
    evil-want-keybinding nil
    evil-shift-width mue/indent-width)
  :hook (after-init . evil-mode)
  :preface
  (defun mue/save-kill-buffer ()
    (interactive)
    (save-buffer)
    (kill-this-buffer))
    :config
    (with-eval-after-load 'evil-maps
      (define-key evil-insert-state-map (kbd "C-n") nil)
      (define-key evil-insert-state-map (kbd "C-p") nil))
    (evil-ex-define-cmd "q" #'kill-current-buffer)
    (evil-ex-define-cmd "wq" #'mue/save-kill-buffer))
(use-package evil-collection
  :defer nil
  :config
  (setq evil-collection-company-use-tng nil)
  (evil-collection-init))
(use-package evil-commentary
  :after evil
  :defer 2
  :diminish
  :config (evil-commentary-mode +1))

;; After this
(let ((emacs-dir (expand-file-name "autoload" (file-name-directory user-init-file))))
  (load (setq user-init-file (expand-file-name "init.el" emacs-dir)))
  (dolist (file (directory-files emacs-dir))
    (when (string-match "^init\\.[A-Za-z0-9_-]+\\.el$" file)
      (load (expand-file-name file emacs-dir))))
  (load (setq custom-file (expand-file-name "custom.el" emacs-dir))))

;; Reset gc
(setq gc-cons-threshold (* 2 1000 1000))
