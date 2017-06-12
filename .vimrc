syntax on
set number
set ruler
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set expandtab
set hlsearch
set ignorecase
set smartcase
set wrapscan
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set list
set listchars=tab:>-,trail:_
set vb t_vb=
set t_Co=256

filetype plugin on

""""""""""""""""""""
" KeyMapping
""""""""""""""""""""
" esc
noremap <C-{> <ESC>
" back space
noremap <C-h> <BS>
" next buffer
nnoremap <C-n> <ESC>:bn<CR>
" previous buffer
nnoremap <C-p> <ESC>:bp<CR>
" tab new
nnoremap <silent> tc <ESC>:tabe<CR>
" tab close
nnoremap <silent> td <ESC>:tabc<CR>
" tab next
nnoremap <silent> tn <ESC>:tabn<CR>
" tab prev
nnoremap <silent> tp <ESC>:tabN<CR>
" search
nnoremap / /\v

""""""""""""""""""""
" NeoBundle
""""""""""""""""""""
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

" Bundles
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'slim-template/vim-slim'

" colors
NeoBundle 'w0ng/vim-hybrid'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

colorscheme hybrid

filetype plugin indent on     " Required!

"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
          \ string(neobundle#get_not_installed_bundle_names())
            echomsg 'Please execute ":NeoBundleInstall" command.'
              "finish
              endif

""""""""""""""""""""
" neocomplete.vim
""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#max_list = 20
let g:neocomplete#force_overwrite_completefunc = 1

""""""""""""""""""""
" unite.vim
""""""""""""""""""""
let g:unite_enable_start_insert=1
nnoremap <silent> <C-o> :<C-u>Unite file_mru<CR>
nnoremap <silent> <S-o> :<C-u>Unite buffer<CR>

""""""""""""""""""""
" unite-outline.vim
""""""""""""""""""""
nnoremap <silent> <F2> :Unite outline<CR>

""""""""""""""""""""
" NERDTree
""""""""""""""""""""
map <silent> <F1> <esc>:NERDTreeToggle<cr>

""""""""""""""""""""
" Syntastic
""""""""""""""""""""
let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'passive_filetypes': []
    \ }
let g:syntastic_javascript_checkers = ['jshint', 'jslint']

"""""""""""""""""""
" quickrun.vim
"""""""""""""""""""
map <silent> <C-e> <esc>:QuickRun<cr>

