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

     dart
     python
     django
     yaml
     react
     shell-scripts
     html
     (c-c++ :variables
            c-c++-backend 'lsp-clangd
            c-c++-enable-rtags-completion nil
            c-c++-enable-clang-format-on-save t
            )
     ;; (gtags :variables
     ;;        gtags-enable-by-default nil
     ;;        )

     javascript
     vimscript

     docker
     (python :variables
             python-backend 'lsp
             python-fill-column 120
             python-lsp-server 'pylsp
             python-formatter 'black
             python-sort-imports-on-save nil
             python-shell-interpreter "python3"
             )
     (rust :variables
           rust-backend 'lsp
           )
     emacs-lisp
     (markdown :variables markdown-live-preview-engine 'vmd)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)

     ;; PAPERS AND PDF
     (latex
      :variables
      TeX-command-extra-options "-shell-escape"
      TeX-view-program-selection '((output-pdf "Okular")))

     ;; OTHER
     git
     ;; (ranger :variables ranger-show-preview t)

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
     (simple-buffer-jump :location (recipe :fetcher github :repo "dalanicolai/dala-emacs-lisp"))
     (helm-gitignore :location (recipe :fetcher github :repo "HanshenWang/helm-gitignore"))
     (rustic :location (recipe :fetcher github :repo "brotzeit/rustic"))
     ;; (compat :location (recipe :fetcher github :repo "phikal/compat.el"))
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
   dotspacemacs-smartparens-strict-mode t
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

  ;; NOTE: last working commit: 6bafc7269
  ;; NOTE: XCompose env variables
  ;; export GTK_IM_MODULE=uim; export QT_IM_MODULE=uim; export XMODIFIERS=@im=uim;

  (with-eval-after-load 'spaceline
    ;; (spaceline-toggle-minor-modes-off)
    (spaceline-define-segment python-version
                              (when (eq 'major-mode 'python-mode)
                                python-shell-interpreter)
                              )
    ;; fancy git icon
    (defadvice vc-mode-line (after strip-backend () activate)
      (when (stringp vc-mode)
        (let ((gitlogo (replace-regexp-in-string "^ Git." "  " vc-mode)))
          (setq vc-mode gitlogo))))

    (spaceline-compile
     "chom"
                                        ; left side
     '(((persp-name
         workspace-number
         window-number)
        :fallback evil-state
        :face highlight-face
        :priority 100)
       (anzu :priority 95)
       auto-compile
       ((buffer-modified buffer-size buffer-id remote-host)
        :priority 98)
       (major-mode :priority 79)
       (process :priority 79)
       ((flycheck-error flycheck-warning flycheck-info)
        :when active
        :priority 89)
       (minor-modes :when active
                    :priority 9)
       (python-version)
       (mu4e-alert-segment :when active)
       (erc-track :when active)
       (version-control :when active
                        :priority 78)
       ;;(org-pomodoro :when active)
       ;;(org-clock :when active)
       ;;nyan-cat
       )
                                        ; right side
     '(which-function
       (python-pyvenv :fallback python-pyenv)
                                        ;(purpose :priority 94)
       (battery :when active)
       (selection-info :priority 95)
       input-method
       ((;buffer-encoding-abbrev
         point-position
         line-column)
        :separator " | "
        :priority 96)
       (global :when active)))

    (setq-default mode-line-format '("%e" (:eval (spaceline-ml-chom))))
    )

  (defun chom/python-execute-file (arg)
    "Execute a python script in a shell."
    (interactive "P")
    ;; set compile command to buffer-file-name
    ;; universal argument put compile buffer in comint mode
    (let ((universal-argument t)
          (compile-command (format "%s %s"
                                   python-shell-interpreter
                                   (shell-quote-argument (file-name-nondirectory buffer-file-name)))))
      (if arg
          (call-interactively 'compile)
        (compile compile-command t)
        (with-current-buffer (get-buffer "*compilation*")
          (inferior-python-mode)

          (switch-to-buffer-other-window "*compilation*")
          (end-of-buffer)
          (evil-normal-state)
          ))))

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

  (defun chom/evil-mc-execute-with-region (cmd)
    (evil-mc-with-region region
        (funcall cmd
                 region-start
                 region-end
                 region-type
                 evil-this-register
                 )))

  (evil-mc-define-handler chom/evil-mc-execute-call-with-region
    :cursor-clear region
    (chom/evil-mc-execute-with-region (evil-mc-get-command-name)))


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
                                        (evil-open-below
                                         (:default . evil-mc-execute-default-call-with-count))
                                        (evil-open-above
                                         (:default . evil-mc-execute-default-call-with-count))
                                        (evil-org-append-line
                                         (:default . evil-mc-execute-default-call-with-count))
                                        (join-line
                                         (:default . evil-mc-execute-default-call))
                                        (string-inflection-underscore
                                         (:default . evil-mc-execute-default-call))
                                        (string-inflection-camelcase
                                         (:default . evil-mc-execute-default-call))
                                        (string-inflection-lower-camelcase
                                         (:default . evil-mc-execute-default-call))
                                        (dired-next-line
                                         (:default . evil-mc-execute-default-call-with-count))
                                        (dired-previous-line
                                         (:default . evil-mc-execute-default-call-with-count))
                                        (chom/toggle-thing
                                         (:default . evil-mc-execute-default-call)
                                         (visual . chom/evil-mc-execute-call-with-region))
                                        (latex/font-bold
                                         (:default . evil-mc-execute-default-call))
                                        ))

  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  ;; (add-hook 'prog-mode-hook 'electric-pair-mode t)
  ;; (remove-hook 'prog-mode-hook #'smartparens-mode)
  ;; (remove-hook 'prog-mode-hook #'spacemacs//activate-smartparens)
  (remove-hook 'prog-mode-hook #'highlight-parentheses-mode)
  (remove-hook 'python-mode-hook #'importmagic-mode)
  (remove-hook 'python-mode-hook #'turn-on-evil-matchit-mode)
  (remove-hook 'before-save-hook #'spacemacs//python-sort-imports)
  (setq-default rust-before-save-hook nil)
  (setq-default rust-after-save-hook nil)

  ;; =============================== GLOBAL MODES ==========================================
  (global-company-mode)
  (global-evil-mc-mode)
  (advice-add 'helm-swoop--edit :after #'evil-mc-mode)
  (advice-add 'helm-ag--edit :after #'evil-mc-mode)
  (advice-add 'helm-ag--edit :after #'evil-surround-mode)

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
  (evil-add-command-properties #'evil-append-line :jump t)

  (defun chom/dired-enter-dir ()
    (interactive)
    (let ((dir (dired-get-filename)))
      (if (file-directory-p dir)
          (dired-find-file))))

  (defun chom/dired ()
    (interactive)
    (dired (file-name-directory (buffer-file-name))))

  (defun chom/buffer-face-mode-dart ()
    "https://emacs.stackexchange.com/questions/3038/using-a-different-font-for-each-major-mode"
    (interactive)
    (setq buffer-face-mode-face '(:family "Fira Code" :height 90))
    (buffer-face-mode))

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

  (defface chom/org-mode-label-face
    '((t :foreground "#fcdb03"))
    "Face used for labels e.g. @work"
    :group 'org-mode)

  (defun chom/org-font-setup ()
    (font-lock-add-keywords nil '(("@[a-zA-Z]+" . 'chom/org-mode-label-face))))

  (defface chom/python-mode-logger-info-face
    '((t :foreground "#34eb52"))
    "Face used for logger.info in python-mode"
    :group 'python-mode)

  (defface chom/python-mode-logger-warn-face
    '((t :foreground "#fcdb03"))
    "Face used for logger.warn in python-mode"
    :group 'python-mode)

  (defface chom/python-mode-logger-debug-face
    '((t :foreground "#eb4c34"))
    "Face used for logger.debug in python-mode"
    :group 'python-mode)

  (defface chom/python-mode-logger-error-face
    '((t :foreground "#ff0000"))
    "Face used for logger.error in python-mode"
    :group 'python-mode)

  (defface chom/python-mode-logger-exception-face
    '((t :foreground "#ff7a92"))
    "Face used for logger.exception in python-mode"
    :group 'python-mode)

  (defface chom/python-mode-assert-face
    '((t :foreground "#ff00e1"))
    "Face used for assert keyword in python-mode"
    :group 'python-mode)


  (defun chom/python-font-setup ()
    (font-lock-add-keywords nil '(("logger.info" . 'chom/python-mode-logger-info-face)
                                  ("logger.warning" . 'chom/python-mode-logger-warn-face)
                                  ("logger.warn" . 'chom/python-mode-logger-warn-face)
                                  ("logger.debug" . 'chom/python-mode-logger-debug-face)
                                  ("logger.exception" . 'chom/python-mode-logger-exception-face)
                                  ("logger.error" . 'chom/python-mode-logger-error-face)
                                  ("assert" . 'chom/python-mode-assert-face)
                                  )))



  (add-hook 'org-mode-hook 'chom/org-font-setup)

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

  (defun chom/mc-make-cursors-in-selection (start end)
    (interactive "r")
    (let* ((map '(("(" . ")")
                  ("{" . "}")
                  ("[" . "]")))
           (expected-closing-char (or (cdr (assoc (char-to-string (char-after start)) map)))))

      (evil-normal-state)
      (if expected-closing-char
          (goto-char (+ start 1))
        (goto-char start))

      (evil-mc-pause-cursors)
      (while (save-excursion (re-search-forward "," end 't))
        (evil-mc-make-cursor-here)
        (re-search-forward "," end 't)
        (forward-char))

      (if (and expected-closing-char (save-excursion
                                       (re-search-forward expected-closing-char end 't)))
          (progn
            (evil-mc-make-cursor-here)
            (re-search-forward expected-closing-char end 't)
            (backward-char)
            ))
      (evil-mc-resume-cursors)))

  (defun chom/mc-indent-on-enter-and-normal-mode ()
    (interactive)
    (if (evil-mc-has-cursors-p)
        (progn
          (let ((evil-mc-command '((:name . newline-and-indent))))
            (evil-mc-execute-for-all))
          (newline-and-indent)
          (evil-normal-state))
      (newline-and-indent)))

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
    (evil-mc-resume-cursors))
  (bind-key "C-M-w" 'evil-mc-make-cursor-WORD-begin)

  (defun evil-mc-make-cursor-backward-WORD-end ()
    (interactive)
    (evil-mc-pause-cursors)
    (evil-mc-make-cursor-here)
    (evil-backward-WORD-end)
    (evil-mc-resume-cursors))

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
        (latex-insert-item)))

  (defun chom/LaTeX/add-item-above ()
    (interactive)
    (evil-open-above 1)
    (if (member (LaTeX-current-environment) chom/LaTeX/add-item-environments)
        (latex-insert-item)))

  ;; === WEB MODE (f)
  (defun chom/django ()
    (web-mode-set-engine "django"))

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

  (evil-define-text-object python-inner-class (count &optional beg end type)
    (re-search-backward "^[[:space:]]*class")
    (setq beg (point))
    (forward-word)
    (let* ((current-indent (current-indentation))
           (mid (if (= current-indent 0) ""
                  (format "[[:space:]]\{0, %s\}" current-indent)))
           (outside-regex (concat "^" mid "[^[:space:]\n]+"))
           (end-regex (concat "[^[:alpha:]]$")))
      (if (not (re-search-forward outside-regex nil t))
          (goto-char (point-max)))
      (re-search-backward end-regex)
      (goto-char (match-end 0))
      (evil-range beg (point))))

  (evil-define-text-object python-inner-function (count &optional beg end type)
    (re-search-backward "^[[:space:]]*\\(?:async \\)?def")
    (setq beg (point))
    (forward-word)
    (let* ((current-indent (current-indentation))
           (mid (format "[[:space:]]\\{,%s\\}" current-indent))
           (outside-regex (concat "^" mid "[^[:space:]]"))
           (end-regex (concat "[^^]$" )))
      (if (not (re-search-forward outside-regex nil t))
          (goto-char (point-max)))
      (re-search-backward end-regex)
      (goto-char (match-end 0))
      (evil-range beg (point))))

  (define-key evil-inner-text-objects-map (kbd "c") 'python-inner-class)
  (define-key evil-inner-text-objects-map (kbd "f") 'python-inner-function)

  (defun chom/kill-thing-at-point (thing)
    "Kill the `thing-at-point' for the specified kind of THING.
    https://stackoverflow.com/questions/33442027/how-to-deleteor-kill-the-current-word-in-emacs
    "
    (let ((bounds (bounds-of-thing-at-point thing)))
      (if bounds
          (kill-region (car bounds) (cdr bounds))
        (error "No %s at point" thing))))

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

  (defun chom/choose-python-version ()
    (let* ((result (helm :sources (reverse (helm-build-async-source "pyenv versions"
                                    :candidates-process (lambda ()
                                                          (start-process "echo" nil "pyenv" "versions" "--bare"))))
                         :buffer "*helm sync source*"))
           (python-interpreter (s-concat "python" (s-join "\." (-slice (s-split "\\." result) 0 2)))))
      python-interpreter))

  (defun chom/change-python-version ()
    (interactive)
    (setq-local python-shell-interpreter (chom/choose-python-version)))

  (defun chom/create-python-scratch-file ()
    (interactive)
    (let* ((is-in-python-project (and (projectile-project-p)
                                      (eq major-mode 'python-mode)))
           (python-interpreter (executable-find python-shell-interpreter))
           (temp-file-name (make-temp-file "scratch-" nil ".py"))
           (scratch-buffer (find-file temp-file-name)))
      (with-current-buffer scratch-buffer
        (if is-in-python-project
            (progn
              (pyvenv-deactivate)
              (setq-local python-shell-interpreter python-interpreter))
          (setq-local python-shell-interpreter (chom/choose-python-version))))))



  ;; === TOGGLE THING
  (defvar chom/toggle-thing-alist '()
    "nil means it expects visual selection to specify source.
Otherwise it expects a thing, e.g. 'symbol"
    )

  (defun chom/toggle-thing/get ()
    (when (evil-normal-state-p)
      (evil-visual-state)
      (evil-find-char 1 (string-to-char ")"))
      (evil-forward-char)  ;; don't know why but it works
      (exchange-point-and-mark)
      (evil-find-char-backward 1 (string-to-char "."))
      (activate-mark)))

  (defun chom/toggle-thing/ret ()
    (when (evil-normal-state-p)
      (evil-visual-state)
      (call-interactively 'evil-inner-symbol)
      (evil-find-char 1 (string-to-char "="))
      (evil-forward-char)  ;; don't know why but it works
      (activate-mark)
      ))

  (setq chom/pre-toggle-thing-alist '(
                                      (symbol . ("get" . chom/toggle-thing/get))
                                      ;; (symbol . ("[a-zA-Z_]+" . chom/toggle-thing/ret))
                                      ))
  (setq chom/toggle-thing-alist '(
                                  (symbol . ("true" . "false"))
                                  (symbol . ("True" . "False"))
                                  (symbol . ("false" . "true"))
                                  (symbol . ("False" . "True"))
                                  (visual . ("test" . "tested"))
                                  (visual . ("\\[\\(.*\\)\\]" . ".get(\\1)"))
                                  (visual . (".get(\\(.*\\),.*)" . "[\\1]"))
                                  (visual . (".get(\\(.*\\))" . "[\\1]"))
                                  (visual . ("[a-zA-Z_]+ =" . "return"))
                                  ))

  (defun chom/toggle-thing--find-match (source &optional beg end)
    (let ((beg (or beg (region-beginning)))
          (end (or end (region-end))))
      (setq deactivate-mark nil)
      (find-if (lambda (x) (or (and
                                (equal (car x) 'visual)
                                (use-region-p)
                                (string-match (cadr x)
                                              (buffer-substring-no-properties beg end)))
                               (and (thing-at-point (car x))
                                    (string-match (cadr x) (thing-at-point (car x))))))
               source)))

  (defun chom/toggle-thing ()
    "https://github.com/dalanicolai/dala-emacs-lisp/blob/master/evil-switch.el"
    (interactive)
    (let ((beg (region-beginning))
          (end (region-end))
          (pre-action (chom/toggle-thing--find-match chom/pre-toggle-thing-alist)))
      (if pre-action
          (funcall (cddr pre-action)))
      (let* ((beg (region-beginning))
             (end (region-end))
             (match (chom/toggle-thing--find-match chom/toggle-thing-alist beg end)))
        (if match
            (progn
              (let ((bounds (if (and (equal (car match) 'visual) (use-region-p))
                                (cons beg end)
                              (bounds-of-thing-at-point (car match)))))
                (goto-char (car bounds))
                (setq deactivate-mark  nil)
                (if (re-search-forward (cadr match) (cdr bounds) nil)
                    (replace-match (cddr match)))))))))

  ;; === TOGGLE THING END

  (defun chom/test ()
    (interactive)
    ;; (message "%s" (projectile-project-root))
    ;; (call-interactively 'chom/mc-make-cursors-in-selection)
    ;; (message "%s" (thing-at-point 'sexp))
    (chom/toggle-thing)
    )

  ;; ================================ VARIABLES ============================================
  (setq-default TeX-engine 'xetex)
  (show-smartparens-global-mode -1)
  (setq show-paren-highlight nil)
  (setq display-line-numbers-width-start t)
  (setq-default projectile-src-directory nil)
  (setq hs-allow-nesting t)
  (setq smartparens-strict-mode t)
  (setq tab-always-indent t)

  (defun chom/helm-search-in-selected-files ()
    (interactive)
    (helm-mark-all)
    (with-helm-alive-p
      (helm-run-after-exit (lambda ()
                             (helm-do-ag (projectile-project-root) (helm-marked-candidates))))))

  (defun chom/helm-search-action (candidate)
    (helm-do-ag (projectile-project-root) (helm-marked-candidates)))
  (setq helm-buffer-max-length 60)

  (defvar helm-projectile-file-actions
    '(("Search in files" . chom/helm-search-action)))

  (setq projectile-indexing-method 'hybrid)
  (setq projectile-enable-caching t)
  (setq dap-python-terminal "gnome-terminal -- ")
  (setq dap-python-debugger "debugpy")
  (setq sp-escape-quotes-after-insert nil)
  (setq dotspacemacs-frame-title-format "%b - %t - Visual Studio Code")
  (setq spacemacs-buffer-logo-title "Visual Studio Code")
  (setq dotspacemacs-startup-banner (substitute-in-file-name "$HOME/dotfiles/spacemacs/icons/vscode-banner.png"))
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
  (setq markdown-toc-header-toc-title "## Table of Contents")

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
  (setq org-todo-keywords '((sequence "TODO" "|" "DONE" "CANCELED")))
  (setq org-todo-keyword-faces '(("CANCELED" . "#ff6047")))
  (add-to-list 'hl-todo-keyword-faces '("CANCELED" . "#ff6047"))
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

  (with-eval-after-load 'evil-surround
    (setq-default evil-surround-pairs-alist
                  (push '(13 . ("" . "")) evil-surround-pairs-alist)))

  ;; === vC/C++
  (setq-default sp-escape-quotes-after-insert nil) ; fix inserting single quotes

  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_GB,en_US,pl_PL,de_DE")
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_GB,en_US,pl_PL,de_DE")

  ;; === vPYTHON
  (setq lsp-disabled-clients '(pyls mspyls))
  (setq python-indent-guess-indent-offset-verbose nil)
  (setq python-emacs-virtualenv-path (substitute-in-file-name "$HOME/.config/emacs/.venv"))
  (setq python-emacs-executable-path (f-join python-emacs-virtualenv-path "bin" "python"))
  (setq spacemacs-jump-handlers-python-mode (list 'dumb-jump 'evil-jump-to-tag))
  (setq flycheck-flake8rc "setup.cfg")
  (setq flycheck-pylintrc "setup.cfg")
  (setq-default flycheck-disabled-checkers '(python-pycompile))
  (setq flycheck-python-mypy-config '("mypy.ini" "pyproject.toml" "setup.cfg"))
  (setq lsp-pyls-configuration-sources ["flake8"])
  (setq-default flycheck-python-flake8-executable python-emacs-executable-path)
  (setq lsp-ui-doc-enable nil)

  ;; === vMAGIT
  (setq magit-log-margin '(t "%H:%M %d-%m-%Y" magit-log-margin-width t 20))
  (setq magit-bury-buffer-function 'magit-mode-quit-window)

  ;; === vINDENT
  (setq lsp-enable-indentation t)
  (setq lsp-enable-snippet nil)
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
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.1)
  (setq evil-want-Y-yank-to-eol t)

  ;; ============================== KEYBINDINGS ===========================================
  ;; https://develop.spacemacs.org/doc/DOCUMENTATION.html#binding-keys
  (with-eval-after-load 'helm-projectile
   (define-key helm-projectile-find-file-map (kbd "C-'") 'chom/helm-search-in-selected-files))
  (drag-stuff-mode t)
  (global-set-key (kbd "M-k") 'drag-stuff-up)
  (global-set-key (kbd "M-j") 'drag-stuff-down)

  (global-set-key [remap indent-for-tab-command] 'chom/smart-tab-jump-out-or-indent)
  (global-set-key (kbd "<backtab>") 'chom/smart-tab-jump-in-or-indent)
  (global-set-key [remap python-indent-dedent-line] 'chom/smart-tab-jump-in-or-indent)

  (global-set-key [remap c-indent-line-or-region] 'chom/smart-tab-jump-out-or-indent)

  (bind-key "C-M-b" 'evil-mc-make-cursor-backward-WORD-end)
  (define-key evil-insert-state-map (kbd "<C-tab>") 'yas-expand)
  (define-key evil-insert-state-map (kbd "C-k") nil)
  (define-key evil-visual-state-map (kbd "<C-tab>") 'yas-insert-snippet)
  (define-key evil-normal-state-map (kbd "<C-tab>") 'yas-insert-snippet)
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
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "C" 'chom/python-execute-file)
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "cr" 'dap-debug-recent)
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "p" 'chom/change-python-version)

  (bind-key "C-k" 'er/expand-region)
  (defun chom/er/shrink-region()
    (interactive)
    (er/expand-region -1))
  (bind-key "C-j" 'chom/er/shrink-region)


  ;; (bind-key "M-k" 'spacemacs/move-text-transient-state/move-text-up)
  ;; (bind-key "M-j" 'spacemacs/move-text-transient-state/move-text-down)

  (with-eval-after-load 'magit-status
    (define-key magit-status-mode-map (kbd "RET") 'magit-diff-visit-file-other-window))

  (define-key evil-normal-state-map (kbd "K") 'join-line)

  (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)
  (define-key evil-visual-state-map (kbd "grv") 'evil-mc-make-vertical-cursors)
  (define-key evil-visual-state-map (kbd "gra") 'chom/mc-make-cursors-in-selection)
  (define-key evil-visual-state-map (kbd "I") 'chom/mc-make-cursors-in-selection)
  (define-key evil-normal-state-map (kbd "C-S-n") 'evil-mc-skip-and-goto-next-match)
  (define-key evil-normal-state-map (kbd "C-S-p") 'evil-mc-skip-and-goto-prev-match)

  (define-key evil-normal-state-map (kbd ">") 'chom/shift-line-right)
  (define-key evil-normal-state-map (kbd "<") 'chom/shift-line-left)

  ;; (define-key evil-normal-state-map (kbd "RET") 'chom/open-below-and-normal-state)
  ;; (define-key evil-insert-state-map (kbd "RET") 'chom/mc-indent-on-enter-and-normal-mode)

  (define-key evil-normal-state-map (kbd "<S-return>") 'chom/open-above-and-normal-state)


  (define-key evil-mc-key-map (kbd "C-t") nil)
  (evil-define-key 'normal evil-mc-key-map (kbd "C-t") nil)
  (evil-define-key 'visual evil-mc-key-map (kbd "C-t") nil)
  (define-key evil-normal-state-map (kbd "C-t") 'transpose-chars)
  (define-key evil-insert-state-map (kbd "C-t") 'transpose-chars)
  (with-eval-after-load 'org-mode
   (define-key org-mode-map (kbd "go") 'evil-open-below)
   (define-key org-mode-map (kbd "gO") 'evil-open-above))
  (define-key evil-motion-state-map (kbd "go") nil)

  (evil-define-key 'normal helm-ls-git-rebase-todo-mode-map (kbd "p") 'helm-ls-git-rebase-pick)
  (evil-define-key 'normal helm-ls-git-rebase-todo-mode-map (kbd "r") 'helm-ls-git-rebase-reword)
  (evil-define-key 'normal helm-ls-git-rebase-todo-mode-map (kbd "e") 'helm-ls-git-rebase-edit)
  (evil-define-key 'normal helm-ls-git-rebase-todo-mode-map (kbd "s") 'helm-ls-git-rebase-squash)
  (evil-define-key 'normal helm-ls-git-rebase-todo-mode-map (kbd "f") 'helm-ls-git-rebase-fixup)
  (evil-define-key 'normal helm-ls-git-rebase-todo-mode-map (kbd "x") 'helm-ls-git-rebase-exec)
  (evil-define-key 'normal helm-ls-git-rebase-todo-mode-map (kbd "d") 'helm-ls-git-rebase-drop)

  (evil-define-key 'normal comint-mode-map (kbd "C-j") 'compilation-next-error)
  (evil-define-key 'normal comint-mode-map (kbd "C-k") 'compilation-previous-error)
  (evil-define-key 'normal comint-mode-map (kbd "q") 'spacemacs/delete-window)
  (evil-define-key 'normal special-mode-map (kbd "q") 'spacemacs/delete-window)
  (define-key evil-normal-state-map (kbd "-") 'chom/dired)
  (define-key dired-mode-map (kbd "C-h") 'dired-up-directory)
  (define-key dired-mode-map (kbd "C-l") 'chom/dired-enter-dir)
  (define-key dired-mode-map (kbd "ę") 'wdired-change-to-wdired-mode)
  (with-eval-after-load "wdired"
    (define-key wdired-mode-map (kbd "π") 'wdired-abort-changes)
    )
  (define-key evil-motion-state-map (kbd "-") nil)
  (unbind-key (kbd "C-b") evil-motion-state-map)
  (unbind-key (kbd "C-f") evil-motion-state-map)

  (evil-define-key 'visual evil-mc-key-map
    "A" #'evil-mc-make-cursor-in-visual-selection-end
    "I" nil ;; #'evil-mc-make-cursor-in-visual-selection-beg
    )

  (with-eval-after-load 'lsp-mode
    (define-key lsp-mode-map (kbd "<C-down-mouse-1>") 'spacemacs/jump-to-definition)
    (define-key lsp-mode-map (kbd "<double-mouse-1>") 'spacemacs/jump-to-definition)
    )
  (define-key evil-motion-state-map (kbd "<double-down-mouse-1>") nil)
  (define-key evil-motion-state-map (kbd "<double-mouse-1>") nil)
  (define-key evil-motion-state-map (kbd "<down-mouse-1>") nil)
  (define-key global-map (kbd "<down-mouse-1>") nil)

  (define-key evil-motion-state-map (kbd "<mouse-8>") 'evil-jump-backward)
  (define-key evil-motion-state-map (kbd "<mouse-9>") 'evil-jump-forward)


  (spacemacs/set-leader-keys "id" 'org-read-date-interactive)
  (spacemacs/set-leader-keys "bNs" 'chom/create-python-scratch-file)
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "," 'chom/create-python-scratch-file)
  (bind-key "C-l" 'chom/toggle-thing)
  ;; (define-key evil-insert-state-map (kbd "C-j") 'evil-next-line)
  ;; (define-key evil-insert-state-map (kbd "C-k") 'evil-previous-line)

  ;; ================================ HOOKS ===============================================
  (add-hook 'dart-mode-hook 'chom/buffer-face-mode-dart)
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
  (defun chom/import-symbol-under-cursor ()
    (interactive)
    (let* ((symbol (thing-at-point 'symbol))
           (output (shell-command-to-string (concat
                                             python-emacs-executable-path
                                             " -m importsorcery"
                                             " --index " (if projectile-src-directory
                                                             (f-join (projectile-project-root) projectile-src-directory)
                                                           (projectile-project-root))
                                             " -e .venv __pycache__ .git .mypy_cache"
                                             " --symbol " (format "%s" symbol)
                                             " -p " python-shell-interpreter
                                             " --current-file " (buffer-file-name))))
           (candidates (s-split "\n" output))
           (filtered-candidates (-filter (lambda (import) (string-match-p (regexp-quote "import") import)) candidates)))
      (if filtered-candidates
          (progn
            (let ((candidate (helm :sources (helm-build-sync-source "import candidates"
                                      :candidates candidates)
                                   :buffer "*helm sync source*")))
              (if candidate
                  (save-excursion
                    (goto-char (point-min))
                    (while (or (string-prefix-p "#" (thing-at-point 'char))
                               (string-prefix-p "from __future__ import" (thing-at-point 'line)))
                      (evil-next-line))
                    (insert (concat candidate "\n"))))))
        (message "No candidates for symbol %s" symbol))))

  (defun chom/python-setup ()
    (define-key python-mode-map (kbd "C-j") nil)
    (add-to-list 'flycheck-disabled-checkers 'python-pylint)
    (let ((virtualenv-dir-path (chom/get-python-virtualenv-path)))
      (setq-local flycheck-python-flake8-executable (f-join python-emacs-virtualenv-path "bin" "flake8"))
      (setq-local flycheck-python-mypy-executable (f-join python-emacs-virtualenv-path "bin" "mypy"))

      (if virtualenv-dir-path
          (progn
            (message virtualenv-dir-path)
            ;; Python executable
            (setq-local python-shell-interpreter (f-join "/" virtualenv-dir-path "bin" "python"))
            (setq-local dap-python-executable python-shell-interpreter)
            ;; Linters

            (setq-local flycheck-python-mypy-executable
                        (if (file-executable-p (f-join "/" virtualenv-dir-path "bin" "mypy"))
                            (f-join "/" virtualenv-dir-path "bin" "mypy")
                          (f-join python-emacs-virtualenv-path "bin" "mypy")))

            (setq-local flycheck-python-flake8-executable
                        (if (file-executable-p (f-join "/" virtualenv-dir-path "bin" "flake8"))
                            (f-join "/" virtualenv-dir-path "bin" "flake8")
                          (f-join python-emacs-virtualenv-path "bin" "flake8")))
            ;; (setq-local flycheck-python-pylint-executable (f-join "/" virtualenv-dir-path "bin" "pylint"))
           )
        )
      )

    (fset 'python-\[\]-get
          (kmacro-lambda-form [?c ?s ?\] ?\) ?i ?. ?g ?e ?t escape ?f ?\" ?t ?\"] 0 "%d"))
    (define-key evil-insert-state-map (kbd "M-RET") 'chom/import-symbol-under-cursor)
    (define-key evil-normal-state-map (kbd "M-RET") 'chom/import-symbol-under-cursor)
    (global-set-key [remap python-indent-dedent-line] 'chom/smart-tab-jump-in-or-indent)
    (chom/python-font-setup)
    )

  (defun chom/python-remove-unused-imports ()
    (interactive)
    (call-process python-emacs-executable-path
                  nil
                  0
                  nil
                  "-m"
                  "autoflake"
                  "--in-place"
                  "--remove-unused-variables"
                  (buffer-file-name)))

  (defun chom/sort-python-imports ()
    (interactive)
    (when (derived-mode-p 'python-mode)
      (call-process python-emacs-executable-path
                    nil
                    0                                  ; <- Discard and don't wait
                    nil
                    "-m"
                    "reorder_python_imports"
                    (buffer-file-name))))

  ;; This hook needs to be used not to make settings overridden by package setup.
  (add-hook 'python-mode-hook 'chom/python-setup t)
  (add-hook 'python-mode-hook 'display-fill-column-indicator-mode t)
  ;; (add-hook 'python-mode-hook (lambda() (add-hook 'after-save-hook 'chom/sort-python-imports nil 'make-it-local)))


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
  (defun chom/LaTeX/build-on-save ()
    (if (= (file-name-extension (buffer-file-name)) "tex")
        (add-hook 'after-save-hook 'latex/build nil 'make-it-local)))
  (add-hook 'LaTeX-mode-hook (lambda()
                               (chom/LaTeX/build-on-save)
                               (define-key evil-normal-state-map (kbd "o") 'chom/LaTeX/add-item-below)
                               (define-key evil-normal-state-map (kbd "O") 'chom/LaTeX/add-item-above)))
  (add-hook 'LaTeX-mode-hook 'chom/environment-object)
  (remove-hook 'LaTeX-mode-hook 'latex/auto-fill-mode)

  ;; === JSON-h
  (add-hook 'json-mode-hook (lambda()
                              (setq tab-width 4)))

  ;; === WORKAROUNDS AND PATCHES
  ;; https://github.com/syl20bnr/spacemacs/issues/9756#issuecomment-363436814
  ;; (setq spacemacs-default-jump-handlers
  ;;       (remove 'evil-goto-definition spacemacs-default-jump-handlers))

  ;; (setq spacemacs-default-jump-handlers '(evil-goto-definition))

  ;; (defun kadir/helm--collect-matches (orig-fun src-list &rest args)
  ;;   (let ((matches
  ;;          (cl-loop for src in src-list
  ;;                   collect (helm-compute-matches src))))
  ;;     (unless (eq matches t) matches)))

  ;; (advice-add 'helm--collect-matches :around #'kadir/helm--collect-matches)

  (setq enable-local-eval t)
  (put 'projectile-src-directory 'safe-local-variable #'stringp)
  (put 'lsp-python-ms-extra-paths 'safe-local-variable #'stringp)
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
   '(rustic org-plus-contrib evil-unimpaired f s dash doom-dark+-theme))
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
