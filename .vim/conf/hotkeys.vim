" Open a line up and down at the same time
nnoremap oO o<Esc>O

" Open two lines down at the same time
nnoremap oo o<Esc>o

" Open two lines up at the same time
nnoremap OO O<Esc>O

" Edit vimrc file
if has('win32') || has('win64')
    nnoremap <F12> :edit ~/dotvim/.vimrc <CR>
else
    nnoremap <F12> :edit ~/.vimrc <CR>
endif

" Remap the Escape key
inoremap jk <Esc>

" Map keys for YouCompleteMe
nnoremap inc :YcmCompleter GoToInclude <CR>
nnoremap dec :YcmCompleter GoToDeclaration <CR>
nnoremap def :YcmCompleter GoToDefintion <CR>
