;; init.el — minimal Corfu + Eglot (C/C++/Python)

(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; -----------------------
;; Completion UI: Corfu
;; -----------------------
(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.0)
  (corfu-cycle t)
  (corfu-max-candidates 20)
  :bind
  (:map corfu-map
        ("C-n" . corfu-next)
        ("C-p" . corfu-previous)
        ("TAB" . corfu-insert)))

;; Emacs completion behavior
(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (completion-cycle-threshold 3)
  (read-extended-command-predicate
   #'command-completion-default-include-p))

;; -----------------------
;; LSP: Eglot
;; -----------------------
(use-package eglot
  :hook ((c-mode c++-mode python-mode) . eglot-ensure)
  :config
  ;; Usa clangd-16 per C/C++
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode) . ("clangd-16"))))

;; -----------------------
;; Diagnostics
;; -----------------------
(use-package flymake)

;; -----------------------
;; Python (builtin)
;; -----------------------
(use-package python)

(use-package exec-path-from-shell
  :if (memq window-system '(x pgtk wayland))
  :config
  (exec-path-from-shell-initialize))

;; -----------------------
;; UI basics
;; -----------------------
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(global-display-line-numbers-mode t)

(message "Emacs ready 🚀")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(almost-mono-themes embark-consult embark consult marginalia orderless exec-path-from-shell projectile ggtags corfu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Almost Mono Black Theme
(use-package almost-mono-themes
  :ensure t
  :config
  ;; Carica subito la variante nera
  (load-theme 'almost-mono-black t))

;; Barre nere / minimal setup
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; menu-bar colore personalizzato (solo GUI)
(set-face-attribute 'menu-bar nil
                    :background "#000000"
                    :foreground "#ffffff")

;; mode-line
(set-face-attribute 'mode-line nil
                    :background "#000000"
                    :foreground "#ffffff"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :background "#111111"
                    :foreground "#888888"
                    :box nil)

;; header-line (se usato)
(set-face-attribute 'header-line nil
                    :background "#000000"
                    :foreground "#ffffff"
                    :box nil)(set-face-attribute 'menu-bar nil
                    :background "#000000"
                    :foreground "#ffffff")
