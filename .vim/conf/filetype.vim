" JSON
autocmd BufNewFile,BufReadPost *.mat set filetype=json
autocmd BufNewFile,BufReadPost *.mod set filetype=json
autocmd BufNewFile,BufReadPost *.scn set filetype=json

" Make .h files C filetype by default
augroup filetype_h
    autocmd!
    autocmd BufRead,BufNewFile *.h set filetype=c
augroup END

