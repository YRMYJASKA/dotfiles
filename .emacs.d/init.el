
;; Internal emacs config
;;; Just let this sit here for emacs to think about
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#222222" "#aa4450" "#87875f" "#cc8800" "#87AFD7" "#8787AF" "#87ceeb" "#c2c2b0"])
 '(custom-safe-themes
   '("6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" default))
 '(fci-rule-color "#62686E")
 '(jdee-db-active-breakpoint-face-colors (cons "#1d2127" "#87ceeb"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1d2127" "#87875f"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1d2127" "#686858"))
 '(objed-cursor-color "#aa4450")
 '(package-selected-packages
   '(org-projectile hl-todo yasnippet-snippets yasnippet flycheck-rust rustic jedi lsp-jedi spinner auctex lsp-ivy lsp-mode flycheck projectile doom-themes evil-org org-evil elfeed-org elfeed evil-collection evil-org-mode evil-magit magit org-bullets org-mode general evil all-the-icons counsel ivy-rich which-key ivy use-package))
 '(pdf-view-midnight-colors (cons "#c2c2b0" "#222222"))
 '(rustic-ansi-faces
   ["#222222" "#aa4450" "#87875f" "#cc8800" "#87AFD7" "#8787AF" "#87ceeb" "#c2c2b0"])
 '(vc-annotate-background "#222222")
 '(vc-annotate-color-map
   (list
    (cons 20 "#87875f")
    (cons 40 "#9e873f")
    (cons 60 "#b5871f")
    (cons 80 "#cc8800")
    (cons 100 "#dd8d00")
    (cons 120 "#ee9200")
    (cons 140 "#ff9800")
    (cons 160 "#d7923a")
    (cons 180 "#af8c74")
    (cons 200 "#8787AF")
    (cons 220 "#92708f")
    (cons 240 "#9e5a6f")
    (cons 260 "#aa4450")
    (cons 280 "#994d51")
    (cons 300 "#895654")
    (cons 320 "#785f55")
    (cons 340 "#62686E")
    (cons 360 "#62686E")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Visual stuff

;;; Remove all shit
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -10)
(set-fringe-mode 10) ;; set the amount of padding on the left
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq ring-bell-function 'ignore)

;; Environment stuff
(setenv "PATH" "~/.local/bin:/home/jyry/.cargo/bin:~/bin:/usr/local/bin:/usr/bin")
(setq exec-path (append exec-path '("/home/jyry/.local/bin" "/home/jyry/.cargo/bin")))

;;; Font settings
(set-face-attribute 'default nil :font "Source Code Pro" :height 140)

(dolist (mode '(term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

;;; Line Numbers
(column-number-mode)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(dolist (mode '(term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))
(global-hl-line-mode 1)

;;; Theme
(load-theme 'doom-sourcerer)

;; Initialise package functionality
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                          ("melpa-stable" . "https://stable.melpa.org/packages/")
			  ("org" . "https://orgmode.org/elpa/")
			  ("elpa" . "https://elpa.gnu.org/packages/")
			  ))
(package-initialize)
(unless package-archive-contents
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; General (AKA ripping off doom emacs)
(use-package general
  :config
  (general-create-definer yrmy/leader-keys
			  :keymaps '(normal)
			  :prefix "SPC"
			  :global-prefix "C-SPC")
  (yrmy/leader-keys
    "tt" '(counsel-load-theme :which-key "choose theme")
    "f" '(counsel-find-file :which-key "find file")
    "b" '(:ignore t :which-key "buffers")
    "bb" '(counsel-switch-buffer :which-key "switch buffers")
    "bk" '(kill-buffer :which-key "kill buffer")
    ;; Tab configuration
    "<tab>" '(:ignore t :which-key "tabs")
    "<tab>n" '(tab-new :which-key "new tab")
    "<tab>r" '(tab-rename :which-key "rename tab")
    "<tab>d" '(tab-close :which-key "close tab")
    "<tab>s" '(tab-switcher :which-key "select tab")
    "<tab>1" '(tab-bar-select-tab 1) ;; FIXME: worked once but never again after that
    "<tab>2" '(tab-bar-select 2)
    "<tab>3" '(tab-bar-select 3)
    "<tab>4" '(tab-bar-select 3)
    "<tab>5" '(tab-bar-select 3)
    )
  )
;; Key-bindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;;
;; PACKAGE SPECIFIC CONFIGURATION
;;


;; EVIL mode
(use-package evil
  :init
  (setq evil-want-integraton t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal))

(use-package evil-collection
  :after evil
  :custom (evil-collection-setup-minibuffer t)
  :init (evil-collection-init))

;; Ivy set-up
(use-package ivy
  :diminish
  :bind (
	 :map ivy-minibuffer-map
      	      ("C-j" . ivy-next-line)
	      ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	      ("C-k" . ivy-previous-line)
	      ("C-j" . ivy-next-line)
	      ("C-l" . ivy-done))
:config
(ivy-mode 1))

;;; Add counsel
(use-package counsel
  :init
  (counsel-mode 1))

;;; Add better tooltips
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))


;; Which-key
;; Gives me advice on what to press
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; All the Icons
(use-package all-the-icons)

;; Org-mode
(defun yrmy/org-mode-setup ()
  (visual-line-mode 1)) 

(use-package org
  :config
  (setq org-directory "~/Shared/Org")
  (setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w)"  "HOLD(h)" "PROJ(p)" "|" "DONE(d)" "CANCELLED(c)"))) 
  ;; Org-agenda set-up
  (setq org-agenda-start-on-weekday nil)
  (setq agenda-start-day "-0d")
  (setq org-agenda-files '("~/Shared/Org/inbox.org" "~/Shared/Org/projects.org")))
(use-package org-bullets
  :after org
  :hook (org-mode .  org-bullets-mode))
(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;;; Leader key-bindings for Org
(yrmy/leader-keys
  "o" '(:ignore t :which-key "Org-mode")
  "oA" 'org-agenda)


;; Git with Magit
(use-package magit
  :commands (magit-status magit-get-current-branch))
(yrmy/leader-keys
  "g" '(:ignore t :which-key "Git")
  "gs" 'magit-status
  "gd" 'magit-diff-unstaged
  "gf" 'magit-fetch
  "gd" 'magit-diff-unstaged)

;; Elfeed for my RSS needs
(use-package elfeed
  :config
  (setq browse-url-browser-function 'eww-browse-url))
(use-package elfeed-org
  :after elfeed
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/Shared/Org/rssfeed.org")))
(yrmy/leader-keys
  "r" '(:ignore t :which-key "rss")
  "rr" 'elfeed
  "ru" 'elfeed-update)

;; Projectile
(use-package projectile
  :config (projectile-mode +1))
(use-package org-projectile
  :after (org projectile)
  :bind (("C-c n p" . org-projectile-project-todo-completing-read)
         ("C-c c" . org-capture))
  :config
  (push (org-projectile-project-todo-entry) org-capture-templates))
(yrmy/leader-keys
  "p" 'projectile-command-map)
;; FLycheck
(use-package flycheck
  :config
  (global-flycheck-mode))

;; LSP (because of course)
(use-package company)
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c++-mode . lsp)
         (c-mode . lsp)
         (python-mode . lsp)
         (rustic-mode . lsp)
         (or-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  ; Not so sure whether I want this or not but could be useful
  ;  (setq lsp-clients-clangd-args '("-j=4" "-background-index" "-log=error"))

  (setq lsp-completion-provider :capf)
  (setq lsp-completion-enable t)
  )
(use-package lsp-ivy
  :after lsp-mode)



;; Latex
(defun yrmy/asy-compile ()
  (interactive)
  (shell-command "asy asyfigs/*.asy -o asyfigs/"))
(add-hook 'LaTeX-mode-hook
	  (lambda () (local-set-key (kbd "C-c C-a") 'yrmy/asy-compile)))

;; Python
;; (use-package jedi)
;; (use-package lsp-jedi
;;   :ensure t
;;   :config
;;   (with-eval-after-load "lsp-mode"
;;     (add-to-list 'lsp-disabled-clients 'pyls)
;;     (add-to-list 'lsp-enabled-clients 'jedi)))

;; Rust config
(use-package rustic)
(use-package flycheck-rust
  :after flycheck)
(setq rustic-lsp-server 'rust-analyzer)
(setq lsp-rust-analyzer-server-command '("/home/jyry/.local/bin/rust-analyzer")) ; This took forever to figure out


;; YASnippet
(use-package yasnippet
  :config
  (yas-global-mode 1))
(use-package yasnippet-snippets
  :after yasnippet)

;; Electric
(use-package electric
  :config
  (electric-pair-mode 1))

;; HL-todo
(use-package hl-todo
  :config
  (hl-todo-mode t))
