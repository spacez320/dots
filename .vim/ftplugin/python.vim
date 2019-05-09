setlocal cc=99
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=99

" Autoformat
au BufWrite * :Autoformat
let g:formatdef_black = '"black --quiet -"'
let g:formatters_python = ['black']
