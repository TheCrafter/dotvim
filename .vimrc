" Use Vim settings
if &compatible
    set nocompatible
endif

" Wombo combo for windows
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

"------------------------------------------------------------
"                      General Settings
"------------------------------------------------------------
set showcmd                         " Show incomplete cmds down the bottom
set showmode                        " Show current mode down the bottom
set number                          " Show line numbers
set backspace=indent,eol,start      " Allow backspace in insert mode
syntax on                           " Turn on syntax highlighting

set hlsearch                        " Highlight search terms
set incsearch                       " Show search matches as you type

" Unix line endings
set fileformats=unix,dos

" Tab settings
set shiftwidth=4
set softtabstop=4
set expandtab

" Set theme
"let g:molokai_original = 1 
colorscheme molokai

" Set swapfile and backup location
set swapfile
if has("win32") || has("win16")
    set dir=$TMP    
else
    set dir=~/tmp
endif

"------------------------------------------------------------
"                        Gui options
"------------------------------------------------------------
if has("gui_running")
    set guioptions-=m         "remove menu bar
    set guioptions-=T         "remove toolbar
    set guioptions-=r         "remove right-hand scroll bar
    set guioptions-=L         "remove left-hand scroll bar

    " Font
    set guifont=Consolas:h10:cANSI

    " Start in fullscren in windows
    if has('win32') || has('win64')
        au GUIEnter * simalt ~x
    endif
endif

"------------------------------------------------------------
"                          Plugins
"------------------------------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"--
" Non Lazy
"--
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'SirVer/ultisnips'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    }
\ }

"--
" Lazy
"--
NeoBundleLazy 'scrooloose/nerdtree', {
\ 'autoload' : {
\     'commands': 'NERDTree'
\    } 
\ }

NeoBundleLazy 'Valloric/YouCompleteMe', {
\ 'augroup': 'youcompletemeStart',
\ 'filetypes': ['c', 'cpp', 'cs', 'haskell', 'lua', 'java', 'rust'],
\ 'build': {
\     'windows': 'install.py --clang-completer',
\     'unix': './install.py --clang-completer',
\     'mac': './install.py --clang-completer'
\    }
\ }

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"--
" Configs
"--
set runtimepath+=$HOME/.vim/conf/plugins
for file in split(globpath('~/.vim/conf/plugins', '*.vim'), '\n')
    exe 'source' file
endfor 

"------------------------------------------------------------
"                          Hotkeys
"------------------------------------------------------------
set runtimepath+=$HOME/.vim/conf
source ~/.vim/conf/hotkeys.vim