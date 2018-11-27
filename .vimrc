syntax on
set number
set ruler
set tabstop=2
set softtabstop=2
set shiftwidth=2
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
set ambiwidth=double

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

""""""""""""""""""""
" dein.vim
""""""""""""""""""""
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('Shougo/denite.nvim')
 call dein#add('Shougo/neomru.vim')
 call dein#add('Shougo/neosnippet.vim')
 call dein#add('Shougo/neosnippet-snippets')
 call dein#add('Shougo/unite.vim')
 call dein#add('Shougo/unite-outline')
 call dein#add('w0rp/ale')
 call dein#add('pangloss/vim-javascript')
 call dein#add('othree/yajs.vim')
 call dein#add('MaxMEllon/vim-jsx-pretty')
 call dein#add('carlitux/deoplete-ternjs')
 call dein#add('wokalski/autocomplete-flow')
 call dein#add('slim-template/vim-slim')
 call dein#add('kchmck/vim-coffee-script')
 call dein#add('tpope/vim-haml')
 call dein#add('shmargum/vim-sass-colors')
 call dein#add('tpope/vim-fugitive')
 call dein#add('scrooloose/nerdtree')
 call dein#add('itchyny/lightline.vim')
 call dein#add('w0ng/vim-hybrid')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable
set background=dark
colorscheme hybrid

""""""""""""""""""""
" denite.nvim
""""""""""""""""""""
nnoremap <silent> <C-o> :Denite file_rec<CR>
nnoremap <silent> <C-g> :Denite grep<CR>
nnoremap <silent> <C-l> :Denite file_mru<CR>
nnoremap <silent> <S-o> :Denite buffer<CR>

call denite#custom#var('grep', 'command', ['pt'])
call denite#custom#var('grep', 'default_opts', ['--nogroup', '--nocolor', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

""""""""""""""""""""
" deoplete.nvim
""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

""""""""""""""""""""
" vim-javascript
""""""""""""""""""""
let g:javascript_plugin_flow = 1

""""""""""""""""""""
" NERDTree
""""""""""""""""""""
map <silent> <F1> <esc>:NERDTreeToggle<cr>

""""""""""""""""""""
" lightline.vim
""""""""""""""""""""
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'gitbranch', 'readonly', 'fugitive', 'filename' ]
  \   ]
  \ },
  \ 'component_function': {
  \   'filename': 'LLFilename',
  \   'gitbranch': 'fugitive#head'
  \ },
\ }

function! LLFilename()
  return ('' != expand('%:t') ? expand('%') : '[No Name]')
endfunction
