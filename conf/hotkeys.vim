" Open a line up and down at the same time
nnoremap oO o<Esc>O

" Edit vimrc file
nnoremap <F12> :edit ~/.vim/.vimrc <CR>

" Remap the Escape key
inoremap jk <Esc>

" Map keys for YouCompleteMe
nnoremap inc :YcmCompleter GoToInclude <CR>
nnoremap dec :YcmCompleter GoToDeclaration <CR>
nnoremap def :YcmCompleter GoToDefintion <CR>
