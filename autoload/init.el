;; Make dired a little cleaner
(setq delete-by-moving-to-trash t)
(put 'dired-find-alternate-file 'disabled nil)

;; Whitespace
(use-package whitespace
  :defer 2
  :ensure nil
  :hook (before-save . whitespace-cleanup))

;; Pair quotes and such
(use-package elec-pair
  :defer 2
  :ensure nil
  :hook (prog-mode . electric-pair-mode))

;; Mouse wheel is slower
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))
      mouse-wheel-progressive-speed nil)

;; Column numbers
(setq column-number-mode +1)

;; Replace active region
(use-package delsel
  :defer 2
  :ensure nil
  :config (delete-selection-mode +1))

;; Speed up
(use-package recentf
  :defer 1)
(use-package saveplace
  :defer 2)
(use-package projectile
  :defer 2)
(use-package server
  :defer 1)

;;(use-package evil-escape
;  :defer t)

;; Refresh buffer
(use-package autorevert
  :ensure nil
  :defer 2
  :config
  (global-auto-revert-mode +1)
  (setq auto-revert-interval 2
    auto-revert-check-vc-info t
    global-auto-revert-non-file-buffers t
    auto-revert-verbose nil))

;; No backup files scattered
(setq confirm-kill-processes nil
      create-lockfiles nil
      make-backup-files nil)
