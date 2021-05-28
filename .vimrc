" Meet vimrc, now living life in the cloud 

"""

" General

"""

" use filetype specific configs at /usr/share/vim/vim80/ftplugin/
filetype plugin indent on

" Lines of history to remember
set history=500

" syntax highlighting
syntax enable

" disable annoying beeps
set noerrorbells
set visualbell
set t_vb=
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" lower key combination timeout
set timeoutlen=500

set encoding=utf8
set fileformats=unix,dos,mac


"""

" Usage

"""

" autocomplete vim commands with <tab>
set wildmenu
set wildignore=*.o,*~,*.pyc

" seamlessly switch between files in vim when unsaved
set hidden

" fix backspace
set backspace=eol,start,indent

" lines around cursor
set scrolloff=10

" matching bracket/parens
set showmatch
set matchtime=2

" automatically go to next/previous line when using these keys
set whichwrap+=<,>,h,l


"""

" Text

"""

" spaces, not tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" visual break on 500 characters
set linebreak
set textwidth=500

" auto indentation based on code syntax
set autoindent
set smartindent
set wrap


"""

" Mapping

"""

let mapleader = "'"

" Fast saving
nmap <leader>w :w!<cr>


"""

" Status bar

"""

" status bar always present
set laststatus=2

" the x,y position shown in bottom right
set ruler

" height of command bar
set cmdheight=1


"""

" Magic

"""

" set cursor to last edited positon when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" remove trailing spaces from certain filetypes
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""

" Search

"""

" ignore case when searching except for a few cases
set ignorecase
set smartcase

" highlight search
set hlsearch

" incrementally seach and find results
set incsearch


"""

" Hidden files

"""

if empty(glob('/tmp/vim'))
    silent !mkdir -p /tmp/vim
endif
set backupdir=/tmp/vim//
set directory=/tmp/vim//
set undodir=/tmp/vim//
