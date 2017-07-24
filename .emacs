;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'package-archives
'("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 (quote
		("60c23c3a831c9f28b10084e8642b7d987d33be3faee8f68d68d1cf6b171041da" default)))
 '(package-selected-packages
	 (quote
		(flycheck coffee-mode ein magit jedi go-mode auto-complete)))
 '(safe-local-variable-values
	 (quote
		((coffee-tab-width . 2)
		 (eval setq flycheck-gcc-include-path
					 (quote
						("../../../submodules/cpython/Include" "../../../submodules/cpython")))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(setq backup-directory-alist `(("." . "~/.saves")))
(load-file "~/.emacs.d/themes/custom-theme.el")
(load-theme 'custom t)

(setq default-tab-width 2)

(setq show-trailing-whitespace t)

(require 'paren)
(show-paren-mode t)
(setq show-paren-delay 0)

(add-hook 'python-mode-hook 'flycheck-mode)
(setq flycheck-check-syntax-automatically '(save))

(eval-after-load "python"
  '(progn
     (setq
      python-check-command "pylint"
      python-shell-virtualenv-path "~/.virtualenvs")))

