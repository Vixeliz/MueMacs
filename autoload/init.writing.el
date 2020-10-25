;; Writing
(use-package writeroom-mode
  :defer t) ;; Zen place
(use-package mixed-pitch
  :defer t)

;; Org mode
(use-package org
  :hook ((org-mode . visual-line-mode)
         (org-mode . org-indent-mode)
         (org-mode . outline-show-all)))

(use-package org-bullets :defer 2 :hook (org-mode . org-bullets-mode))
