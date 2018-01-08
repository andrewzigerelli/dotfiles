;; global settings

;; garbage collection increase for startup (500MB)
(setq gc-cons-threshold (* 500 1024 1024))

;; disable splash
(setq inhibit-splash-screen t)

;; prevent kill and yank from contaminating system keyboard
(setq x-select-enable-clipboard nil)

;; fix cursor
(setq-default cursor-type '(bar . 1))

;; package archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; install and enable org
(unless (package-installed-p 'org)
  (package-refresh-contents)
  (package-install 'org))
(require 'org)
