(setq inhibit-startup-message t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)

(load-theme 'spacemacs-dark)
