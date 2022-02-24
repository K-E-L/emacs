;; Remove startup screen from emacs
;; (setq inhibit-startup-screen t)

;; start package.el with emacs
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

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
;; package-install: yasnippet
(require 'yasnippet)
(yas-global-mode t)
(defun my:ac-c-header-init ()
  ;; (require 'auto-complete-c-header)
  ;; (add-to-list 'ac-sources 'ac-source-c-headers))

  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (setq achead:include-directories
        (append '("/usr/include/c++/4.8"
                  "/usr/include/x86_64-linux-gnu/c++/4.8"
                  "/usr/include/c++/4.8/backward"
                  "/usr/lib/gcc/x86_64-linux-gnu/4.8/include"
                  "/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed"
                  "/usr/include/x86_64-linux-gnu")
                achead:include-directories)))


;; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; Relative line numbers!
;; (require 'linum-relative)
;; (linum-mode)

;; Multiple cursors!!!
;; package-install: multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-v") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

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

;; Better minimize / maximize 
(bind-keys*
 ("C--" . text-scale-decrease)
 ("C-=" . text-scale-increase))

;; Better minimize / maximize 
(bind-keys*
 ("C-x n" . buffer-menu))

;; set PATH environment variables to match shell
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.
This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"
					  ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path-from-shell-PATH)

;; Tide for typescript
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))
(setq company-tooltip-align-annotations t)
;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)


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
 '(cursor-type 'box)
 '(custom-enabled-themes '(manoj-dark))
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(prettier company tide typescript-mode cmake-mode vterm js2-refactor eslint-fix vue-html-mode vue-mode dumb-jump lorem-ipsum rjsx-mode js2-mode auto-complete-c-headers web-mode-edit-element web-mode elpy indent-guide beacon focus rainbow-delimiters redo+ blank-mode flycheck-color-mode-line flycheck-pycheckers evil-surround evil-magit powerline evil-escape evil evil-visual-mark-mode use-package php-mode magit pkgbuild-mode multi-term paradox racket-mode emmet-mode sed-mode sml-mode tronesque-theme 2048-game chess zone-rainbow zone-nyan rainbow-mode pacmacs flycheck yasnippet multiple-cursors linum-relative expand-region emojify disable-mouse auto-complete aggressive-indent ace-jump-mode))
 '(paradox-github-token t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "PfEd" :family "DejaVu Sans Mono"))))
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

;; dumb-jump
;; package-install: dumb-jump
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
