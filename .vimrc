set encoding=utf-8

let mapleader = ","

" PLUGINS
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'airblade/vim-gitgutter'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
	Plug 'mangeshrex/uwu.vim'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" DEFAULTS
filetype plugin indent on
syntax on

set nocompatible
set nobackup nowritebackup noswapfile  noundofile
set number relativenumber
set nowrap
set hidden
set laststatus=0
set scrolloff=10
set shortmess=acI
set mouse=a
set cmdheight=2
set signcolumn=yes
set updatetime=300

" BACKSPACE as expected
set backspace=indent,eol,start

" TABS for indentation, SPACES for alignment
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

" WHITESPACE visible
set listchars=eol:↙︎,tab:‧‧,trail:‧
set list

" CONCEAL
au VimEnter * syntax keyword Statement lambda conceal cchar=λ
au VimEnter * syntax match arrow "->" conceal cchar=→
au VimEnter * hi! link Conceal Statement
au VimEnter * set conceallevel=2

" FZF
set rtp+=/usr/local/opt/fzf
map		<leader>f		:Files<CR>
map		<leader>l		:BLines<CR>
map		<leader>b		:Buffers<CR>

" HEXOKINASE
let g:Hexokinase_highlighters = ['backgroundfull']

" COC
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-html', 'coc-css', 'coc-pyright', 'coc-go', 'coc-clangd']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" VIM-GO
let g:go_diagnostics_enabled=0
let g:go_metalinter_enabled=[]
let g:go_jump_to_error=0
let g:go_echo_go_info=0

" COLORSCHEME
colorscheme uwu

set t_Co=256
let &t_ut=''
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

highlight Comment cterm=italic gui=italic ctermfg=60 guifg=#5f5f87
highlight SpecialKey ctermfg=240 guifg=#585858
highlight NonText ctermfg=240 guifg=#585858
