
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; UI
(setq doom-theme 'gruber-darker)
;;(load-theme 'gruber-darker')
(setq display-line-numbers-type 'relative)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; (after! ws-butler (ws-butler-global-mode -1))
;; (after! gcmh (gcmh-mode -1))
;; (after! better-jumper (better-jumper-mode -1))
;; (after! dtrt-indent (dtrt-indent-global-mode -1))
;; (after! evil-snipe
;;   (evil-snipe-mode -1)
;;   (evil-snipe-override-mode -1))

;; Cursor
(setq evil-normal-state-cursor '(box "white")
      evil-insert-state-cursor '(box "white")
      evil-visual-state-cursor '(box "white"))

;; Backup & trash
(setq backup-directory-alist `(("." . "~/.emacs_backup")))
(setq delete-by-moving-to-trash t
      trash-directory "~/.local/share/Trash/files/")

;; Always show *compilation* buffer in a horizontal split at the bottom
(add-to-list 'display-buffer-alist
             '("\\*compilation\\*"
               (display-buffer-reuse-window
                display-buffer-in-side-window)
               (side . bottom)
               (window-height . 0.3)))  ;; 30% of frame height

(add-hook 'compilation-mode-hook
          (lambda ()
            (setq display-line-numbers 'relative)
            (display-line-numbers-mode 1)))


;; Fonts
;;(setq doom-font (font-spec :family "Iosevka Nerd Font"
                           ;;:height 155
                           ;;:weight 'regular))

(set-face-attribute 'default nil
  :family "Iosevka Nerd Font"
  :height 155
  :weight 'regular)



;; Evil tweaks
(setq evil-want-C-u-scroll t
      scroll-margin 8
      scroll-conservatively 101)

;; Dired: press "e" to rename in wdired
(map! :after dired
      :map dired-mode-map
      :n "e" #'wdired-change-to-wdired-mode)

(defun my/consult-project-grep ()
  "Run `consult-ripgrep` from the project root without prompting for it."
  (interactive)
  (let ((default-directory (or (when-let ((proj (project-current)))
                                 (project-root proj))
                               (vc-root-dir)
                               default-directory)))
    (call-interactively #'consult-ripgrep)))

;; Leader keymaps
(map! :leader
      :desc "Find file"        "f f" #'find-file
      :desc "Project files"    "p f" #'find-file
      :desc "Project grep"     "p s" #'my/consult-project-grep 
      :desc "Split vertical"   "v"   #'split-window-right
      :desc "Split horizontal" "s"   #'split-window-below
      :desc "Win left"         "h"   #'evil-window-left
      :desc "Win right"        "l"   #'evil-window-right
      :desc "Win down"         "j"   #'evil-window-down
      :desc "Win up"           "k"   #'evil-window-up
      :desc "Delete window"    "q"   #'delete-window
      :desc "Magit status"
      "g s" #'magit-status
      :desc "Comment line/region"
      :n "c" #'evilnc-comment-or-uncomment-lines
      :v "c" #'evilnc-comment-or-uncomment-lines
      :desc "Project view" "p v"
      (lambda ()
        (interactive)
        (dired default-directory)
      )
      ;; (lambda ()
      ;;   (interactive)
      ;;   (let ((root (or (when-let ((proj (project-current)))
      ;;   		  (project-root proj))
      ;;   		(vc-root-dir)
      ;;   		default-directory)))
      ;;     (dired root)))
      )


(defun my-find-file-from-root ()
  "Find file starting at filesystem root."
  (interactive)
  (let ((default-directory "/home/bashtobits/"))
    (call-interactively 'find-file)))

(map! :n "C-f" #'my-find-file-from-root)

;; Treat underscores as word chars
(after! evil
  (modify-syntax-entry ?_ "w"))

;; Disable evil-collection integration for dired
;; (after! evil-collection
;;   (delq 'dired evil-collection-mode-list))

;; ;; Disable hl-line in dired buffers (can be slow with many files)
;; (remove-hook 'dired-mode-hook #'hl-line-mode)

;; ;; Kill Doom’s auto-preview in dired (if active)
;; (after! dired
;;   (setq dired-hide-details-hide-symlink-targets nil))

;; Tell Emacs to use simpc-mode for C files
(add-to-list 'load-path "/home/bashtobits/bashToDev/c/simpc/simpc-mode/")
(autoload 'simpc-mode "simpc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.[ch]\\(pp\\)?\\'" . simpc-mode))

;; dont ask me if I want to quit or not 
(setq confirm-kill-emacs nil
      doom-quit-hook nil)  ;; Doom won’t add its own quit logic

;; dont want the highlight either
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)
(global-hl-line-mode -1)


;; Prevent cc-mode (c-mode) from activating
(setq major-mode-remap-alist
      '((c-mode . simpc-mode)
        (c++-mode . simpc-mode)))

;; Disable global minor modes you don’t want
;; (remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)
;; (remove-hook 'doom-first-buffer-hook #'global-auto-revert-mode)
;; (remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
;; (remove-hook 'doom-first-buffer-hook #'global-subword-mode)
;; (remove-hook 'doom-first-buffer-hook #'global-so-long-mode)

;; ;; Disable specific Doom extras
;; (remove-hook 'doom-first-buffer-hook #'ws-butler-global-mode)   ;; whitespace cleanup
;; (remove-hook 'doom-first-buffer-hook #'global-gcmh-mode)        ;; GC tuning
;; (remove-hook 'doom-first-buffer-hook #'better-jumper-mode)      ;; jump list
;; (remove-hook 'doom-first-buffer-hook #'dtrt-indent-global-mode) ;; auto-detect indentation
;; (remove-hook 'doom-first-buffer-hook #'evil-snipe-mode)         ;; f/F/t/T motions override
