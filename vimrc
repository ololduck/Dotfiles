set nocompatible

filetype off " required for vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-markdown'
Plugin 'mhinz/vim-signify'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'msanders/snipmate.vim'

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
set showcmd    " Show (partial) command in status line.

set showmatch   " Show matching brackets.
set number      " Show line numbers
set ignorecase  " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
"set autowrite  " Automatically save before commands like :next and :make
set hidden     " Hide buffers when they are abandoned
"set mouse=a    " Enable mouse usage (all modes)
set tabstop=4   " 1 tab = 4 spaces
set shiftwidth=4 " Same here
set expandtab   " Automagically expand tabs to space
set smartindent " Enable smart indentation
set autoindent  " Enable automatic indentation
set wildmenu    " Better command-line completion TODO: Check if really better
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
set ruler
" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue"
set cmdheight=2

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Change background to red when writing a line with length > 80 chars
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


" vim-airline
set laststatus=2                            " To understand this, :h laststatus
let g:airline#extensions#tabline#enabled = 1 " Enable the upper tabline
let g:airline_powerline_fonts = 1 "Uncomment if you don't have a powerline font

" integrate bufferline to airline
let g:bufferline_echo = 0
autocmd VimEnter * let &statusline='%{bufferline#refresh_status()}' .bufferline#get_status_string()

" Configure the used VCS
let g:signify_vcs_list = [ 'git', 'hg' ]

" Theme
"colorscheme solarized
colorscheme slate

" Syntastic config
let g:syntastic_python_checkers=['flake8', 'pylama']

" Add support for persistent undo
if has("persistent_undo")
    set undodir = "~/.undodir/"
    set undofile
endif

" Keys
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
" nerdtree
nnoremap <F2> :NERDTreeToggle<CR>
" numbers
nnoremap <F3> :NumbersToggle<CR>
" Undo Tree
nnoremap <F4> :UndotreeToggle<CR>
" fugitive status (add/rm)
nnoremap <F5> :Gstatus<CR>
" Tags support
nnoremap <F8> :TagbarToggle<CR>
" more convenient buffer switching
nnoremap bn :bnext<CR>
nnoremap bp :bprevious<CR>

let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
            \ ]
            \ }
