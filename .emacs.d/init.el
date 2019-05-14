;;; init.el --- Load the full configuration -*- lexical-binding: t -*-

;; Produce backtraces when errors occur
(setq debug-on-error t)

(message "In Emacs init.")

(setq backup-directory-alist '(("." . "/mnt/")))