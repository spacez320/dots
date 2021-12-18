"""
""" Python specific Vim settings.
"""

" Set whitespace management.
setlocal cc=99
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=99

" Enable auto invocation of Black on save.
au BufWrite * :Autoformat
let g:formatdef_black = '"black --quiet -"'
let g:formatters_python = ['black']

" Make Syntastic use Flake8.
let g:syntastic_python_checkers = ['flake8']
