;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(systemd
     csv
     haskell
     lua

     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     org

     ;; TYPING-RELATED
     (auto-completion :variables
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-help-tooltip 'manual
                      auto-completion-enable-sort-by-usage nil
                      auto-completion-enable-snippets-in-popup t
                      )
     (spell-checking
      :variables spell-checking-enable-by-default nil)
     syntax-checking

     ;; SEARCH
     helm
     imenu-list

     ;; LANGUAGE-RELATED
     lsp
     dap

     python
     django
     yaml
     react
     shell-scripts
     html
     (c-c++ :variables
            c-c++-backend 'rtags
            c-c++-enable-rtags-completion nil
            c-c++-enable-clang-format-on-save t
            c-c++-enable-google-style t
            c-c++-enable-google-newline t)

     javascript
     vimscript

     docker
     (python :variables
             python-backend 'lsp
             python-fill-column 200
             python-lsp-server 'mspyls
             python-formatter nil
             python-sort-imports-on-save t
             )
     emacs-lisp
     (markdown :variables markdown-live-preview-engine 'vmd)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)

     ;; PAPERS AND PDF
     ;; chrome ;; TODO remove if necessary
     (latex
      :variables
      TeX-command-extra-options "-shell-escape"
      TeX-view-program-selection '((output-pdf "Okular")))

     ;; OTHER
     git
     (ranger :variables ranger-show-preview t)

     multiple-cursors
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     doom-themes
     flycheck-mypy
     highlight-indent-guides
     rainbow-mode
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(highlight-indentation)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only)

  )

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   dotspacemacs-mode-line-theme 'spacemacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         doom-dark+
                         spacemacs-dark
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(("mononoki"
                                :size 13
                                :weight normal
                                :width normal
                                :powerline-scale 1.7)
                               ("Fira Code"
                                :size 13
                                :weight normal
                                :width normal
                                :powerline-scale 1.7))
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  )

(defun dotspacemacs/user-config ()

  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'default-frame-alist '(fullscreen . maximized))

  ;; =============================== GLOBAL MODES ==========================================
  (global-company-mode)

  ;; =========================== OBJECT DEFINITIONS ========================================
  ;; https://stackoverflow.com/questions/18102004/emacs-evil-mode-how-to-create-a-new-text-object-to-select-words-with-any-non-sp/22418983#22418983
  (defmacro define-and-bind-text-object (key name start-regex end-regex)
    (let ((inner-name (make-symbol (concat "inner-" name)))
          (outer-name (make-symbol (concat "outer-" name))))
      `(progn
         (evil-define-text-object ,inner-name (count &optional beg end type)
           (evil-select-paren ,start-regex ,end-regex beg end type count nil))
         (evil-define-text-object ,outer-name (count &optional beg end type)
           (evil-select-paren ,start-regex ,end-regex beg end type count t))
         (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
         (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))

  ;; TODO: add package option to environment object
  (defun chom/environment-object ()
    (define-and-bind-text-object "e" "environment" "\\\\begin{[^}]+}" "\\\\end{[^}]+}"))
  (define-and-bind-text-object "\"" "double-quotation-mark" "\"" "\"")
  (define-and-bind-text-object "'" "double-quotation-mark" "'" "'")

  ;; ================================ FUNCTIONS ============================================
  ;; === ORG-f
  (defun chom/org-setup ()
    (with-eval-after-load 'org-agenda
      (require 'org-projectile)
      (mapcar (lambda (file)
                (when (file-exists-p file)
                  (push file org-agenda-files)))
              (org-projectile-todo-files))))

  (defun chom/evil-org-> (BEG END)
    (interactive "r")
    (cond
     ((eq evil-state 'visual)
      (evil-org-> BEG END 1)
      (evil-visual-restore))
     (t
      (evil-org-> BEG END 1))))


  (defun chom/evil-org-< (BEG END)
    (interactive "r")
    (cond
     ((eq evil-state 'visual)
      (evil-org-< BEG END 1)
      (evil-visual-restore))
     (t (evil-org-< BEG END 1))))

  ;; https://www.reddit.com/r/emacs/comments/3n1j4x/anyway_to_tab_out_of_parentheses/
  (defun chom/smart-tab-jump-out-or-indent (&optional arg)
    "Smart tab behavior. Jump out quote or brackets, or indent."
    (interactive "P")
    (if (-contains? (list "\"" "'" ")" "}" ";" "|" ">" "]" ) (make-string 1 (char-after)))
        (forward-char 1)
      (indent-for-tab-command arg)))

  (defun chom/smart-tab-jump-in-or-indent (&optional arg)
    "Smart tab behavior. Jump out quote or brackets, or indent."
    (interactive "P")
    (if (-contains? (list "\"" "'" ")" "}" ";" "|" ">" "]" ) (make-string 1 (char-before)))
        (backward-char 1)
      (indent-for-tab-command arg)))

  ;; === MULTIPLE CURSORS (f)
  (defun evil--mc-make-cursor-at-col (startcol _endcol orig-line)
    (move-to-column startcol)
    (unless (= (line-number-at-pos) orig-line)
      (evil-mc-make-cursor-here)))
  (defun evil-mc-make-vertical-cursors (beg end)
    (interactive (list (region-beginning) (region-end)))
    (evil-mc-pause-cursors)
    (apply-on-rectangle #'evil--mc-make-cursor-at-col
                        beg end (line-number-at-pos (point)))
    (evil-mc-resume-cursors)
    (evil-normal-state)
    (move-to-column (evil-mc-column-number (if (> end beg)
                                               beg
                                             end))))

  (defun evil-mc-make-cursor-WORD-begin ()
    (interactive)
    (evil-mc-pause-cursors)
    (evil-mc-make-cursor-here)
    (evil-forward-WORD-begin)
    (evil-mc-resume-cursors)
    )
  (bind-key "C-M-w" 'evil-mc-make-cursor-WORD-begin)

  (defun evil-mc-make-cursor-backward-WORD-end ()
    (interactive)
    (evil-mc-pause-cursors)
    (evil-mc-make-cursor-here)
    (evil-backward-WORD-end)
    (evil-mc-resume-cursors)
    )

  ;; === LATEX (f)
  (defun chom/LaTeX/indent-tabular ()
    "Return indent column for the current tabular-like line."
    (cl-destructuring-bind
        (beg-pos . beg-col)
        (LaTeX-env-beginning-pos-col)
      (let ((tabular-like-end-regex
	           (format "\\\\end{%s}"
		                 (regexp-opt
		                  (let (out)
		                    (mapc (lambda (x)
                                (when (eq (cadr x) 'chom/LaTeX/indent-tabular)
                                  (push (car x) out)))
                              LaTeX-indent-environment-list)
		                    out)))))
        (cond ((looking-at tabular-like-end-regex)
	             beg-col)

	            ((looking-at "\\\\\\\\begin{%s}")
	             (+ LaTeX-indent-level beg-col))

	            ((looking-at "&")
	             (LaTeX-hanging-ampersand-position))

	            (t
	             (- LaTeX-indent-level
	                (let ((any-col (save-excursion
				                           (when (re-search-backward tabular-like-end-regex beg-pos t)
				                             (current-column)))))
		                (if (and any-col (= ?& (char-before (match-end 0))))
		                    (1+ any-col)
		                  beg-col))))))))


  (setq chom/LaTeX/add-item-environments (list "itemize"))
  (defun chom/LaTeX/add-item-below ()
    (interactive)
    (evil-open-below 1)
    (if (member (LaTeX-current-environment) chom/LaTeX/add-item-environments)
        (latex-insert-item)
        )
    )

  (defun chom/LaTeX/add-item-above ()
    (interactive)
    (evil-open-above 1)
    (if (member (LaTeX-current-environment) chom/LaTeX/add-item-environments)
        (latex-insert-item)
      )
    )

  ;; === WEB MODE (f)
  (defun chom/django ()
    (if (projectile-project-p)
        (if (file-exists-p (concat (projectile-project-root) "manage.py"))
            (web-mode-set-engine "django"))))


  (defun chom/get-python-virtualenv-path ()
    (let ((virtualenv-venv-path (concat (projectile-project-root) ".venv"))
          (pipfile-path (concat (projectile-project-root) "Pipfile")))
      (cond
       ((file-directory-p virtualenv-venv-path)
        virtualenv-venv-path)
       ((file-exists-p pipfile-path)
        (let ((result (string-trim (shell-command-to-string (concat "PIPENV_IGNORE_VIRTUALENVS=1 " pipenv-executable " --venv")))))
          (if (file-directory-p result)
              result)))
       (t nil))))

  (defun chom/test()
    (interactive)
    (message "hello")
    (message (chom/get-python-virtualenv-path)))


  ;; ================================ VARIABLES ============================================
  (setq lsp-diagnostic-package :none)
  (setq pipenv-executable (executable-find "pipenv"))
  (custom-set-faces
   '(flycheck-error ((t (:underline (:style line :color "#FF0000")))))
   '(flycheck-warning ((t (:underline (:style line :color "#FFFF00")))))
   '(flycheck-info ((t (:underline (:style wave :color "#00FF00")))))
   )
  (setq hl-paren-colors
        '(
          "#FF0000"
          "#FF7F00"
          "#FFFF00"
          "#00FF00"
          "#0000FF"
          "#4B0082"
          "#9400D3"
          ))

  (setq highlight-indent-guides-method 'column)
  (add-to-list 'exec-path (substitute-in-file-name "$HOME/.config/emacs/.venv/bin"))
  (add-to-list 'exec-path (substitute-in-file-name "$HOME/.local/bin"))
  (add-to-list 'exec-path (substitute-in-file-name "$HOME/.pyenv/shims"))

  (setq py-isort-options '("-s" "__init__.py"
                           "-m" "3"))
  (setq split-width-threshold 0)
  (setq split-height-threshold nil)
  (setq helm-grep-ag-command "rg --color=always --smart-case --no-heading --line-number %s %s %s")


  (setq yas-snippet-dirs '("~/.emacs.d/private/snippets/"))

  ;; === ORG VARIABLES
  (setq org-hide-leading-stars t)
  (setq org-projectile-file "TODO.org")
  (setq org-default-notes-file "TODO.org")
  (setq org-capture-templates
        '(
          ("t" "Regular TODO" entry (file org-projectile-file)
           "** TODO %?\n%a\n")
          ))
  (setq-default org-display-custom-times t)
  (setq org-time-stamp-custom-formats '("<%Y-%m-%d>" . "<%Y-%m-%d %H:%M>"))
  (setq-default org-list-indent-offset 2)

  ;; === vLATEX
  (setq font-latex-fontify-script nil)
  (setq LaTeX-item-indent 0)

  ;; === vC/C++
  (setq-default sp-escape-quotes-after-insert nil) ; fix inserting single quotes

  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_GB,en_US,pl_PL,de_DE")
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_GB,en_US,pl_PL,de_DE")

  ;; === vPYTHON
  (setq lsp-disabled-clients '(pyls))
  (setq python-indent-guess-indent-offset-verbose nil)
  (setq python-emacs-virtualenv-path (substitute-in-file-name "$HOME/.config/emacs/.venv"))
  (setq python-emacs-executable-path (f-join python-emacs-virtualenv-path "bin/python"))
  (setq spacemacs-jump-handlers-python-mode (list 'dumb-jump 'evil-jump-to-tag))
  (setq importmagic-python-interpreter python-emacs-executable-path)
  (setq flycheck-flake8rc "setup.cfg")
  (setq flycheck-pylintrc "setup.cfg")
  (setq lsp-pyls-configuration-sources ["flake8"])
  (setq lsp-ui-doc-enable nil)

  ;; === vMAGIT
  (setq magit-log-margin '(t "%H:%M %d-%m-%Y" magit-log-margin-width t 20))

  ;; === vINDENT
  (setq lsp-enable-indentation nil)
  (setq chom/indent-level 4)
  (defun chom/setup-indent (n)
    (setq python-tab-width n)
    (setq python-indent-offset n)
    ;; java/c/c++
    (setq c-basic-offset n)
    ;; web development
    (setq coffee-tab-width n) ; coffeescript
    (setq javascript-indent-level n) ; javascript-mode
    (setq js-indent-level n) ; js-mode
    (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
    (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
    (setq web-mode-css-indent-offset n) ; web-mode, css in html file
    (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
    (setq web-mode-attr-indent-offset nil)
    (setq css-indent-offset n) ; css-mode
    (setq LaTeX-indent-level n)
    (setq TeX-brace-indent-level n)
    (setq tab-width n)
    (setq lua-indent-level n)
    (setq evil-shift-width n)
    )
  (chom/setup-indent chom/indent-level)

  ;; === vOTHER
	(setq powerline-default-separator 'nil)
  (setq vc-follow-symlinks t)
  (setq avy-timeout-seconds 0.3)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.1)
  (setq evil-want-Y-yank-to-eol t)

  ;; ============================== KEYBINDINGS ===========================================

  (global-set-key [remap indent-for-tab-command] 'chom/smart-tab-jump-out-or-indent)
  (global-set-key [remap python-indent-dedent-line] 'chom/smart-tab-jump-in-or-indent)
  (bind-key "C-M-b" 'evil-mc-make-cursor-backward-WORD-end)
  (define-key evil-insert-state-map (kbd "<C-tab>") 'yas-expand)
  (define-key evil-normal-state-map (kbd "zm") 'hs-hide-level)
  (define-key evil-normal-state-map (kbd ">") 'evil-shift-right-line)
  (define-key evil-normal-state-map (kbd "<") 'evil-shift-left-line)
  (define-key evil-normal-state-map (kbd "<escape>") 'evil-mc-undo-all-cursors)
  (define-key evil-insert-state-map (kbd "<S-return>") 'evil-open-above)

  (bind-key "M-w" 'er/expand-region)

  (bind-key "M-k" 'spacemacs/move-text-transient-state/move-text-up)
  (bind-key "M-j" 'spacemacs/move-text-transient-state/move-text-down)

  (define-key evil-normal-state-map (kbd "K") 'join-line)
  (evil-define-key 'visual evil-org-mode-map (kbd ">") 'chom/evil-org->)
  (evil-define-key 'visual evil-org-mode-map (kbd "<") 'chom/evil-org-<)
  (evil-define-key 'normal evil-org-mode-map (kbd ">") 'chom/evil-org->)
  (evil-define-key 'normal evil-org-mode-map (kbd "<") 'chom/evil-org-<)

  (evil-define-key 'insert evil-org-mode-map (kbd "<tab>") 'chom/evil-org->)
  (evil-define-key 'insert evil-org-mode-map (kbd "<backtab>") 'chom/evil-org-<)

  (define-key evil-normal-state-map (kbd "gra") 'evil-mc-make-vertical-cursors)

  (bind-key "C-k" 'chom/test)

  ;; (evil-leader/set-key "/" 'spacemacs/helm-project-do-ag)



  ;; ================================ HOOKS ===============================================

  ;; === WEB (h)
  (add-hook 'web-mode-hook 'chom/django)

  ;; === C++ (h)
  (add-hook 'c++-mode-hook (lambda()
                             (chom/setup-indent chom/indent-level)))

  ;; === LUA (h)
  (add-hook 'lua-mode-hook (lambda()
                             (chom/setup-indent chom/indent-level)))

  ;; === PYTHON (h)
  (defun chom/python-setup ()
    (let ((virtualenv-dir-path (chom/get-python-virtualenv-path)))
      (if virtualenv-dir-path
          (progn
            (let ((python-version (substring (shell-command-to-string (concat virtualenv-dir-path "/bin/python --version")) 7 10)))
              (setenv "PYTHONPATH" (f-join virtualenv-dir-path "lib" (concat "python" python-version) "site-packages"))
              (setenv "PYTHONPATH" (mapconcat (lambda (x) (format "%s" x)) (list (getenv "PYTHONPATH") (projectile-project-root)) ":"))
              (setq python-shell-extra-pythonpaths (list (substitute-in-file-name (f-join "/" python-emacs-virtualenv-path "lib" python-version "site-packages")))
                    flycheck-checker 'python-flake8
                    flycheck-checker-error-threshold 900))
            (setq flycheck-python-flake8-executable (f-join "/" virtualenv-dir-path "bin" "flake8"))
            (setq flycheck-python-mypy-executable (f-join "/" virtualenv-dir-path "bin" "mypy"))
            (setq flycheck-python-pylint-executable (f-join "/" virtualenv-dir-path "bin" "pylint"))
            (setq python-shell-interpreter (f-join "/" virtualenv-dir-path "bin" "python"))
            (setq python-shell-exec-path (list (f-join "/" virtualenv-dir-path "bin"))))
        nil)
      (progn
        (define-key evil-insert-state-map (kbd "M-RET") 'importmagic-fix-symbol-at-point)
        (define-key evil-normal-state-map (kbd "M-RET") 'importmagic-fix-symbol-at-point)
        (global-set-key [remap python-indent-dedent-line] 'chom/smart-tab-jump-in-or-indent))))

  ;; This hook needs to be used not to make settings overridden by package setup.
  (add-hook 'python-mode-hook #'pipenv-mode)
  (add-hook 'python-mode-hook 'chom/python-setup t)
  (add-hook 'python-mode-hook 'display-fill-column-indicator-mode)
  (add-hook 'python-mode-hook 'highlight-indent-guides-mode)

  ;; === ORG-h
  (add-hook 'org-mode-hook 'chom/org-setup)
  (add-hook 'org-capture-mode-hook 'evil-insert-state t)
  (add-hook 'org-mode-hook 'hl-todo-mode)

  ;; === MARKDOWN (h)
  ;; (add-hook 'markdown-mode-hook 'vmd-mode)

  ;; === LATEX (h)
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (add-hook 'LaTeX-mode-hook (lambda()
                               (add-hook 'after-save-hook 'latex/build nil 'make-it-local)
                               (define-key evil-normal-state-map (kbd "o") 'chom/LaTeX/add-item-below)
                               (define-key evil-normal-state-map (kbd "O") 'chom/LaTeX/add-item-above)
                               ))
  (add-hook 'LaTeX-mode-hook 'chom/environment-object)
  (remove-hook 'LaTeX-mode-hook 'latex/auto-fill-mode)

  ;; === JSON (h)
  (add-hook 'json-mode-hook (lambda()
                              (setq tab-width 4)))

  ;; === SPACEMACS (h)
  ; TODO: remove *spacemacs* buffer and set *scratch* as default


  ;; === WORKAROUNDS
  ;; https://github.com/syl20bnr/spacemacs/issues/9756#issuecomment-363436814
  (setq spacemacs-default-jump-handlers
        (remove 'evil-goto-definition spacemacs-default-jump-handlers))

  ;; ================================== END
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-indent-environment-list
   '(("itemize")
     ("verbatim")
     ("verbatim*")
     ("filecontents")
     ("filecontents*")
     ("tabular")
     ("tabular*")
     ("align")
     ("align*")
     ("array")
     ("eqnarray")
     ("eqnarray*")
     ("displaymath")
     ("equation")
     ("equation*")
     ("picture")
     ("tabbing")
     ("thebibliography")
     ("document" chom/LaTeX/indent-tabular)))
 '(evil-shift-width 4)
 '(evil-want-Y-yank-to-eol nil)
 '(latex-noindent-environments nil)
 '(lua-indent-level 4 t)
 '(package-selected-packages
   '(rainbow-mode tern org-plus-contrib evil-unimpaired f s dash doom-dark+-theme))
 '(safe-local-variable-values
   '((py-isort-options "-s __init__.py" "-m 3")
     (blacken-line-length . 88)
     (python-formater . black)
     (python-fill-column . 88)
     (python-fill-column . 99)
     (python-formatter . black)
     (python-formatter black)
     (flycheck-disabled-checkers . python-flake8)
     (python-format-on-save t)
     (python-sort-imports-on-save t)
     (python-formatter 'black)
     (python-fill-column . 90)
     (javascript-backend . tide)
     (javascript-backend . tern)
     (javascript-backend . lsp)))
 '(spacemacs-indent-sensitive-modes
   '(asm-mode coffee-mode elm-mode haml-mode haskell-mode slim-mode makefile-mode makefile-bsdmake-mode makefile-gmake-mode makefile-imake-mode yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-error ((t (:underline (:style line :color "#FF0000")))))
 '(flycheck-info ((t (:underline (:style wave :color "#00FF00")))))
 '(flycheck-warning ((t (:underline (:style line :color "#FFFF00"))))))
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-plus-contrib evil-unimpaired f s dash doom-dark+-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
