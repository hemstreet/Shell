;;; init.el --- Load the full configuration -*- lexical-binding: t -*-

;; Produce backtraces when errors occur
(setq debug-on-error t)

;; Initialize preferences
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Package repositories
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Custom Packages
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Initialize
(package-initialize)
(add-hook 'after-init-hook (lambda () (load-theme 'nord)))

(defvar --backup-directory (getenv "EMACS_BACKUP_DIR"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

(setq eshell-directory-name --backup-directory)

;; Vim mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("14de8f58ad656af5be374086ae7ab663811633fc1483a02add92f7a1ff1a8455" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
