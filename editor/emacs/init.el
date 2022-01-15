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

(use-package shell-pop
  :bind (("C-t" . shell-pop))
  :config
  (setq shell-pop-shell-type
	(quote ("ansi-term" "*ansi-term*"
		(lambda nil (ansi-term shell-pop-term-shell)))))
  (setq shell-pop-term-shell "fish")
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))

(use-package org
  :config
  (setq org-agenda-files '("~/.journal"))

  ;; todo states
  (setq org-todo-keywords
      (quote ((sequence "TODO(t)" "IN PROGRESS(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))
  (setq org-todo-keyword-faces
      (quote (("TODO" :foreground "pink" :weight bold)
              ("IN PROGRESS" :foreground "yellow" :weight bold)
              ("DONE" :foreground "light green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "red" :weight bold))))

  ;; agenda view
  (setq org-agenda-compact-blocks t)

  ;; capture templates
  (setq org-capture-templates
	'(("t" "todo" entry (file "~/.journal/TODOS.org")
	   "* TODO %?"))))

(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :config
  (setq org-roam-directory "~/org/roam")
  (setq org-roam-dailies-directory "daily"))

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

(use-package ido-vertical-mode
  :init
  (ido-vertical-mode 1))


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

;; disable tabs for indentation
(setq-default indent-tabs-mode nil)

;; show trailing whitespace
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)

;; kill whole line with C-k
(setq kill-whole-line t)

;; display column number in mode line
(column-number-mode 1)

;; org-roam mode
(org-roam-db-autosync-mode)

;; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; erc
(setq erc-kill-buffer-on-part t)
(setq erc-kill-queries-on-quit t)
(setq erc-kill-server-buffer-on-quit t)
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

;; hooks
(defun org-mode-config ()
  (visual-line-mode -1)
  (visual-fill-column-mode -1)
  (auto-revert-mode))
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

;; quick buffer switching
;; https://emacsredux.com/blog/2013/04/28/switch-to-previous-buffer/
(defun quick-switch-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key (kbd  "C-.") 'quick-switch-previous-buffer)

;; eval elisp
(global-set-key (kbd "C-c e") 'eval-expression)

;; terminal
(global-set-key (kbd "C-x t") 'multi-term)
(global-set-key (kbd "C-x v t") 'multi-vterm)

;; org-mode
(global-set-key (kbd "C-c a") 'org-agenda-list)
(global-set-key (kbd "C-c l") 'org-todo-list)
(global-set-key (kbd "C-c t")
		'(lambda ()
		   (interactive)
		   (org-capture nil "t")))

;; org-roam
(global-set-key (kbd "C-c n") 'org-roam-node-find)
(global-set-key (kbd "C-c d") 'org-roam-dailies-capture-today)
(global-set-key (kbd "C-c g d") 'org-roam-dailies-goto-today)

