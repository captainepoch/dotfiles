"--------------------------------"
" Colorscheme
"--------------------------------"
set t_Co=256
colorscheme sunburst
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
set clipboard=unnamedplus
set backspace=indent,eol,start
"--------------------------------"
" Width and formating
"--------------------------------"
set textwidth=80
set wrapmargin=2
set formatoptions+=t
set formatoptions-=l
set colorcolumn=-2
"--------------------------------"
" File and encoding
"--------------------------------"
filetype off
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,latin1
set nu!
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
Plugin 'vim-airline/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'godlygeek/tabular'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ervandew/SuperTab'
call vundle#end()
filetype plugin indent on
"--------------------------------"
" Plugin - vim-airline
"--------------------------------"
set noshowmode
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2
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
