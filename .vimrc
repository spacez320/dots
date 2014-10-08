"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
"
" Vim configuration, using Pathogen.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" config
filetype plugin indent on
syntax enable

" sets
set nocompatible
set number
set nowrap
set autoindent
set t_Co=256
set encoding=utf-8
set incsearch
set modeline
set ls=2
if has("cc")
  set cc=80
endif
set list
set listchars=tab:»·,trail:·
set smartcase
set dir=~/.swp
set statusline+=%f

" auto views
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

" preserve the window on quit
au VimLeave * :!clear

" spacing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" mappings
map ,c :match ErrorMsg '\%>80v.\+'<CR>
map <c-h> :set hlsearch!<CR>
vmap ,x :!tidy -q -i --show-errors 0<CR>
vmap ,w :s/\s*$//g<CR> :nohl<CR>
vnoremap . :normal .<CR>

" commands
command W w !sudo tee % > /dev/null

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" commentary
autocmd FileType python set commentstring=#\ %s
autocmd FileType nginx set commentstring=#\ %s
autocmd FileType haproxy set commentstring=#\ %s
autocmd FileType monitrc set commentstring=#\ %s
autocmd FileType puppet set commentstring=#\ %s

" colors
colorscheme codeschool
hi ColorColumn ctermbg=235 guibg=2c2d27
highlight LineNr ctermfg=236 ctermbg=233
hi NonText ctermfg=59 ctermbg=16 cterm=NONE gui=NONE

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""" functions """

" BufWritePost autocmd
augroup runtime
  command -nargs=1 P :au runtime BufWritePost * <args>
  command O :au! runtime
augroup end

" column of iterating numbers
function! ColIter()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call ColIter()<CR>

""" sources """

" source .lvimrc
if filereadable("./.lvimrc")
  exe 'source' "./.lvimrc"
endif
