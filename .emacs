(package-initialize)

;; Hide toolbar
(tool-bar-mode -1)

;; Hide splash screen
(setq inhibit-startup-message t)

;; Paren mode (highlight matching parentheses)
(show-paren-mode 1)

;; Default zoom/font size
(set-face-attribute 'default nil :height 90)

;; Indent using spaces
(setq-default indent-tabs-mode nil)

;; Auto-enable linum-mode
(global-linum-mode 1)

;; MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; Use web-mode for .html.erb files
(add-to-list 'auto-mode-alist '("\\.html.erb\\'" . web-mode))

;; Markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (adwaita)))
 '(markdown-command "pandoc"))

;; Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; JDEE
(require 'jdee)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Tiger mode (dOvs programming language)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'tiger)
(add-to-list 'auto-mode-alist '("\\.tig$" . tiger-mode))

;; LaTeX
(latex-preview-pane-enable) ;; Load latex-preview pane automatically with LaTeX files
