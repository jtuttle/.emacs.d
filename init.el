;; Remove splash screen
(setq inhibit-splash-screen t)

;; Relegate backup files to a more convenient place
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; Use space instead of tabs
(setq-default indent-tabs-mode nil)

;; shows column number next to line number
(column-number-mode 1) 

;; easier mark selection
(transient-mark-mode 1) 

;; Hide various UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Expand window on open
(when window-system
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 200 63))

;; Additional package managers
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)

;; S-Arrow to focus window
(require 'windmove)
(windmove-default-keybindings)

;; C-S-Arrow to resize windows
(require 'windsize)
(windsize-default-keybindings)
