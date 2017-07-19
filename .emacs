;; Remove startup screen from emacs
(setq inhibit-startup-screen t)

;; start package.el with emacs
(require 'package)

;; add MELPA to repository list
;; (add-to-list 'package-archives
;; 	     '("melpa" . "https://melpa.org/packages/"))
;; (when (< emacs-major-version 24)

;; the MELPA that works on Windows 10
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/")
  )

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
;; package-install: auto-complete
(require 'auto-complete)
;; do default config for auto-complete
 (require 'auto-complete-config)
 (ac-config-default)

;; start yasnippet with emacs
;; package-install: yasnippet
(require 'yasnippet)
(yas-global-mode t)
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-header)
  (add-to-list 'ac-sources 'ac-source-c-headers))
;; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; Find out how to get relative line numbers!

;; Multiple cursors!!!
;; package-install: multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Display emojis
;; package-install: emojify
;;(add-hook 'after-init-hook #'global-emojify-mode)

;; Turn off mouse
;; package-install: disable-mouse
(require 'disable-mouse)
(global-disable-mouse-mode)

;; Expand region
;; package-install: expand-region
(require 'expand-region)
(global-set-key (kbd "C-;") 'er/expand-region)
(setq shift-select-mode nil)

;; Aggressive Indent
;; package-install: aggressive-indent
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'css-mode-hook #'aggressive-indent-mode)

;; Windmove (S-up, S-down etc.)
(windmove-default-keybindings)

;; Get rid of ~ files
(setq make-backup-files nil)

;; Ace-Jump-Mode
;; package-install: ace-jump-mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-'") 'ace-jump-mode)

;; Enable Flycheck
;; package-install: flycheck
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
 '(package-selected-packages
   (quote
    (tronesque-theme 2048-game chess zone-rainbow zone-nyan rainbow-mode pacmacs flycheck yasnippet multiple-cursors linum-relative expand-region emojify disable-mouse auto-complete aggressive-indent ace-jump-mode)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "PfEd" :family "DejaVu Sans Mono")))))

;; Set font size
(set-face-attribute 'default nil :height 115)

;; Other goodies
;; package-install: pacmacs
;;                : zone-rainbow
;;                : zone-nyan
;;                : 2048-game
