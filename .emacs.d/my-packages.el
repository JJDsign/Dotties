; ~/.emacs.d/my-packages.el
(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar required-packages
  '(
    scss-mode
    web-mode
    clojure-mode
    helm
    helm-ag
    projectile
    helm-projectile
  ) "a list of packages to ensure are installed at launch.")

;; Method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
    when (not (package-installed-p p)) do (return nil)
    finally (return t)))

;; If not all packages are installed, check one by one and install the missing ones
(unless (packages-installed-p)
  ;; Check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " Done.")
  ;; Install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
            (package-install p))))

;; Clone from git helm and async first
;; Helm and async
(add-to-list 'load-path "~/.emacs.d/async")
(add-to-list 'load-path "~/.emacs.d/helm")