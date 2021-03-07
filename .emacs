(package-initialize)

;; packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org./packages/") t)
  )

;; set by custom when we install packages via melpa
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (sqlformat blacken auto-dim-other-buffers dimmer python-black emacsql-psql ob-sql-mode py-isort tide typescript-mode py-yapf flycheck-mypy jupyter flymake pg dockerfile-mode docker docker-cli magit yaml-mode pytest pyenv-mode-auto graphql graphql-mode json-mode ein flycheck-pyflakes projectile jedi))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-dim-other-buffers-face ((t (:background "color-240")))))

;; self-explanatory
(setq default-tab-width 2)

;; self-explanatory
(setq show-trailing-whitespace t)

;; don't show the emacs menu bar
(menu-bar-mode -1)

;; allow projectile to be run in any project
(projectile-global-mode)

;; show what column we're in at the bottom of our editor
(setq column-number-mode t)

;; when we hover over a paren, highlight the matching paren
(require 'paren)
(show-paren-mode t)
(setq show-paren-delay 0)

;; custom theme
(load-file "~/.emacs.d/themes/custom-theme.el")
(load-theme 'custom t)

;; jedi setup
;; don't forget to install virtualenv for jedi to work!
(setq jedi:setup-keys t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)  

;; make backup files automatically save to this directory
(setq backup-directory-alist `(("." . "~/.saves")))

;; auto-run flycheck on save
(add-hook 'python-mode-hook 'flycheck-mode)
(setq flycheck-check-syntax-automatically '(save))

;; have projectile run on this keybinding
(global-set-key (kbd "C-x p") 'projectile-find-file)

;; json formatter command
(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
     "python -mjson.tool" (current-buffer) t)))

(global-set-key (kbd "C-x r") 'replace-string)
(global-set-key (kbd "C-x /") 'comment-region)
(global-set-key (kbd "C-x \\") 'uncomment-region)
