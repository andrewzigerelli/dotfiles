;; garbage collection increase for startup (500MB)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq gc-cons-threshold (* 500 1024 1024))

;; disable splash
(setq inhibit-splash-screen t)

;; for backups
(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist
      '(("." . "~/.saves"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; key mappings
(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super) ; Left Windows key

;; key mapping and functions to quickly find file in home directory
(when (string-equal (system-name) "DESKTOP-V4I4CP4")
  (global-set-key (kbd "C-s-h") (lambda()(interactive) (insert "/mnt/c/Users/Andrew")))
  )

(global-set-key (kbd "s-y") 'clipboard-yank)


;; prevent kill and yank from contaminating system keyboard
(setq x-select-enable-clipboard nil)

;; fix cursor
(setq-default cursor-type '(bar . 1))


;; package archives
(require 'package)

;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives  '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; use-package
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

;; pandoc-mode
(use-package pandoc-mode
  :defer t)
(add-hook 'markdown-mode-hook 'pandoc-mode)
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; magit
(use-package magit
  :defer t)

;; elpy
(use-package elpy
    :commands elpy-enable
    :init (with-eval-after-load 'python (elpy-enable))
    )
;; (elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
;;;;;;fix for zsh
(setenv "PATH" (concat (getenv "PATH") ":~/.local/bin"))
(setq exec-path (append exec-path '("~/.local/bin")))
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

;; yasnippet
;; (use-package yasnippet)

;;; pdf-tools
(use-package pdf-tools
  :defer t
  :ensure t
  :config
  (pdf-tools-install)
  )

;; org ref
(unless (package-installed-p 'org-ref)
  (package-refresh-contents)
  (package-install 'org-ref))
(use-package org-ref
  :after org
  :init)

;; reset garbage collection
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 5 1024 1024))))

;; setup notetaking workflow
(when (string-equal (system-name) "DESKTOP-V4I4CP4")
  (setq org-ref-notes-directory "/mnt/c/Users/Andrew/OneDrive - University of Pittsburgh/Andrew @ University of Pittsburgh/org/ref/notes"
      org-ref-bibliography-notes "/mnt/c/Users/Andrew/OneDrive - University of Pittsburgh/Andrew @ University of Pittsburgh/org/ref/articles.org"
      org-ref-default-bibliography '("/mnt/c/Users/Andrew/OneDrive - University of Pittsburgh/Andrew @ University of Pittsburgh/org/ref/articles.bib")
      org-ref-pdf-directory "/mnt/c/Users/Andrew/OneDrive - University of Pittsburgh/Andrew @ University of Pittsburgh/org/ref/pdfs/")
  )
;; helm-notes
(when (string-equal (system-name) "DESKTOP-V4I4CP4")
  (setq helm-bibtex-bibliography "/mnt/c/Users/Andrew/OneDrive - University of Pittsburgh/Andrew @ University of Pittsburgh/org/ref/articles.bib"
      helm-bibtex-library-path "/mnt/c/Users/Andrew/OneDrive - University of Pittsburgh/Andrew @ University of Pittsburgh/org/ref/pdfs"
      helm-bibtex-notes-path "/mnt/c/Users/Andrew/OneDrive - University of Pittsburgh/Andrew @ University of Pittsburgh/org/ref/articles.org")
  )
  
;; flycheck
(use-package flycheck
  :defer t)

;; which-key
(use-package which-key
  :ensure t
  :defer t
  :diminish which-key-mode
  :init
  (setq which-key-sort-order 'which-key-key-order-alpha)
  :bind* (("M-m ?" . which-key-show-top-level))
  :config
  (which-key-mode)
  (which-key-add-key-based-replacements
    "M-m ?" "top level bindings"))

;; i'm a vim user at heart
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  ;; More configuration goes here
  )

;; tex
(use-package auctex
  :defer t
  :ensure t)

;; evil mode settings
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))
