;; Remove startup screen from emacs
;; (setq inhibit-startup-screen t)

;; start package.el with emacs
(require 'package)

;; the MELPA that works on Windows 10
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; initialize package.el
(package-initialize)

;; start emacs with a full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; start auto-complete with emacs
;; package-install: auto-complete
(require 'auto-complete)
;; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; start yasnippet with emacs
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

;; Comment / Uncomment Region key binding
;; package-install: use-package
(bind-keys*
 ("C-c C-c" . comment-region)
 ("C-u C-u" . uncomment-region))

;; Keybindings for goto-last-change
(bind-keys*
 ("C-." . goto-last-change))

;; Keybindings for highlight changes or view whitespacen
;; (bind-keys*
;; ("C-," . minimap-mode))
;; ("C-[" . blank-mode))
;; ("C-," . highlight-changes-mode))

;; minimap on the right
;; (setq minimap-window-location 'right)

;; Turn off scrollbar
(scroll-bar-mode -1)

;; Set Transparency
(set-frame-parameter (selected-frame) 'alpha '(92 . 92))
(add-to-list 'default-frame-alist '(alpha . (92 . 92)))

;; package-install: beacon
(beacon-mode 1)

;; package-install: indent-guide
(indent-guide-global-mode)

;; electric pair
(electric-pair-mode)

;; package-install: helm-gtags
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-,") 'helm-gtags-dwim)

;; ;; helm-bookmarks
;; (bind-keys*
;;  ("C-9" . helm-bookmarks)
;;  ("C-0" . bookmark-set)
;;  ("C--" . bookmark-delete))

;; better minimize / maximize
(bind-keys*
 ("C--" . text-scale-decrease)
 ("C-=" . text-scale-increase))

;; From M-x customize
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(beacon-blink-delay 0.15)
 '(beacon-blink-duration 0.35)
 '(beacon-mode t)
 '(beacon-size 50)
 '(blink-cursor-mode nil)
 '(cursor-type (quote box))
 '(custom-enabled-themes (quote (manoj-dark)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (lorem-ipsum rjsx-mode js2-mode helm-gtags auto-complete-c-headers web-mode-edit-element web-mode elpy indent-guide beacon focus rainbow-delimiters redo+ blank-mode flycheck-color-mode-line flycheck-pycheckers evil-surround evil-magit powerline evil-escape evil evil-visual-mark-mode use-package php-mode magit pkgbuild-mode multi-term paradox racket-mode emmet-mode sed-mode sml-mode tronesque-theme 2048-game chess zone-rainbow zone-nyan rainbow-mode pacmacs flycheck yasnippet multiple-cursors linum-relative expand-region emojify disable-mouse auto-complete aggressive-indent ace-jump-mode)))
 '(paradox-github-token t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "PfEd" :family "DejaVu Sans Mono"))))
 '(ac-gtags-candidate-face ((t (:inherit ac-candidate-face :background "cyan" :foreground "black"))))
 '(ac-gtags-selection-face ((t (:background "cyan" :foreground "black"))))
 '(ggtags-global-line ((t (:inherit nil :background "cyan" :foreground "black"))))
 '(minimap-active-region-background ((t (:background "gray15")))))

;; Set font size
(set-face-attribute 'default nil :height 115)

;; Set Internal Window Borders
(set-fringe-mode 0)

;; Set highlight to cyan
(set-face-attribute 'region nil :background "#00ffff" :foreground "#000000")

;; Set cursor color to orange
(set-cursor-color "#ffa500")

;; Remove bottom mode line
(setq-default mode-line-format nil)

;; Turn on IDO mode
(require 'ido)
(ido-mode t)

;; No tabs
(setq-default indent-tabs-mode nil)

;; Other goodies
;; package-install: pacmacs
;;                : zone-rainbow
;;                : zone-nyan
;;                : 2048-game
