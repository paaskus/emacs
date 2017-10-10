;; INSTALL PACKAGES
;; --------------------------------------
(package-initialize)

;; MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    latex-preview-pane
    latex-extra
    latex-pretty-symbols
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

;; Hide toolbar
(tool-bar-mode -1)

;; Paren mode (highlight matching parentheses)
(show-paren-mode 1)

;; Default zoom/font size
(set-face-attribute 'default nil :height 90)

;; Indent using spaces
(setq-default indent-tabs-mode nil)

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
(add-hook 'LaTeX-mode-hook #'latex-extra-mode) ;; latex-extra
(require 'latex-pretty-symbols) ;; pretty symbols

;; Python
(elpy-enable) ;; enable elpy

;; init.el ends here
