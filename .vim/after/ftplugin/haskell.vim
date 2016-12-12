" Register NecoGHC completion
setlocal omnifunc=necoghc#omnifunc

" Hotkeys
nnoremap <silent> tw :GhcModTypeInsert<CR>
nnoremap <silent> ts :GhcModSplitFunCase<CR>
nnoremap <silent> tq :GhcModType<CR>
nnoremap <silent> te :GhcModTypeClear<CR>

" Tab settings
set shiftwidth=2
set softtabstop=2
