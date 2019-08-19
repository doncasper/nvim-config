" Set tab size
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Vim-go plugin settings

" Fix issue with `GoRename`
" let $GOROOT = "/usr/local/Cellar/go/1.x/libexec"

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_term_enabled = 1
let g:go_list_type = "quickfix"
let g:go_addtags_transform = "snakecase"

let g:go_info_mode="gocode"
let g:go_auto_type_info = 1
let g:go_updatetime = 200
let g:go_auto_sameids = 1

" Vim-go plugin key maping
nmap <leader>r <Plug>(go-run)
nmap <leader>b <Plug>(go-build)
nmap <leader>t <Plug>(go-test)
nmap <leader>c <Plug>(go-coverage)
nmap <Leader>e <Plug>(go-rename)
nmap gl :GoReferrers<CR>

" Syntastic linters
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']
