(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(use-package almost-mono-themes
  :config
  (load-theme 'almost-mono-black t))

(use-package org
  :config
  (setq org-agenda-files '("~/.journal"))
  (setq org-capture-templates
	'(("t" "todo" entry (file "~/.journal/TODOS.org")
	   "* TODO %?"))))

(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :config
  (setq org-roam-directory "~/org/roam")
  (setq org-roam-dailies-directory "daily"))

(use-package perspective
  :defer t
  :config
  (persp-mode)
  (persp-turn-on-modestring))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :commands lsp
  :config
  (setq lsp-ui-doc-enable nil))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package flycheck)

(use-package multi-term)

(setq inhibit-startup-message t)
(setq default-major-mode 'text-mode)

;; remove menu bar and tool bar
(menu-bar-mode 0)
(tool-bar-mode 0)

;; remove ring bell
(setq ring-bell-function 'ignore)

;; change backup and autosave directory
(setq backup-directory-alist '(("." . "~/tmp/emacs")))
(setq auto-save-file-name-transforms '((".*" "~/tmp/emacs" t)))

;; set default font size
(set-face-attribute 'default nil :height 140)

;; turn on perspective mode
(persp-mode)

;; enable org-roam
(org-roam-db-autosync-mode)

;; hooks
(defun org-mode-config ()
  (visual-line-mode -1)
  (visual-fill-column-mode -1))
(add-hook 'org-mode-hook 'org-mode-config)

(defun text-mode-config ()
  (visual-line-mode)
  (visual-fill-column-mode)
  (electric-indent-mode -1)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq indent-line-function (quote insert-tab)))
(add-hook 'text-mode-hook 'text-mode-config)

;; key-bindings

;; eval elisp
(global-set-key (kbd "C-c e") 'eval-expression)

;; terminal
(global-set-key (kbd "C-x t") 'multi-term)
(global-set-key (kbd "C-x v t") 'multi-vterm)

;; org-mode
(global-set-key (kbd "C-c a") 'org-agenda-list)
(global-set-key (kbd "C-c t")
		'(lambda ()
		   (interactive)
		   (org-capture nil "t")))

;; org-roam
(global-set-key (kbd "C-c n") 'org-roam-node-find)
(global-set-key (kbd "C-c d") 'org-roam-dailies-capture-today)
(global-set-key (kbd "C-c g d") 'org-roam-dailies-goto-today)

