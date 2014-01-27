" .vimrc
"
" Vim configuration.

" basic config
filetype plugin indent on
syntax enable

" basic editor options
set nocompatible
set number
set nowrap
set autoindent
set t_Co=256
set encoding=utf-8
set incsearch
set modeline
set ls=2
set cc=80
set list
set listchars=tab:»·,trail:·

" auto views
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

" preserve the window when leaving vim
au VimLeave * :!clear

" sane spacing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" key mappings
map ,c :match ErrorMsg '\%>80v.\+'<CR>
map <c-h> :set hlsearch!<CR>
vmap ,x :!tidy -q -i --show-errors 0<CR>
vmap ,c :s/^/#/g<CR> :nohl<CR>
vmap ,u :s/^#//g<CR> :nohl<CR>
vnoremap . :normal .<CR>

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" colors
if system('echo $RANDOM') < 16383
  colorscheme solarized
else
  let g:zenburn_high_Contrast = 1
  colorscheme zenburn
  hi ColorColumn ctermbg=235 guibg=#2c2d27
endif
set background=dark

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" functions and such

" sudo write
command W w !sudo tee % > /dev/null

" shortcut for BufWritePost autocmd
augroup runtime
  command -nargs=1 P :au runtime BufWritePost * <args> 
  command O :au! runtime
augroup end

" inline pandoc 
" pandoc -f <from> -t <to> <...>
if !exists("g:pandoc")
  let g:pandoc = "pandoc"
endif
function Pandoc(from,to,...)
  let tmp = tempname()
  execute "silent !".g:pandoc." -f ".a:from." -t ".a:to." ".join(a:000)." % 2> /dev/null > ".tmp
  silent !clear
  execute "silent ![ -s ".tmp." ] && cp ".tmp." %"
endfunction
command -nargs=+ Pandoc call Pandoc(<f-args>)

" source any .lvimrc files
if filereadable("./.lvimrc")
  exe 'source' "./.lvimrc"
endif
