"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
"
" Vim configuration, using Pathogen.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Invoke Pathogen and load plugins.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Turn on file specific indentation.
filetype plugin indent on

set autoindent
set cc=80
set dir=$HOME/.vim/swp
set encoding=utf-8
set expandtab
set incsearch
set list
set listchars=tab:»·,trail:·
set ls=2
set modeline
set nocompatible
set nofoldenable
set nowrap
set number
set shiftwidth=2
set smartcase
set softtabstop=2
set statusline+=\ %f%=%l/%L\ 
set t_Co=256
set tabstop=2

autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent loadview
" Preserve the window on quit.
autocmd VimLeave * :!clear

" Clear whitespace.
vmap ,w :s/\s*$//g<CR> :nohl<CR>
" vnoremap . :normal .<CR>  # TODO Not sure what this does.

" Sudo write.
command W w !sudo tee % > /dev/null

" Enable and configure Syntastic.
syntax enable
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
