(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (funcall mode -1))

(require 'package)
(set 'package-enable-at-startup nil)
(set 'package-archives '())
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; defaults

(prefer-coding-system 'utf-8)

(when (window-system)
  (add-to-list 'initial-frame-alist '(width . 145))
  (add-to-list 'initial-frame-alist '(height . 45))
  (add-to-list 'default-frame-alist '(top . 50))
  (add-to-list 'default-frame-alist '(left . 30))
  (set-face-font 'default "-*-Menlo-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1"))

(set 'dired-use-ls-dired nil)

(set-frame-parameter (selected-frame) 'alpha '(100 100))
(add-to-list 'default-frame-alist '(alpha 100 100))

(require 'zenburn-theme)

(set 'visible-bell nil)
(set 'ring-bell-function (lambda ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line)))

(set 'inhibit-startup-message t)
(set 'default-cursor-type 'box)
(set 'mouse-wheel-progressive-speed nil)
(set 'mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(set 'make-backup-files nil)
(set 'create-lockfiles nil)

(set-default 'indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)

(global-linum-mode +1)
(global-auto-revert-mode +1)
(blink-cursor-mode -1)
(column-number-mode +1)
(show-paren-mode +1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(server-start)

;; keybindings

(global-set-key (kbd "s-\\") 'keyboard-quit)
(global-set-key (kbd "s-<left>") 'back-to-indentation)
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<right>") 'end-of-line)
(global-set-key (kbd "s-<down>") 'end-of-buffer)
(global-set-key (kbd "s-<return>") '(lambda ()
  (interactive) (end-of-line) (newline-and-indent)))
(global-set-key (kbd "s-<backspace>") '(lambda ()
  (interactive) (delete-region (line-beginning-position) (point))))
(global-set-key (kbd "s-F") 'rgrep)
(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-W") 'delete-frame)
(global-set-key (kbd "s-n") 'switch-to-buffer)
(global-set-key (kbd "s-N") 'make-frame)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)
(global-set-key (kbd "M-s-<right>") 'forward-word)
(global-set-key (kbd "M-s-<left>") 'backward-word)
(global-set-key (kbd "s->") 'next-buffer)
(global-set-key (kbd "s-<") 'previous-buffer)
(global-set-key (kbd "s-?") 'buffer-menu)
(global-set-key (kbd "s-o") 'find-file)
(global-set-key (kbd "s-O") 'ns-open-file-using-panel)
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)

;; completion

(require 'company)

(set 'company-idle-delay 0.3)
(set 'company-tooltip-limit 10)

(global-company-mode +1)

;; project management

(require 'projectile)

(global-set-key (kbd "s-t") 'projectile-find-file)
(global-set-key (kbd "s-p") 'projectile-switch-project)

(projectile-global-mode +1)

;; elixir-mode

(require 'alchemist)

(define-key company-active-map (kbd "TAB") 'company-complete-selection)

;; undo as a tree

(require 'undo-tree)

(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-Z") 'undo-tree-redo)
