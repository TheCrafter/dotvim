" Use Vim settings
if &compatible
    set nocompatible
endif

"------------------------------------------------------------
"                       Plugin Manager
"------------------------------------------------------------
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

let has_vimplug = expand($HOME.'/.vim/autoload/plug.vim')
if !filereadable(has_vimplug)
    let vimplug_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    if executable('wget')
        call mkdir(fnamemodify($HOME.'/.vim/autoload/plug.vim', ':h'), 'p')
        exec '!wget --force-directories --no-check-certificate -O '.$HOME.'/.vim/autoload/plug.vim'.' '.vimplug_url
    elseif executable('curl')
        exec '!curl -fLo '.$HOME.'/.vim/autoload/plug.vim'.' --create-dirs '.vimplug_url
    else
        echom 'Could not download plugin manager. No plugins were installed'
        finish
    endif
endif

"------------------------------------------------------------
"                      General Settings
"------------------------------------------------------------
let maplocalleader=","

set nowrap                          " Don't wrap lines
set autoread                        " Reload files changed outside vim
set backspace=indent,eol,start      " Allow backspace in insert mode
set showcmd                         " Show incomplete cmds down the bottom
set showmode                        " Show current mode down the bottom
set number                          " Show line numbers
set hlsearch                        " Highlight search terms
set incsearch                       " Show search matches as you type

" Turn on syntax highlighting
syntax on

" No sounds
set noerrorbells
set visualbell
set t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Enable Filetype detection
filetype plugin indent on

" Enable useful autocomplete for commands
set wildmenu
set wildmode=list:longest,list:full

" Remove preview window from autocompletion
set completeopt-=preview

" Turn off swap and backup files
set noswapfile
set nobackup
set nowb

" Indentation
set autoindent    " Copy indent from current line when starting a new line
set smartindent   " Do smart autoindenting when starting a new line
set smarttab      " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'
set shiftwidth=4  " Number of spaces to use for each step of (auto)indent
set softtabstop=4 " Number of spaces that a <Tab> counts for while performing editing operations
set tabstop=4     " Number of spaces that a <Tab> in the file counts for
set expandtab     " Spaces instead of tabs

" Auto-close the auto completion preview buffer when auto completion is over
" Source -> http://stackoverflow.com/a/3107159/3671272
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave  * if pumvisible() == 0|pclose|endif

"------------------------------------------------------------
"                      Colors & Fonts
"------------------------------------------------------------
" Set encoding to UTF-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Unix line endings
set fileformats=unix,dos

" Windows Font
if has('win32') || has('win64')
    set guifont=Consolas:h10:cANSI
elseif has('gui_gtk2')
    set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
endif

" Set color theme
colorscheme molokai

" Enable DirectX rendering on Windows
if has('win32') || has('win64')
    set rop=type:directx,geom:1,taamode:1
endif

"------------------------------------------------------------
"                        Gui options
"------------------------------------------------------------
if has("gui_running")
    set guioptions-=m         "remove menu bar
    set guioptions-=T         "remove toolbar
    set guioptions-=r         "remove right-hand scroll bar
    set guioptions-=L         "remove left-hand scroll bar

    " Start in fullscren in windows
    if has('win32') || has('win64')
        au GUIEnter * simalt ~x
    endif
endif

"------------------------------------------------------------
"                          Plugins
"------------------------------------------------------------
" Start plugin handling
call plug#begin('~/.vim/bundle')

" A tree explorer
Plug 'scrooloose/nerdtree'
" Snippet plugin
Plug 'SirVer/ultisnips'
" Intensely orgasmic commenting
Plug 'tpope/vim-commentary'
" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" Complete engine and Language Server Support
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" End plugin handling
call plug#end()

"------------------------------------------------------------
"                        Configs
"------------------------------------------------------------
" Remove the Windows ^M when the encodings gets f****d up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

set runtimepath+=$HOME/.vim/conf/plugins
for file in split(globpath('~/.vim/conf/plugins', '*.vim'), '\n')
    exe 'source' file
endfor

set runtimepath+=$HOME/.vim/conf
for file in split(globpath('~/.vim/conf', '*.vim'), '\n')
    exe 'source' file
endfor

