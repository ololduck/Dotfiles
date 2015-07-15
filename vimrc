set nocompatible

if &shell =~# 'fish$'
    set shell=bash
endif

filetype off " required for vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" And now, the plugins.
" Panes/UI
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-signify'
Plugin 'itchyny/lightline.vim'
Plugin 'nanotech/jellybeans.vim'
" Functionalities
Plugin 'rking/ag.vim' " search via Ag
Plugin 'ervandew/supertab' "tab as ctrl+p
Plugin 'jmcantrell/vim-virtualenv' " use venvs if avail.
Plugin 'msanders/snipmate.vim' "configure some snippets
Plugin 'kien/ctrlp.vim'
" Indicators
Plugin 'scrooloose/syntastic'
Plugin 'myusuf3/numbers.vim'
Plugin 'davidhalter/jedi-vim'
" Syntaxes/Languages
Plugin 'gabrielelana/vim-markdown'
Plugin 'dag/vim-fish'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
if $COLORTERM == 'xcfe4-terminal'
    set t_Co=256
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

if has("syntax")
    syntax on
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
    filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set number      " Show line numbers
set ignorecase  " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
set autowrite   " Automatically save before commands like :next and :make
set hidden      " Hide buffers when they are abandoned
set tabstop=4   " 1 tab = 4 spaces
set shiftwidth=4 " Same here
set expandtab   " Automagically expand tabs to space
set smartindent " Enable smart indentation
set autoindent  " Enable automatic indentation
set wildmenu    " Better command-line completion
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
set ruler
set shortmess=a

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set laststatus=2 " To understand this, :h laststatus
set foldmethod=syntax

"lightline
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \     'left': [['mode', 'paste'],
    \              ['fugitive', 'readonly', 'filename', 'modified'] ]
    \ },
    \ 'component_function': {
    \     'fugitive': 'FugitiveStatus',
    \     'readonly': 'ReadonlyStatus',
    \     'modified': 'ModifiedStatus'
    \ },
    \ 'component_expand': {
    \   'syntastic': 'SyntasticStatuslineFlag',
    \ }
\ }

function! ModifiedStatus()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! ReadonlyStatus()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! FugitiveStatus()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

" Configure the used VCS
let g:signify_vcs_list = [ 'git' ]

" Theme
colorscheme jellybeans
"let g:airline_theme='base16' " works great with desert with pastel term colors

" Syntastic config
let g:syntastic_python_checkers=['flake8', 'pylama']

" Add support for persistent undo
if has("persistent_undo")
    set undodir = "~/.undodir/"
    set undofile
endif

" Keys
let mapleader=","
nnoremap <Leader>w :w<CR>
" Use <F10> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F10>
" nerdtree
nnoremap <F2> :NERDTreeToggle<CR>
" numbers
nnoremap <F3> :NumbersToggle<CR>
" Tags support
nnoremap <F4> :TagbarToggle<CR>
nnoremap <F5> :Gstatus<CR>
" more convenient buffer switching
nnoremap bn :bnext<CR>
nnoremap bp :bprevious<CR>

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
    \     'h:Heading_L1',
    \     'i:Heading_L2',
    \     'k:Heading_L3'
    \ ]
\ }
