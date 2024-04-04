;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
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
(setq doom-theme 'doom-dark+)

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
;; (setq doom-font (font-spec :family "Fira Mono" :size 12))

(defun switch-to-last-buffer ()
  (interactive)
  (switch-to-buffer nil))

(map! :leader :desc "fast switch to previous buffer" :n "<tab>" #'switch-to-last-buffer)
(map! :leader :desc "SPC SPC does M-x" :n "SPC" #'execute-extended-command)
(map! :n "C-M-j" #'evil-mc-make-cursor-move-next-line)
(map! :n "C-M-k" #'evil-mc-make-cursor-move-prev-line)
(map! :leader :n "g s" #'magit-status)

(map! :map global-map "C-a" #'evil-numbers/inc-at-pt)
;; TODO: is not applied correctly because there is already a group of bindings for C-x.
;; this also make C-h k and C-h f error.
;; (global-set-key (kbd "C-x") #'evil-numbers/dec-at-pt)

(map! :leader :n "F n" #'make-frame)
(map! :v "s" #'evil-surround-region)
;; (map! :leader :nv "c l" #'comment-line)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(advice-add '+emacs-lisp-truncate-pin :override (lambda () ()) )


(evil-define-text-object chom/textobj-inner-line (count &optional _beg _end type)
  "Text object to select the line."
  (evil-range
   (save-excursion
     (evil-end-of-line))
   (save-excursion
     (evil-first-non-blank))
   type))
(evil-define-text-object chom/textobj-outer-line (count &optional _beg _end type)
  "Text object to select the line."
  (evil-range
   (save-excursion
     (evil-end-of-line))
   (save-excursion
     (evil-beginning-of-line))
   type))
(map! :textobj "l" #'chom/textobj-inner-line #'chom/textobj-outer-line)

(map! :nvi "M-j" #'drag-stuff-down)
(map! :nvi "M-k" #'drag-stuff-up)

(after! (:or evil evil-mc)
  (map! :map evil-mc-key-map :nv "C-n" nil)
  (map! :map evil-mc-key-map :nv "C-p" nil)
  (map! :n "C-n" #'evil-mc-make-and-goto-next-match)
  (map! :n "C-p" #'evil-mc-make-and-goto-prev-match))

(add-hook 'git-commit-setup-hook 'chom/git-commit-setup)

(map! :leader :n "F d" #'delete-frame)
(map! :n ", g r" #'+lookup/references)

(setq yas-indent-line 'fixed)
(setq tab-always-indent t)

(defun chom/projectile-copy-file-path-as-python-import ()
  "Copy and show file path as python import"
  (interactive)
  (if-let (file-path (abbreviate-file-name (file-relative-name (buffer-file-name) (doom-project-root))))
      (progn
        (setq file-path (replace-regexp-in-string "/" "." (replace-regexp-in-string "src/" "" (file-name-sans-extension file-path))))
        (kill-new file-path)
        (message "%s" file-path))
    (message "WARNING: Current buffer is not visiting a file!")))
(map! :leader :n "f p" #'chom/projectile-copy-file-path-as-python-import)


(defun chom/default-web-engine()
  (web-mode-set-engine "django"))

(add-hook 'web-mode-hook 'chom/default-web-engine)

(defun chom/smart-tab-jump-out-or-indent (&optional arg)
  "Smart tab behaviour for doom emacs.
Copilot accept completion if copilot-mode active, jump out quote or brackets, or indent."
  (interactive "P")
  (let ((debug nil)
        (company-active (company--active-p))
        (copilot-available (and
                             (fboundp 'copilot-current-completion)
                             (copilot-current-completion)))
        (should-skip-next (and (evil-insert-state-p)
                               (char-after)
                               (-contains? (list "\"" "'" ")" "}" ";" "|" ">" "]" "`")
                                           (make-string 1 (char-after))))))
    (cond
     (company-active (progn
                       (when debug
                         (message "> (chom) company"))
                       (company-complete-selection)))
     (copilot-available (progn
                          (when debug
                            (message "> (chom) copilot"))
                          (copilot-accept-completion)))
     (should-skip-next (progn
                         (when debug
                           (message "> (chom) jump out"))
                         (forward-char 1)))
     (t
      (when debug
        (message "> (chom) default"))
      (indent-for-tab-command arg)))))

(defun chom/ctab (&optional arg)
  "Smart tab behaviour for doom emacs.
Copilot accept completion if copilot-mode active, jump out quote or brackets, or indent."
  (interactive "P")
  (let* ((debug nil))
    (when debug
      (message "> (chom) copilot: %s" copilot-available))
    (cond
     (t
      (when debug
        (message "> (chom) default"))
      (yas-expand)))))

(defun chom/smart-tab-jump-in-or-indent (&optional arg)
    "Smart tab behavior. Jump out quote or brackets, or indent."
    (interactive "P")
    (if (and (evil-insert-state-p) (char-before)
             (-contains? (list "\"" "'" ")" "}" ";" "|" ">" "]" "`") (make-string 1 (char-before))))
        (backward-char 1)
      (indent-for-tab-command arg)))

(map! :nvi "<tab>" #'chom/smart-tab-jump-out-or-indent)
(map! :nvi "<backtab>" #'chom/smart-tab-jump-in-or-indent)
(map! :ni "C-<tab>" #'chom/ctab)
(map! :ni "S-<return>" #'evil-open-above)

(bind-key* (kbd "C-x") 'evil-numbers/dec-at-pt)
;; (use-package "simple-buffer-jump")

(map! :leader :n "el" #'flycheck-list-errors)
(map! :leader :n "en" #'next-error)
(map! :leader :n "ep" #'previous-error)

(defun chom/save-all-buffers()
  (interactive)
  (save-some-buffers t nil))

(map! :leader :n "fS" #'chom/save-all-buffers)
(map! :ni "C-t" #'transpose-chars)
(map! :ni "C-S-t" #'transpose-sexps)

(setq evil-mc-custom-known-commands '(
                                      (wdired--self-insert
                                       (:default . evil-mc-execute-default-call))
                                      (string-inflection-underscore
                                       (:default . evil-mc-execute-default-call))
                                      (string-inflection-upcase
                                       (:default . evil-mc-execute-default-call))
                                      (string-inflection-kebab-case
                                       (:default . evil-mc-execute-default-call))
                                      (chom/smart-tab-jump-out-or-indent
                                       (:default . evil-mc-execute-call-with-count))
                                      ))

(map! :leader :n "x")
(map! :leader "xtu" #'string-inflection-underscore)
(map! :leader "xtU" #'string-inflection-upcase)
(map! :leader "xtk" #'string-inflection-kebab-case)

(define-key evil-normal-state-map (kbd "-") 'dired-jump)
(setq company-selection-wrap-around t)

(after! (:or company)
  (map! :map company-active-map "<tab>" 'company-complete-selection)
  (map! :map company-active-map "<return>" 'newline-and-indent))
(setq lsp-enable-snippet nil)


;; https://github.com/doomemacs/doomemacs/issues/4477#issuecomment-762882261
(when (and (modulep! :tools lsp) (not (modulep! :tools lsp +eglot)))
  (use-package! lsp-mode :defer t :config
    (add-hook! lsp-after-open
      (setq company-backends (remove 'company-yasnippet company-backends)))))

(set-company-backend! 'prog-mode
  '(:separate company-capf company-dabbrev company-ispell))
(set-company-backend! 'python-mode
  '(:separate company-capf company-dabbrev company-ispell))


;; https://github.com/emacsorphanage/evil-textobj-line/blob/master/evil-textobj-line.el
;; pasting the code here because I don't know how to install it

(defgroup evil-textobj-line nil
  "Line text object for Evil."
  :group 'evil)

(defcustom evil-textobj-line-i-key "l"
  "Keys for evil-inner-line."
  :type 'string
  :group 'evil-textobj-line)

(defcustom evil-textobj-line-a-key "l"
  "Keys for evil-a-line."
  :type 'string
  :group 'evil-textobj-line)

(defun evil-line-range (count beg end type &optional inclusive)
  (if inclusive
      (evil-range (line-beginning-position) (line-end-position))
    (let ((start (save-excursion
                   (back-to-indentation)
                   (point)))
          (end (save-excursion
                 (goto-char (line-end-position))
                 (skip-syntax-backward " " (line-beginning-position))
                 (point))))
      (evil-range start end))))

(evil-define-text-object evil-a-line (count &optional beg end type)
  "Select range between a character by which the command is followed."
  (evil-line-range count beg end type t))
(evil-define-text-object evil-inner-line (count &optional beg end type)
  "Select inner range between a character by which the command is followed."
  (evil-line-range count beg end type))

;; https://github.com/emacsorphanage/evil-textobj-line/blob/master/evil-textobj-line.el
(define-key evil-outer-text-objects-map evil-textobj-line-a-key 'evil-a-line)
(define-key evil-inner-text-objects-map evil-textobj-line-i-key 'evil-inner-line)

(defun chom/remove-yasnippet-from-company-backends ()
  (interactive)
  (mapcar (lambda (x)
            (if (listp x)
                (remove 'company-yasnippet x)
              x))
          company-backends))

(add-hook! 'python-mode-hook #'chom/remove-yasnippet-from-company-backends)

(setq lsp-pylsp-server-command (substitute-in-file-name "$HOME/.config/emacs/.local/etc/lsp/pylsp/.venv/bin/pylsp"))
(setq lsp-pylsp-plugins-pydocstyle-enabled nil)
