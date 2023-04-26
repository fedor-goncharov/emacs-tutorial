(electric-indent-mode +1)

(setq straight-check-for-modifications (quote (find-when-checking)))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'org)
(straight-use-package 'org-contrib)

(straight-use-package 'use-package)

(require 'use-package)

(straight-use-package 'magit)

(straight-use-package 'vertico)

(use-package vertico
  :init
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  ;;
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
  (setq vertico-cycle t
        enable-recursive-minibuffers t)
  (vertico-mode +1))

(straight-use-package 'marginalia)

(use-package marginalia
  :bind
  (:map minibuffer-local-map ("C-M-a" . marginalia-cycle))
  :init
  (marginalia-mode +1))

(straight-use-package '(modus-themes :source  emacsmirror-mirror))

(use-package modus-themes
  :config
  (load-theme 'modus-vivendi :no-confirm))
