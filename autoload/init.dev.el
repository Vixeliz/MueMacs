;; C and CPP environment
;; ccls(completion and diagnosis)
(use-package company
  :defer 2
  :diminish company-mode
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
    company-idle-delay 0.1
    company-selection-wrap-around t
    company-tooltip-align-annotations t
    company-frontends '(company-pseudo-tooltip-frontend
                company-echo-metadata-frontend))
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)))

(use-package lsp-mode :commands lsp :defer 2)
(use-package lsp-ui :commands lsp-ui-mode :defer 2)

(use-package ccls
 :defer 2
 :hook ((c-mode c++-mode objc-mode cuda-mode) .
     (lambda () (lsp))))
(setq ccls-executable "/usr/bin/ccls")
(setq lsp-ui-doc-include-signature nil)
(setq lsp-ui-sideline-show-symbol nil)

(straight-use-package 'disaster :defer 2)

;; Project directory
(use-package treemacs :defer 2) ;; Project sidebar

;; Magit :)
(use-package evil-magit :defer 2)
(use-package magit
  :defer 2
  :bind ("C-x g" . magit-status)
  :config (add-hook 'with-editor-mode-hook #'evil-insert-state))

;; Diff
(use-package ediff
  :defer 2
  :ensure nil
  :config
  (setq ediff-window-setup-function #'ediff-setup-windows-plain)
  (setq ediff-split-window-function #'split-window-horizontally))

;; Good indentation
(setq-default c-basic-offset mue/indent-width)
(setq c-default-style '((awk-mode . "awk")
            (other . "k&r")))
