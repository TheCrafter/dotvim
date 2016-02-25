let g:ycm_global_ycm_extra_conf = "~/.vim/conf/.ycm_extra_conf.py"
let g:ycm_extra_conf_vim_data = ['&filetype']                     " Default: []

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0