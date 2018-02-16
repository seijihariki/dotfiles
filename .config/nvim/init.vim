call plug#begin()
" Code Completion
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Search
" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Full-Text Search
Plug 'rking/ag.vim'

" Search & Replace
Plug 'brooth/far.vim'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'

" Tagbar
Plug 'majutsushi/tagbar'

" Vim Vinegar
Plug 'tpope/vim-vinegar'

" Nerd Tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

call plug#end()

let g:molokai_original = 1

" Mouse on
set mouse=a
" Four spaces
set shiftwidth=4
" Tab Stop
set tabstop=4
" Spaces instead
set expandtab
" Show Matching
set showmatch
" Line numbers
set number
" Some mappings
nmap <C-s> :w<CR>
nmap <C-r> :%s//g<Left><Left>
" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nmap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Apply theme
set background=dark
colorscheme hybrid

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-p> :FZF<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
