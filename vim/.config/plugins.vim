".vimrc
map <f7> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <f7> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <f7> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <f7> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <f7> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <f7> :call CSSBeautify()<cr>


".vimrc
autocmd FileType javascript vnoremap <buffer>  <f7> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <f7> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <f7> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <f7> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <f7> :call RangeCSSBeautify()<cr>
