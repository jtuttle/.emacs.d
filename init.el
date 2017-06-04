;; Remove mouse interface early to avoid momentary display
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

;; Remove other UI non-essentials
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Relegate backup files to a more convenient place
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; Specify file for config added by Custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Additional package managers
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)

;; Use space instead of tabs
(setq-default indent-tabs-mode nil)

;; Show line numbers to left of file
(global-linum-mode t)

;; Show column number next to line number
(column-number-mode 1) 

;; Easier mark selection
(transient-mark-mode 1) 

;; Expand window on open
(when window-system
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 200 63))

;; S-Arrow to focus window
(require 'windmove)
(windmove-default-keybindings)

;; C-S-Arrow to resize windows
(require 'windsize)
(windsize-default-keybindings)

;; M-Arrow to skip blocks vertically
(global-set-key (kbd "<M-up>") 'backward-paragraph)
(global-set-key (kbd "<M-down>") 'forward-paragraph)

;; File auto-completion
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; JSX mode
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)
