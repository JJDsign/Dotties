(require 'helm-config)
(require 'projectile)
(require 'helm-projectile)

;; Helm settings
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)

;; Projectile
(projectile-global-mode)

;; Open file in project
(global-set-key (kbd "C-c o") 'helm-projectile-find-file)
;; Find in files
(global-set-key (kbd "C-c f") 'helm-ag)
;; Switch project
(global-set-key (kbd "C-c s") 'helm-projectile-switch-project)