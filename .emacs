;; start package.el with emacs
(require 'package)

;; add MELPA to repository list
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)

;; For important compatibility libraries like cl-lib
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) 

;; initialize package.el
(package-initialize)

;; start emacs with a full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; start emacs with vertical split
(split-window-right)

;; start auto-complete with emacs
(require 'auto-complete)
;; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode t)
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-header)
  (add-to-list 'ac-sources 'ac-source-c-headers))
;; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; Turn off linum
(defun nolinum()
  (global-linum-mode 0)
  )
(add-hook 'org-mode-hook 'nolinum)

;; M-x global-relative-line-numbers-mode
(global-relative-line-numbers-mode)

;; Multiple cursors!!!
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Display emojis
(add-hook 'after-init-hook #'global-emojify-mode)

;; Turn off mouse
(require 'disable-mouse)
(global-disable-mouse-mode)

;; Expand region
(require 'expand-region)
(global-set-key (kbd "C-;") 'er/expand-region)
(setq shift-select-mode nil)

;; Aggressive Indent
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'css-mode-hook #'aggressive-indent-mode)

;; Windmove (S-up, S-down etc.)
(windmove-default-keybindings)

;; Get rid of ~ files
(setq make-backup-files nil)

;; Ace-Jump-Mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-'") 'ace-jump-mode)

;; Enable Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Other stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(blink-cursor-mode nil)
 '(cursor-type (quote box))
 '(custom-enabled-themes (quote (manoj-dark)))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "PfEd" :family "DejaVu Sans Mono")))))
