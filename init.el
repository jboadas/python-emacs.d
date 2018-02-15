;; JESUS BOADAS @jboadas jboadas@gmail.com
;; init.el
;;
;; PAQUETES
;;
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)
;; Instala los paquetes si no han sido instalados
(unless (package-installed-p 'web-mode)
  (package-install 'web-mode))

(unless (package-installed-p 'ido-vertical-mode)
  (package-install 'ido-vertical-mode))
  
(unless (package-installed-p 'ido-completing-read+)
  (package-install 'ido-completing-read+))
  
(unless (package-installed-p 'flx-ido)
  (package-install 'flx-ido))

(unless (package-installed-p 'smex)
  (package-install 'smex))

(unless (package-installed-p 'smartparens)
  (package-install 'smartparens))

(unless (package-installed-p 'company)
  (package-install 'company))
  
(unless (package-installed-p 'hl-todo)
  (package-install 'hl-todo))
  
(unless (package-installed-p 'highlight-parentheses)
  (package-install 'highlight-parentheses))
;;
;; UI
;;
;;quita el beep
(setq ring-bell-function 'ignore)
;; para que se pueda borrar una region por defecto
(delete-selection-mode t)
;; quita los backups de emacs make-backup-file ? vs plural
(setq make-backup-files nil)
;; evitar guardar automaticamente
(setq auto-save-default nil)
;; ancho del tab a 2 espacios
(setq-default tab-width 2)
;; convertir tabs a espacios
(setq-default indent-tabs-mode nil)
;; quitar los prompt largos
(fset 'yes-or-no-p 'y-or-n-p)
;; solo cuando emacs use gui
(when (window-system)
  ;; elimina el toolbar
  (tool-bar-mode -1)
  ;; elimina el tool-bar
  (scroll-bar-mode -1)
  ;; elimina el menu
  (menu-bar-mode -1)
  ;; quita las barras de los costados
  (fringe-mode 0))
;; Formato de la columna de los numeros de linea
(setq linum-format "%4d")
;; para impedir que emacs trunque las palabras
(global-visual-line-mode -1)
;; impide que las lineas se pasen a la linea de abajo
;;(set-default 'truncate-lines nil)
;; some kind of smooth scroll
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
;; scroll one line at a time (less "jumpy" than defaults)
 ;; one line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
 ;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed -1)
 ;; scroll window under mouse
(setq mouse-wheel-follow-mouse 't)
;;nombre del frame en el titulo
(setq frame-title-format
  '(:eval
    (if buffer-file-name
        (replace-regexp-in-string
         "\\\\" "/"
         (replace-regexp-in-string
          (regexp-quote (getenv "HOME")) "~"
          (convert-standard-filename buffer-file-name)))
      (buffer-name))))

;; muestra el numero de columna en la barra de estado
(column-number-mode)
;; quita el splash screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
;; elimina el marcador de fin de buffer
(setq-default indicate-empty-lines nil)
;;carga el tema
(load-theme 'deeper-blue)
;;(load-theme 'material t)

;; resalta la linea actual del cursor
(global-hl-line-mode 1)
;; el background del la linea
(set-face-background 'hl-line "gray8")
;; para mantener el resaltado de la sintaxis
(set-face-foreground 'highlight nil)
;;cambia el color del cursor
(set-cursor-color "#ffffff")
;;personaliza el cursor
(setq-default cursor-type '(bar . 2))
;;hace que el cursor deje de parpadear
;;(blink-cursor-mode -1)
;; CAMBIA LA FUENTE POR DEFECTO WINDOWS
;; La fuente CONSOLAS debe estar instalada
;;(if (member "Consolas" (font-family-list))
;;    (set-face-attribute
;;     'default nil :font "Consolas 10"))
;; CAMBIA LA FUENTE POR DEFECTO LINUX
;;(if (member "Source Code Pro" (font-family-list))
;;    (set-face-attribute
;;     'default nil :font "Source Code Pro 12"))
;; Configuracion de powerline
;; (add-to-list 'load-path "~/.emacs.d/vendor/powerline")
;; (require 'powerline)
;; (powerline-center-theme)
;; colores personalizados de powerline
;;(set-face-attribute 'mode-line nil
;;                    :foreground "light gray"
;;                    :background "midnight blue"
;;                    :box nil)
;;(setq powerline-arrow-shape 'curve)

(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;; tamaño inicial de la ventana
(when window-system (set-frame-size (selected-frame) 80 24))

(add-hook 'prog-mode-hook 'linum-mode)

(ido-mode 1)
(ido-everywhere 1)
(setq ido-auto-merge-work-directories-length -1)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)

(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
;;(setq ido-use-faces nil)

(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                    :background nil
                    :foreground "orange")
(set-face-attribute 'ido-vertical-only-match-face nil
                    :background nil
                    :foreground nil)
(set-face-attribute 'ido-vertical-match-face nil
                    :foreground nil)

(ido-vertical-mode 1)

;; Not needed if you use package.el
(require 'smex) 
;; Can be omitted. This might cause a (minimal) delay
;; when Smex is auto-initialized on its first run.
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; M-$ ask for a completion, i to add the word to dictionary
;; some keybindings to easy spell check with flyspell

(global-set-key (kbd "<f8>") 'ispell-word) ;; same as M-$
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)

(require 'smartparens-config)
(smartparens-global-mode t)

;; activar el modo de resaltado de TODO
(global-hl-todo-mode t)

;; autocomplete via company mode
(add-hook 'after-init-hook 'global-company-mode)

;; delay de company nil para activarlo manualmente
(setq company-idle-delay nil)

;; set the key for company complete
(global-set-key [C-tab] #'company-complete)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))

(global-highlight-parentheses-mode t)
;; resalta el parentesis que cierra
(show-paren-mode 1)


(elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")

(setq python-shell-completion-native-enable nil)
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook (lambda ()
                              (flycheck-mode 1)
                              (semantic-mode 1)
                              (setq flycheck-checker 'python-pylint
                                    flycheck-checker-error-threshold 900
                                    flycheck-pylintrc "~/.pylintrc"))))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(defun my-horizontal-recenter ()
  "make the point horizontally centered in the window"
  (interactive)
  (let ((mid (/ (window-width) 2))
        (line-len (save-excursion (end-of-line) (current-column)))
        (cur (current-column)))
    (if (< mid cur)
        (set-window-hscroll (selected-window)
                            (- cur mid)))))

(global-set-key (kbd "C-S-l") 'my-horizontal-recenter)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#191919"))))
 '(company-scrollbar-fg ((t (:background "#0C0C0C"))))
 '(company-tooltip ((t (:inherit default :background "gray15"))))
 '(company-tooltip-annotation ((t (:inherit default :foreground "#006400" :background "gray15"))))
 '(company-tooltip-annotation-selection ((t (:inherit default :foreground "#00DD00" :background "brown4"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face :background "brown4" :foreground "snow1"))))
 '(highlight ((t (:background "dark slate gray"))))
 '(show-paren-match ((t (:background "black" :foreground "green")))))

;; ansible
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
(add-hook 'yaml-mode-hook '(lambda () (ansible 1)))
