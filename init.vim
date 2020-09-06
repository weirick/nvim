let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

" Editor behavior
set fileformats=unix,dos,mac
set number
set cursorline
set hidden
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set notimeout
set wrap
set foldmethod=indent
set foldlevel=100
set foldenable
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set inccommand=split
set lazyredraw
set visualbell
set colorcolumn=100
set updatetime=100
set ruler
set mouse=a

" Terminal behavior
syntax on
set cursorline
colorscheme onedark
set background=dark

" Mappings
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap <C-s> :w<CR>
vnoremap <BS> d
vnoremap <C-X> +x
vnoremap <S-Del> +x
vnoremap <C-C> +y
vnoremap <C-Insert> +y
map <C-V> "+gP
map <S-Insert> "+gP
noremap <C-Z> u

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'joshdick/onedark.vim'

call plug#end()

filetype plugin indent on

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Map leader to ,
let mapleader=','

let no_buffers_menu=1
set mousemodel=popup
set t_Co=256

"" Status bar
set laststatus=2

let g:airline_theme = 'jellybeans'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

command! FixWhitespace :%s/\s\+$//e

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

set autoread

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" javascript
let g:javascript_enable_domhtmlcss = 1

augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END

" vuejs
let g:vue_disable_pre_processors=1
let g:vim_vue_plugin_load_full_syntax = 1

" nerdtree
autocmd vimenter * NERDTree

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <C-B> :NERDTreeToggle<CR>

let NERDTreeWinPos='left'
let NERDTreeWinSize=24


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" coc.nvim
let g:coc_global_extensions = ['coc-html','coc-css', 'coc-json',
  \ 'coc-java','coc-calc','coc-clangd','coc-explorer',
  \ 'coc-emmet','coc-snippets','coc-xml','coc-phpactor',
  \ 'coc-markdownlint','coc-highlight','coc-snippets']
