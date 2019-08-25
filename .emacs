;; package --- summary

;;; Commentary
;;;
;;; This is my '.emacs' file since 20th of August 2019



;; Load all MELPA packages
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize) ; Load all of it

;; Set basic info about me, the user
(setq user-full-name "Jyry U. R. Hjelt")
(setq user-mail-address "hjelt.jyry@gmail.com")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Aesthetics
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load theme
(load-theme 'gruvbox t)

;; Turn off all the fuff that the graphical interface has by default
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Boot up straight into the empty scratch buffer
(setq inhibit-splash-screen t
      initial-scratch-message nil)

;; Stop creating unwanted files EVERYWHERE
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Just some hair-pulling repellant
(defalias 'yes-or-no-p 'y-or-n-p)

;; All the Icons
(require 'all-the-icons)

;; Awesome-tab
(add-to-list 'load-path (expand-file-name "~/.emacs.d/extra-includes"))

(require 'awesome-tab)
(awesome-tab-mode t)
(setq awesome-tab-style "bar")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto Complete
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)
(global-company-mode t)
(add-to-list 'company-backends 'company-jedi)
(add-to-list 'company-backends 'company-irony)
(add-to-list 'company-backends 'company-ghc)

;; Pairing 'pairables'
(electric-pair-mode 1)

;; YASnippet
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Writing config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LaTex
;; Auctex configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(require 'auctex-latexmk)
(auctex-latexmk-setup)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-electric-math t)
(with-eval-after-load "tex"
  (add-to-list 'TeX-view-program-list '("mupdf" "usr/bin/mupdff %o"))
  (setcdr (assq 'output-pdf TeX-view-program-selection) '("mupdf")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Programming Misc.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flycheck
(global-flycheck-mode 1)
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))

;; Irony
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Projectile
(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-k")  (lambda () (interactive) (beginning-of-line) (kill-line)))

(global-set-key (kbd "C-p")  'projectile-find-file) ; Remap Ctrl-P to finding a file. Transition thing from ViM, Ctrlp fuzzy finder

(add-hook 'c++-mode-hook (lambda () (global-set-key (kbd "C-;")  'clang-format-buffer)))
(add-hook 'c-mode-hook (lambda () (global-set-key (kbd "C-;")  'clang-format-buffer)))

(global-set-key (kbd "<M-left>")  'awesome-tab-backward)
(global-set-key (kbd "<M-right>")  'awesome-tab-forward)
(global-set-key (kbd "<M-up>")  'awesome-tab-backward-group)
(global-set-key (kbd "<M-down>")  'awesome-tab-forward-group)

(global-set-key "\C-x\p" 'reload-pdf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Machine-maintained Region
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" default)))
 '(package-selected-packages
   (quote
    (yasnippet-snippets auctex-latexmk yasnippet auctex markdown-preview-mode all-the-icons markdown-mode projectile irony flycheck-pycheckers flycheck-haskell flycheck-irony company-irony company-ghc company-jedi company gruvbox-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
