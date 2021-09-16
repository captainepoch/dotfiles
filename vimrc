"--------------------------------"
" Colorscheme
"--------------------------------"
set t_Co=256
syntax on
set completeopt-=preview
"--------------------------------"
" Tabulation
"--------------------------------"
set nocompatible
set wrap
set linebreak
set nolist
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set smarttab
set nowrap
set ruler
set splitbelow
set hidden
set notimeout
set clipboard=unnamedplus
set backspace=indent,eol,start
"--------------------------------"
" File and encoding
"--------------------------------"
filetype off
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,latin1
set nu!
"--------------------------------"
" Width and formating
"--------------------------------"
set textwidth=80
set wrapmargin=2
set formatoptions+=t
set formatoptions-=l
set colorcolumn=-2
set cc=80
"--------------------------------"
" Buffer-specific settings
"--------------------------------"
autocmd Filetype gitcommit setlocal tw=72 encoding=utf-8 fileencoding=utf-8
autocmd FileType markdown setlocal et ts=2 sw=2
autocmd FileType mail setlocal noautoindent tw=72
augroup filetypedetect
  autocmd BufRead,BufNewFile *mutt-* setfiletype mail
"--------------------------------"
" Remap yank & paste (clipboard)
"--------------------------------"
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
"--------------------------------"
" Vundle
"--------------------------------"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" PLUGINS
Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/SuperTab'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
call vundle#end()
filetype plugin indent on
"--------------------------------"
" Plugin - vim-colorschemes
"--------------------------------"
colorscheme xoria256
"--------------------------------"
" Plugin - vim-airline
"--------------------------------"
set noshowmode
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2
let g:airline_theme='wombat'
"--------------------------------"
" Plugin - indentLine
"--------------------------------"
let g:indentLine_char = '|'
let g:indentLine_color_term = 239
"--------------------------------"
" Plugin - syntastic
"--------------------------------"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
