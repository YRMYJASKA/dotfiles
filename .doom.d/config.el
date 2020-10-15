;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jyry U.R. Hjelt"
      user-mail-address "jyry@jyryhjelt.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Shared/Org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; GO-config
(use-package! go-mode)

;; Org mode config
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;;; Start from today, not monday
(setq org-agenda-start-on-weekday nil
      org-agenda-start-day "-0d")
;;; Add gnuplot to my Org files. Yummy.
(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)))

;; Email configuration
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(setq +mu4e-backend 'offlineimap)
(setq mu4e-maildir "~/Mail")
(setq mu4e-get-mail-command "offlineimap")
(set-email-account! "jyryhjelt.com"
 '((mu4e-sent-folder       . "/Jyryhjelt/INBOX.Sent")
   (mu4e-drafts-folder     . "/Jyryhjelt/INBOX.Drafts")
   (mu4e-trash-folder      . "/Jyryhjelt/INBOX.Trash")
   (smtpmail-smtp-user     . "jyry@jyryhjelt.com")
   (user-mail-address      . "jyry@jyryhjelt.com")    ;; only needed for mu < 1.4
    (mu4e-compose-signature . "---\nJyry U.R. Hjelt"))
  t)
;;; Sending email
(setq mu4e-sent-folder "~/Mail/sent"
      mu4e-drafts-folder "~/Mail/Jyryhjelt/INBOX.Drafts"
      user-mail-address "jyry@jyryhjelt.com")

(defvar my-mu4e-account-alist
  '(("jyryhjelt.com"
     (mu4e-sent-folder "/Jyryhjelt/INBOX.Sent")
     (user-mail-address "jyry@jyryhjelt.com")
     (smtpmail-smtp-user "jyry@jyryhjelt.com")
     (smtpmail-local-domain "jyryhjelt.com")
     (smtpmail-default-smtp-server "smtp.hostinger.com")
     (smtpmail-smtp-server "smtp.hostinger.com")
     (smtpmail-smtp-service 587)
     )
    ))

(defun my-mu4e-set-account ()
  "Set the account for composing a message.
   This function is taken from:
     https://www.djcbsoftware.nl/code/mu/mu4e/Multiple-accounts.html"
  (let* ((account
    (if mu4e-compose-parent-message
        (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
    (string-match "/\\(.*?\\)/" maildir)
    (match-string 1 maildir))
      (completing-read (format "Compose with account: (%s) "
             (mapconcat #'(lambda (var) (car var))
            my-mu4e-account-alist "/"))
           (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
           nil t nil nil (caar my-mu4e-account-alist))))
   (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
  (mapc #'(lambda (var)
      (set (car var) (cadr var)))
        account-vars)
      (error "No email account found"))))
(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(setq org-src-fontify-natively t)
