;;; setup-helm.el --- Modern Helm setup

(use-package helm
  :demand t
  :bind (("M-x"     . helm-M-x)
         ("M-y"     . helm-show-kill-ring)
         ("C-x b"   . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("C-c h"   . helm-command-prefix))
  :config
  (helm-mode 1)

  ;; Impostazioni principali
  (setq helm-scroll-amount 4
        helm-echo-input-in-header-line t
        helm-split-window-in-side-p t
        helm-ff-search-library-in-sexp t
        helm-ff-file-name-history-use-recentf t
        helm-move-to-line-cycle-in-source t
        helm-buffer-skip-remote-checking t

        helm-mode-fuzzy-match t
        helm-M-x-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-imenu-fuzzy-match t
        helm-lisp-fuzzy-completion t
        helm-semantic-fuzzy-match t
        helm-locate-fuzzy-match t)

  ;; TAB behavior
  (define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i")   #'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z")   #'helm-select-action)

  ;; Help keybindings corretti
  (with-eval-after-load 'help
    (define-key help-map (kbd "C-f") #'helm-apropos)
    (define-key help-map (kbd "r")   #'helm-info-emacs)
    (define-key help-map (kbd "C-l") #'helm-locate-library))

  ;; Eshell history
  (add-hook 'eshell-mode-hook
            (lambda ()
              (define-key eshell-mode-map (kbd "M-l")
                #'helm-eshell-history))))

;;; -------------------------
;;; helm-projectile
;;; -------------------------

(use-package helm-projectile
  :after (helm projectile)
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm
        projectile-indexing-method 'alien))

(provide 'setup-helm)
