;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

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
		(rjsx-mode yaml-mode virtualenvwrapper helm-mt projectile flycheck-haskell flymake-google-cpplint function-args cpputils-cmake auto-complete-c-headers go-autocomplete racer flycheck-cython flymake-go flymake-cppcheck flycheck-pyflakes flycheck-rust cargo csv-mode jdee melpa-upstream-visit jedi tide ## typescript-mode flycheck coffee-mode ein magit go-mode auto-complete)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jdee-font-lock-public-face ((t (:foreground "green" :weight light)))))

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

(put 'downcase-region 'disabled nil)

(menu-bar-mode -1)

;; Ensure the go specific autocomplete is active in go-mode.
(with-eval-after-load 'go-mode
   (require 'go-autocomplete))
(require 'auto-complete-config)

(projectile-global-mode)

(require 'helm-mt)
(global-set-key (kbd "C-x t") 'helm-mt)

(defun my-term-hook ()
  (define-key term-mode-map (kbd "C-j") 'term-char-mode)
  (define-key term-raw-map (kbd "C-j") 'term-line-mode)
  (define-key term-raw-map [(control ?p)] 'term-send-raw)
  (define-key term-raw-map [(control ?n)] 'term-send-raw)
  (define-key term-raw-map [(meta ?d)] 'term-send-forward-kill-word)
)

(add-hook 'term-mode-hook 'my-term-hook)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r")
                                         'go-remove-unused-imports)))
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))
(eval-after-load 'go-mode
  '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

(setq multi-term-program "/bin/bash")

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

 (setq column-number-mode t)
