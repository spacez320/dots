"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
"
" Vim configuration, using Pathogen.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

""" Configuration

filetype plugin indent on
syntax enable

" Settings
set autoindent
set cc=80
set dir=$HOME/.vim/swp
set encoding=utf-8
set incsearch
set list
set listchars=tab:»·,trail:·
set ls=2
set modeline
set nocompatible
set nofoldenable
set nowrap
set number
set smartcase
set statusline+=\ %f%=%l/%L\ 
set t_Co=256

" Auto views
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

" Preserve the window on quit.
au VimLeave * :!clear

" Spacing
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Mappings
map ,c :match ErrorMsg '\%>80v.\+'<CR>
map <c-h> :set hlsearch!<CR>
vmap ,w :s/\s*$//g<CR> :nohl<CR>
vmap ,x :!tidy -q -i --show-errors 0<CR>
vnoremap . :normal .<CR>

" Commands
command W w !sudo tee % > /dev/null

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers=['flake8']
