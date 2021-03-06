"Use vim settings (not vi) 
set nocompatible

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd		"show incomplete cmds down the bottom
set showmode	"show current mode down the bottom

set number		"show line numbers

"display tabs and trailing spaces
"set list
"set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
"set filetype on for c/java files
filetype on
au FileType l,cu,c,cpp,java set cindent
autocmd BufNewFile,BufReadPost *.cuh, set filetype=cpp
autocmd BufNewFile,BufReadPost *.l, set filetype=c
set incsearch   "find the next match as we type the search
set hlsearch    "highlight searches by default

set laststatus=2
set statusline=%-10.3n%c "buffer number
set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient pointset tabstop=3

"default indent settings
set tabstop=8
set expandtab
set shiftwidth=4
set smarttab autoindent 

"show edit mode and matching braces
set showmode
set showmatch

set textwidth=80
set pastetoggle=<f2>
set ruler

if &t_Co > 1
	syntax enable
endif

"key remaps
inoremap jk <ESC>
vnoremap jk <ESC>
"for autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"Tab for buffer switch
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

:nnoremap <C-F> :Isort<CR> :LspDocumentFormat<CR>
:nnoremap <C-N> :LspNextDiagnostic<CR>


call plug#begin('~/.vim/plugged')
"My Plugs
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'bling/vim-airline'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'Yggdroot/indentLine'
Plug 'chriskempson/base16-vim'
Plug 'tacahiroy/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-obsession'
Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous'
"FZF stuff
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'raphamorim/lucario'
Plug 'tpope/vim-dispatch'

"autocompletions stuff
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
"Plug 'ryanolsonx/vim-lsp-python'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'fisadev/vim-isort'
Plug 'mattn/vim-lsp-settings'
call plug#end()
filetype plugin indent on


" error status
let g:lsp_diagnostics_echo_cursor = 1
"let g:lsp_semantic_enabled = 1
let g:lsp_virtual_text_enabled = 0
let g:lsp_settings = {
\  'clangd': {'cmd': ['clangd']},
\}
"set pyls error log settings
"let g:lsp_settings = {
"\  'pyls': {'cmd': ['pyls', '-vvv', '--log-file', '/tmp/pyls.log']},
"\}


"if executable('pyls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls', '--verbose', '--log-file', '/tmp/pyls-log.txt']},
"        \ 'whitelist': ['python']
"        \ })
"endif
"

" C++ IDE stuff
"if executable('clangd')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'clangd',
"        \ 'cmd': {server_info->['clangd']},
"        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"        \ })
"endif
"




"colors
"colorscheme lucario
set background=dark
"colorscheme seoul256
"colorscheme base16-solarized-dark
"colorscheme base16-atelierseaside
"set background=dark
"
"
"
"NERDTREE Fix
let g:NERDTreeDirArrows=0
set encoding=utf-8
"vim airline options
"Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


"for buffer switch, turn off need to save to switch buffers
set hidden

"for latex
let g:tex_conceal = ""
let g:tex_flavor='latex'

let g:lsp_log_verbose = 2
let g:lsp_log_file = expand('/tmp/vim-lsp.log')

" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')
"remove preview
set completeopt-=preview
