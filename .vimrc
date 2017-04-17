" Just necessary
set nocompatible
" Turns on syntax highlighting
syntax on
" Set encoding to UTF-8
set encoding=utf8

""" Vundle configuration

" Necessary for Vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" Util

" Adds tab auto-completion
Plugin 'ervandew/supertab'

" Checks syntax and compiles on save
Plugin 'scrooloose/syntastic'

" Easy tabulation
Plugin 'godlygeek/tabular'

"" Editor

" Adds file tree and tab handling
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Adds tagbar - function & class structure
Plugin 'majutsushi/tagbar'

" Vim airline - information bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"" Colorschemes
Plugin 'sickill/vim-monokai'

"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"" Basic editor configurations
" Show number lines
set number
" Insert spaces instead of tabs
set expandtab
" Set tab size as 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Turn on auto indent
set autoindent
" Max code line width
set textwidth=80
" Set bg as dark
set background=dark
" Disables swap file creation
set noswapfile
" Activate mouse handling
set mouse=a
" Activates 256 colors for terminal
set t_Co=256
" Sets colorscheme
colorscheme monokai
" Sets transparent bg
hi Normal ctermbg=none
highlight NonText ctermbg=none
" Highlight redundant whitespaces and tabs.
highlight RedundantSpaces ctermbg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

" Turns filetype back on
filetype on

"" Tagbar configuration
" Do not close Tagbar automatically
let g:tagbar_autoclose = 0
" Open Tagbar on init
autocmd VimEnter * TagbarOpen

"" Vim airline configuration
" Set vim airline theme
let g:airline_theme = 'badwolf'
" Activate powerline fonts
let g:airline_powerline_fonts = 1
" Activate tabline
let g:airline#extensions#tabline#enabled = 1

"" NERDTree configuration
" Opens NERDTree on init
let g:nerdtree_tabs_open_on_console_startup = 1
" Automatically find and select opened file
let g:nerdtree_tabs_autofind=1

"" Syntastic configuration
" Syntastic recommended settings
let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
