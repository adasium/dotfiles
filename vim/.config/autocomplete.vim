" ULTISNIPS
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']

" COMPLETOR
let g:completor_python_binary = '/usr/bin/python3'
let g:completor_clang_binary = '/usr/bin/clang'
let g:completor_node_binary = '/usr/bin/node'
let g:completor_min_chars = 1
let g:completor_completion_delay = 5
let g:completor_complete_options = 'menuone,noselect'


" CTRLP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" JEDI
let g:jedi#completions_command = ""
let g:jedi#goto_command = "F12"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#documentation_command = ""
let g:jedi#rename_command = "<leader>r"
let g:jedi#usages_command = "<leader>n"

let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
let g:jedi#auto_close_doc = 1
let g:jedi#show_call_signatures = 1
let g:jedi#show_call_signatures_delay = 100
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#completions_enabled = 1
let g:jedi#smart_auto_mappings = 0
let g:jedi#use_tag_stack = 1

" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js"
