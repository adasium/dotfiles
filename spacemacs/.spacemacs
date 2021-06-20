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
   '(
     sql
     vue
     systemd
     csv

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
            )

     javascript
     vimscript

     docker
     (python :variables
             python-backend 'lsp
             python-fill-column 200
             python-lsp-server 'mspyls
             python-formatter 'black
             python-sort-imports-on-save nil
             python-shell-interpreter "/usr/bin/python3"
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
     (simple-buffer-jump :location (recipe
                                    :fetcher github
                                    :repo "dalanicolai/dala-emacs-lisp"))
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
   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4
   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)
   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)
   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)
   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"


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
   dotspacemacs-line-numbers 'relative
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
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
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

  ;; DIR LOCALS

  ;; make git submodule a separate project
  ;; (nil . ((eval . (setq projectile-project-root (locate-dominating-file default-directory ".dir-locals.el")))))

  (setq sbj-buffer-jump-prefix "o")
  (setq sbj-buffer-shortcut-set "oo")
  (use-package "simple-buffer-jump")
  (global-set-key [remap indent-for-tab-command] 'chom/smart-tab-jump-out-or-indent)
  (defun chom/evil-mc-execute-with-region-or-pos (cmd)
    "Execute a CMD with the current register and region.
If there is no region call CMD with the point position."
    (evil-mc-with-region region
        (funcall cmd
                 region-start
                 region-end
                 region-type
                 evil-this-register)
      (funcall cmd 1 2)))

  (evil-mc-define-handler chom/evil-mc-execute-call-with-region-or-pos
    :cursor-clear region
    (chom/evil-mc-execute-with-region-or-pos (evil-mc-get-command-name)))

  (setq evil-mc-custom-known-commands '(
                                        (evil-numbers/inc-at-pt
                                         (:default . chom/evil-mc-execute-call-with-region-or-pos))
                                        (evil-numbers/dec-at-pt
                                         (:default . chom/evil-mc-execute-call-with-region-or-pos))
                                        (chom/shift-line-right
                                         (:default . evil-mc-execute-default-call))
                                        (chom/shift-line-left
                                         (:default . evil-mc-execute-default-call))
                                        (chom/smart-tab-jump-out-or-indent
                                         (:default . evil-mc-execute-default-call))
                                        (chom/smart-tab-jump-out-or-dedent
                                         (:default . evil-mc-execute-default-call))
                                        (clean-aindent--bsunindent
                                         (:default . evil-mc-execute-default-call-with-count))
                                        ))

  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  (add-hook 'prog-mode-hook 'electric-pair-mode t)
  (remove-hook 'prog-mode-hook #'smartparens-mode)
  (remove-hook 'prog-mode-hook #'spacemacs//activate-smartparens)

  ;; =============================== GLOBAL MODES ==========================================
  (global-company-mode)
  (global-evil-mc-mode)
  (advice-add 'helm-swoop--edit :after #'evil-mc-mode)
  (advice-add 'helm-ag--edit :after #'evil-mc-mode)

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
  ;; === BASH-f
  ;; https://emacs.stackexchange.com/questions/13128/highlighting-shell-variables-within-quotes

  (defun sh-script-extra-font-lock-is-in-double-quoted-string ()
    "Non-nil if point in inside a double-quoted string."
    (let ((state (syntax-ppss)))
      (eq (nth 3 state) ?\")))

  (defun sh-script-extra-font-lock-match-var-in-double-quoted-string (limit)
    "Search for variables in double-quoted strings."
    (let (res)
      (while
          (and (setq res
                     (re-search-forward
                      "\\$\\({#?\\)?\\([[:alpha:]_][[:alnum:]_]*\\|[-#?@!]\\)"
                      limit t))
               (not (sh-script-extra-font-lock-is-in-double-quoted-string))))
      res))

  (defvar sh-script-extra-font-lock-keywords
    '((sh-script-extra-font-lock-match-var-in-double-quoted-string
       (2 font-lock-variable-name-face prepend))))

  (defun sh-script-extra-font-lock-activate ()
    (interactive)
    (font-lock-add-keywords nil sh-script-extra-font-lock-keywords)
    (if (fboundp 'font-lock-flush)
        (font-lock-flush)
      (when font-lock-mode
        (with-no-warnings
          (font-lock-fontify-buffer)))))

  ;; === MAGIT
  (defun ediff-copy-both-to-C ()
    (interactive)
    (ediff-copy-diff ediff-current-difference nil 'C nil
                     (concat
                      (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                      (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
  (defun add-d-to-ediff-mode-map () (define-key ediff-mode-map (kbd "B") 'ediff-copy-both-to-C))

  ;; === ORG-f
  (defun org-read-date-interactive ()
    "https://orgmode.org/manual/The-date_002ftime-prompt.html#The-date_002ftime-prompt"
    (interactive)
    (require 'org)
    (insert (org-read-date nil nil nil)))

  (defun chom/org-setup ()
    (with-eval-after-load 'org-agenda
      (require 'org-projectile)
      (mapcar (lambda (file)
                (when (file-exists-p file)
                  (push file org-agenda-files)))
              (org-projectile-todo-files))))

  ;; https://www.reddit.com/r/emacs/comments/3n1j4x/anyway_to_tab_out_of_parentheses/
  (defun chom/smart-tab-jump-out-or-indent (&optional arg)
    "Smart tab behavior. Jump out quote or brackets, or indent."
    (interactive "P")
    (if (and (evil-insert-state-p) (char-after)
             (-contains? (list "\"" "'" ")" "}" ";" "|" ">" "]" "`")
                         (make-string 1 (char-after))))
        (forward-char 1)
      (indent-for-tab-command arg)))

  (defun chom/smart-tab-jump-in-or-indent (&optional arg)
    "Smart tab behavior. Jump out quote or brackets, or indent."
    (interactive "P")
    (if (and (evil-insert-state-p) (char-before)
             (-contains? (list "\"" "'" ")" "}" ";" "|" ">" "]" "`") (make-string 1 (char-before))))
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
    (web-mode-set-engine "django")
    ;; (if (projectile-project-p)
    ;;     (if (file-exists-p (concat (projectile-project-root) "manage.py"))
    ;;         (web-mode-set-engine "django")))
    )


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

  (defun chom/python-eval-buffer ()
    (interactive)
    (let ((shell-process
           (or (python-shell-get-process)
               ;; `run-python' has different return values and different
               ;; errors in different emacs versions. In 24.4, it throws an
               ;; error when the process didn't start, but in 25.1 it
               ;; doesn't throw an error, so we demote errors here and
               ;; check the process later
               (with-demoted-errors "Error: %S"
                 ;; in Emacs 24.5 and 24.4, `run-python' doesn't return the
                 ;; shell process
                 (call-interactively #'run-python)
                 (python-shell-get-process)))))
      (unless shell-process
        (error "Failed to start python shell properly"))
      (spacemacs/python-shell-send-buffer)))

  (defun chom/python-eval-buffer-switch ()
    (interactive)
    (chom/python-eval-buffer)
    (python-shell-switch-to-shell)
    (evil-insert-state))

  (defun chom/kill-thing-at-point (thing)
    "Kill the `thing-at-point' for the specified kind of THING.
    https://stackoverflow.com/questions/33442027/how-to-deleteor-kill-the-current-word-in-emacs
    "
    (let ((bounds (bounds-of-thing-at-point thing)))
      (if bounds
          (kill-region (car bounds) (cdr bounds))
        (error "No %s at point" thing))))

  (defun chom/toggle-boolean ()
    (interactive)
    (save-excursion
      (cond
       ((string= (thing-at-point 'word 'no-properties) "True")
        (chom/kill-thing-at-point 'word)
        (insert "False"))
       ((string= (thing-at-point 'word 'no-properties) "False")
        (chom/kill-thing-at-point 'word)
        (insert "True"))
       ((t nil)))))

  ;; PYTHON

  (defun chom/helm-swoop/functions-methods()
    (interactive)
    (helm-swoop :query "^\\ \\ \\ \\ def\\ "))

  (defun chom/helm-swoop/functions-all()
    (interactive)
    (helm-swoop :query "^\\ *def\\ "))

  (defun chom/helm-swoop/classes-top-level()
    (interactive)
    (helm-swoop :query "^class\\ "))

  ;; STORAGE
  (defun storage/storage1 ()
    (interactive)
    (message (buffer-file-name))
    (message (projectile-project-root))
    (message (file-relative-name (buffer-file-name) (projectile-project-root))))
  ;; ENDSTORAGE

  (with-eval-after-load 'flycheck
    (put 'python-pylint (flycheck--checker-property-name 'working-directory) (lambda(_) (projectile-project-root))))

  (defun replace-in-string (what with in)
    (replace-regexp-in-string (regexp-quote what) with in nil 'literal))

  (defun chom/shift-line-right()
    (interactive)
    (evil-shift-right-line 1))

  (defun chom/shift-line-left()
    (interactive)
    (evil-shift-left-line 1))

  (defun chom/open-below-and-normal-state ()
    (interactive)
    (evil-open-below 1)
    (evil-normal-state)
    (evil-previous-line))

  (defun chom/open-above-and-normal-state ()
    (interactive)
    (evil-open-above 1)
    (evil-normal-state)
    (evil-next-line))

  (defun chom/test()
    (interactive)
    (message "hello")
    )


  ;; ================================ VARIABLES ============================================
  (setq projectile-indexing-method 'hybrid)
  (setq projectile-enable-caching t)
  (setq dap-python-terminal "gnome-terminal -- ")
  (setq dap-python-debugger "debugpy")
  (setq sp-escape-quotes-after-insert nil)
  (setq dotspacemacs-frame-title-format "%b - %t - Visual Studio Code")
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

  ;; == MARKDOWN VARIABLES
  (setq markdown-toc-header-toc-start "<!-- markdown-toc start -->")

  ;; == PYTHON VARIABLES

  (setq highlight-indent-guides-method 'column)
  (add-to-list 'exec-path (substitute-in-file-name "$HOME/.config/emacs/.venv/bin"))
  (add-to-list 'exec-path (substitute-in-file-name "$HOME/.local/bin"))
  (add-to-list 'exec-path (substitute-in-file-name "$HOME/.pyenv/shims"))

  (setq py-isort-options '("-s" "__init__.py"
                           "-m" "3"
                           "-tc"))
  (setq split-width-threshold 0)
  (setq split-height-threshold nil)
  (setq helm-grep-ag-command "rg --vimgrep --color=always --smart-case --no-heading --line-number --ignore-file .ignore %s %s %s")


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
  ;; (setq importmagic-python-interpreter python-emacs-executable-path)
  (setq flycheck-flake8rc "setup.cfg")
  (setq flycheck-pylintrc "setup.cfg")
  (setq lsp-pyls-configuration-sources ["flake8"])
  (setq lsp-ui-doc-enable nil)

  ;; === vMAGIT
  (setq magit-log-margin '(t "%H:%M %d-%m-%Y" magit-log-margin-width t 20))
  (setq magit-bury-buffer-function 'magit-mode-quit-window)

  ;; === vINDENT
  (setq lsp-enable-indentation t)
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
    ;; (setq evil-shift-width n)
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
  ;; https://develop.spacemacs.org/doc/DOCUMENTATION.html#binding-keys
  (global-set-key [remap indent-for-tab-command] 'chom/smart-tab-jump-out-or-indent)
  (global-set-key (kbd "<backtab>") 'chom/smart-tab-jump-in-or-indent)
  (global-set-key [remap python-indent-dedent-line] 'chom/smart-tab-jump-in-or-indent)

  (global-set-key [remap c-indent-line-or-region] 'chom/smart-tab-jump-out-or-indent)

  (bind-key "C-M-b" 'evil-mc-make-cursor-backward-WORD-end)
  (define-key evil-insert-state-map (kbd "<C-tab>") 'yas-expand)
  (define-key evil-visual-state-map (kbd "<C-tab>") 'yas-insert-snippet)
  (define-key evil-normal-state-map (kbd "zm") 'hs-hide-level)
  (define-key evil-normal-state-map (kbd "<escape>") 'evil-mc-undo-all-cursors)
  (define-key evil-insert-state-map (kbd "<S-return>") 'evil-open-above)

  (spacemacs/set-leader-keys "by" 'spacemacs/copy-whole-buffer-to-clipboard)

  (spacemacs/set-leader-keys-for-major-mode 'python-mode "sb" 'chom/python-eval-buffer)
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "sB" 'chom/python-eval-buffer-switch)

  (spacemacs/set-leader-keys-for-major-mode 'python-mode "of" 'chom/helm-swoop/functions-methods)
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "oF" 'chom/helm-swoop/functions-all)
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "oc" 'chom/helm-swoop/classes-top-level)

  (spacemacs/set-leader-keys-for-major-mode 'python-mode "cd" 'dap-debug)
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "cr" 'dap-debug-recent)

  (bind-key "M-w" 'er/expand-region)

  (bind-key "M-k" 'spacemacs/move-text-transient-state/move-text-up)
  (bind-key "M-j" 'spacemacs/move-text-transient-state/move-text-down)

  (with-eval-after-load 'magit-status
    (define-key magit-status-mode-map (kbd "RET") 'magit-diff-visit-file-other-window))

  (define-key evil-normal-state-map (kbd "K") 'join-line)

  (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)
  (define-key evil-normal-state-map (kbd "gra") 'evil-mc-make-vertical-cursors)

  (define-key evil-normal-state-map (kbd ">") 'chom/shift-line-right)
  (define-key evil-normal-state-map (kbd "<") 'chom/shift-line-left)

  (define-key evil-normal-state-map (kbd "C-c C-t") 'chom/toggle-boolean)

  (define-key evil-normal-state-map (kbd "RET") 'chom/open-below-and-normal-state)
  (define-key evil-normal-state-map (kbd "<S-return>") 'chom/open-above-and-normal-state)

  (spacemacs/set-leader-keys "id" 'org-read-date-interactive)
  (bind-key "C-k" 'chom/test)
  ;; (define-key evil-insert-state-map (kbd "C-j") 'evil-next-line)
  ;; (define-key evil-insert-state-map (kbd "C-k") 'evil-previous-line)

  ;; ================================ HOOKS ===============================================
  (add-hook 'yas-minor-mode-hook
            (lambda ()
              (yas-activate-extra-mode 'fundamental-mode)))
  ;; === BASH-h
  (add-hook 'sh-mode-hook 'sh-script-extra-font-lock-activate)

  ;; === MAGIT-h

  (add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)

  ;; === WEB-h
  (add-hook 'web-mode-hook 'chom/django)

  ;; === C++-h
  (add-hook 'c++-mode-hook (lambda()
                             (chom/setup-indent chom/indent-level)))

  ;; === LUA-h
  (add-hook 'lua-mode-hook (lambda()
                             (chom/setup-indent chom/indent-level)))

  ;; === PYTHON-h
  (defun chom/python-setup ()
    (add-to-list 'flycheck-disabled-checkers 'python-pylint)
    (let ((virtualenv-dir-path (chom/get-python-virtualenv-path)))
      (if virtualenv-dir-path
          (progn
            (message virtualenv-dir-path)
            ;; Python executable
            (setq-local python-shell-interpreter (f-join "/" virtualenv-dir-path "bin" "python"))
            (setq-local dap-python-executable python-shell-interpreter)
            ;; Importmagic
            ;; (setq-local importmagic-python-interpreter (f-join "/" virtualenv-dir-path "bin" "python"))
            ;; Linters
            (setq-local flycheck-python-flake8-executable (f-join "/" virtualenv-dir-path "bin" "flake8"))
            (setq-local flycheck-python-mypy-executable (f-join "/" virtualenv-dir-path "bin" "mypy"))
            (setq-local flycheck-python-pylint-executable (f-join "/" virtualenv-dir-path "bin" "pylint"))
           )
        )
      )

    (fset 'python-\[\]-get
          (kmacro-lambda-form [?c ?s ?\] ?\) ?i ?. ?g ?e ?t escape ?f ?\" ?t ?\"] 0 "%d"))
    ;; (define-key evil-insert-state-map (kbd "M-RET") 'importmagic-fix-symbol-at-point)
    ;; (define-key evil-normal-state-map (kbd "M-RET") 'importmagic-fix-symbol-at-point)
    (global-set-key [remap python-indent-dedent-line] 'chom/smart-tab-jump-in-or-indent))

  ;; This hook needs to be used not to make settings overridden by package setup.
  (add-hook 'python-mode-hook 'chom/python-setup t)
  (add-hook 'python-mode-hook 'display-fill-column-indicator-mode t)


  ;; === HASKELL-h
  (defun chom/haskell-setup ()
    (setq-local flycheck-idle-change-delay 3)
    (setq-local flycheck-check-syntax-automatically (quote (save idle-change mode-
                                                                 enabled))))

  (add-hook 'haskell-mode-hook 'chom/haskell-setup)

  ;; === ORG-h
  (add-hook 'org-mode-hook 'chom/org-setup)
  (evil-define-operator evil-org-> ()
    "Demote, indent, move column right.
    In items or headings, demote heading/item.
    In code blocks, indent lines
    In tables, move column to the right."
    :move-point nil
    (interactive)
    (end-of-line)
    (let ((end (point))
          (beg (progn (beginning-of-line) (point)))
          (count 1))
      (cond
       ;; Work with subtrees and headings
       ((org-with-limited-levels
         (or (org-at-heading-p)
             (save-excursion (goto-char beg) (org-at-heading-p))))
        (if (> count 0)
            (org-map-region 'org-do-demote beg end)
          (org-map-region 'org-do-promote beg end)))
       ;; Shifting table columns
       ((and (org-at-table-p)
             (save-excursion
               (goto-char beg)
               (<= (line-beginning-position) end (line-end-position))))
        (evil-org-table-move-column beg end count))
       ;; Work with items
       ((and (org-at-item-p)
             (<= end (save-excursion (org-end-of-item-list))))
        (evil-org-indent-items beg end count))
       ;; Default indentation
       (t
        ;; special casing tables
        (when (and (not (region-active-p)) (org-at-table-p))
          (setq beg (min beg (org-table-begin)))
          (setq end (max end (org-table-end))))
        (evil-shift-right beg end count)))
      (when (and evil-org-retain-visual-state-on-shift (evil-visual-state-p))
        (evil-normal-state)
        (evil-visual-restore))))

  (evil-define-operator evil-org-< ()
    (interactive)
    (let ((end (point))
          (beg (progn (beginning-of-line) (point)))
          (count 1))
      (evil-org-> beg end (- (or count 1)))))

  (add-hook 'org-capture-mode-hook 'evil-insert-state t)
  (add-hook 'org-mode-hook 'hl-todo-mode)

  ;; === MARKDOWN-h
  ;; (add-hook 'markdown-mode-hook 'vmd-mode)

  ;; === LATEX-h
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (add-hook 'LaTeX-mode-hook (lambda()
                               (add-hook 'after-save-hook 'latex/build nil 'make-it-local)
                               (define-key evil-normal-state-map (kbd "o") 'chom/LaTeX/add-item-below)
                               (define-key evil-normal-state-map (kbd "O") 'chom/LaTeX/add-item-above)
                               ))
  (add-hook 'LaTeX-mode-hook 'chom/environment-object)
  (remove-hook 'LaTeX-mode-hook 'latex/auto-fill-mode)

  ;; === JSON-h
  (add-hook 'json-mode-hook (lambda()
                              (setq tab-width 4)))

  ;; === WORKAROUNDS AND PATCHES
  ;; https://github.com/syl20bnr/spacemacs/issues/9756#issuecomment-363436814
  (setq spacemacs-default-jump-handlers
        (remove 'evil-goto-definition spacemacs-default-jump-handlers))
  (defun kadir/helm--collect-matches (orig-fun src-list &rest args)
    (let ((matches
           (cl-loop for src in src-list
                    collect (helm-compute-matches src))))
      (unless (eq matches t) matches)))

  (advice-add 'helm--collect-matches :around #'kadir/helm--collect-matches)

  (setq enable-local-eval t)
  (put 'py-isort-options 'safe-local-variable #'listp)
  (put 'python-fill-column 'safe-local-variable #'integerp)
  (put 'python-formatter 'safe-local-variable #'symbolp)
  (put 'flycheck-flake8-maximum-line-length 'safe-local-variable #'integerp)
  (put 'fill-column-indicator 'safe-local-variable #'integerp)
  (put 'display-fill-column-indicator 'safe-local-variable #'symbolp)

  (put 'python-sort-imports-on-save 'safe-local-variable #'symbolp)
  (put 'python-format-on-save 'safe-local-variable #'symbolp)
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
 '(evil-want-Y-yank-to-eol nil)
 '(latex-noindent-environments nil)
 '(package-selected-packages
   '(evil-mc-extras ripgrep helm-rg sublimity minimap add-node-modules-path org-plus-contrib evil-unimpaired f s dash doom-dark+-theme))
 '(safe-local-variable-values
   '((flycheck-disabled-checkers . python-flake8)
     (python-format-on-save t)
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
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(org-plus-contrib evil-unimpaired f s dash doom-dark+-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
