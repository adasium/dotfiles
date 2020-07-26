" no arrows
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
"jj to esc
inoremap jj <Esc>
inoremap fd <Esc>

" remapings
imap <C-q> <Esc>
nnoremap YY :%y+<CR>

nnoremap <space><cr> :set hlsearch! hlsearch?<cr>

noremap <space>y "*y
noremap <space>Y "*Y
noremap <space>p "*p
noremap <space>P "*P

noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>P "+P

nnoremap <c-s-tab> gT
nnoremap <c-tab> gt

inoremap <s-tab> <c-d>

nnoremap <space>a ggVG

vnoremap > >gv
vnoremap < <gv
nnoremap > >>
nnoremap < <<

command! SetCwd :cd %:p:h

nnoremap <F6> :SetCwd<CR>

map <C-F5> :set rnu!<CR>
map <F5> :source ~/.vimrc<CR>

vnoremap gO "py<Esc>:e <C-R>p<CR>
vnoremap gT "py<Esc>:tabe <C-R>p<CR>
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv

nmap \\ :CtrlP<CR>

" swap lines with Alt+j/Alt+k
" fix to make arrows work
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50
" actual mappings
nnoremap <silent><A-j> :m .+1<CR>==
nnoremap <silent><A-k> :m .-2<CR>==
inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

" tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tc  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Kept as a reference
"inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<Tab>"
"inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" Jump to middle of the line
nnoremap gm :call cursor(0, len(getline('.'))/2)<cr>

function! TagInNewTab()
    let word = expand("<cword>")
    redir => tagsfiles
    silent execute 'set tags'
    redir END
    tabe
    execute 'setlocal' . strpart(tagsfiles, 2)
    execute 'tag ' . word
endfunction

nnoremap gnt :call TagInNewTab()<CR>

nnoremap <leader>J J
vnoremap <leader>J J
inoremap <leader>J <ESC><UP>JJi<BS><ESC><Right>
function! SkipClosingParentheses()
  let line = getline('.')
  let current_char = line[col('.')-1]

  "Ignore EOL
  if col('.') == col('$')
    return "\t"
  end

  return stridx(']})"', current_char)==-1 ? "\t" : "\<Right>"
endfunction
inoremap <expr> <leader><tab> SkipClosingParentheses()
inoremap <leader>O <ESC>O
inoremap <leader>o <ESC>o
nnoremap <c-s-f> :Ag<cr>
nmap <leader>gf :CtrlP<CR><C-\>w
xnoremap p "_dP

vnoremap <C-r> :s/
nnoremap == gg=G<C-o><C-o>
