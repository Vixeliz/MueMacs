;; Theme
(use-package all-the-icons :defer t) ;; Icons
(use-package solaire-mode
  :defer 2
  :hook (after-init . solaire-global-mode))
(use-package doom-themes
  :config

(setq doom-themes-enable-bold t
   doom-themes-enable-italic t)
(load-theme 'doom-city-lights t)

(doom-themes-visual-bell-config)

(setq doom-themes-treemacs-theme "doom-colors")
(doom-themes-treemacs-config)

(doom-themes-org-config))

;; No scroll bar
(scroll-bar-mode -1)

;; Welcome page
(setq inhibit-startup-screen t)
;; Custom welcome page
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'nil
    dashboard-banner-logo-title "MueMacs"
    dashboard-items nil
    dashboard-set-footer nil))

;; Nice things
(use-package emojify :defer 2) ;; EMOJIS
(use-package doom-modeline
  :defer 2
  :ensure t
  :init (doom-modeline-mode 1)) ;; Status bar

;; Matching is faster
(use-package paren
  :defer 2
  :ensure nil
  :init (setq show-paren-delay 0)
  :config (show-paren-mode +1))

;; Highlight TODO
(use-package hl-todo
  :defer t
  :straight t
  :hook (prog-mode . hl-todo-mode))
