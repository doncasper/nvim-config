call plug#begin('~/.local/share/nvim/plugged')

" Main plugins
Plug 'Townk/vim-autoclose'                                            " Autoclose braces
Plug 'vim-airline/vim-airline',                                       " Status line
Plug 'jeetsukumaran/vim-buffergator',                                 " Buffer manager
Plug 'scrooloose/nerdtree',         { 'on':  'NERDTreeToggle' }       " File manager
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }       " NERDTree git icons
Plug 'airblade/vim-rooter'                                            " Changes Vim working directory to project root
Plug 'mbbill/undotree'                                                " Local history
Plug 'airblade/vim-gitgutter',                                        " Git plugin
Plug 'tpope/vim-fugitive',                                            " Git plugin
Plug 'vim-syntastic/syntastic',                                       " Syntax checking
Plug 'ctrlpvim/ctrlp.vim'                                             " Full path fuzzy file, buffer, mru, tag... finder for Vim

" Golang plugins
Plug 'fatih/vim-go',                { 'do': ':GoInstallBinaries' }    " Golang plugin
Plug 'neoclide/coc.nvim',           {'do': 'yarn install --frozen-lockfile'} " LSP
" Plug 'mdempsky/gocode',             { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
" Plug 'jodosha/vim-godebug',                                           " Golang debug plugin
" Plug 'godoctor/godoctor.vim'                                          " Golang refactoring tools
Plug 'Shougo/deoplete.nvim',        { 'do': ':UpdateRemotePlugins' }  " Autocomplete plugin
Plug 'zchee/deoplete-go',           { 'build': {'unix': 'make'} }     " Autocomplete for golang

Plug 'SirVer/ultisnips'                                               " Snipets plugin

" Syntax higlighting
" TODO: Check if it working in LSP.
" Plug 'tpope/vim-markdown',          { 'for': 'markdown' }             " Markdown plugin
Plug 'shime/vim-livedown',          { 'for': 'markdown' }             " Markdown preview plugin
" Plug 'cespare/vim-toml'                                               " TOML plugin
" Plug 'uarun/vim-protobuf'                                             " Protobuf plugin
" Plug 'jparise/vim-graphql'                                            " GraphQL plugin
" Plug 'ekalinin/Dockerfile.vim'                                        " Dockerfile plugin

" Initialize plugin system
call plug#end()

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" DEFAULT SETTINGS
colorscheme casokai             " enable custom color shceme
set termguicolors               " enable gui colors in terminal

syntax enable                   " enable syntax highlighting
set number                      " show line numbers
set autoindent                  " indent when moving to the next line while writing code
set cursorline                  " show a visual line under the cursor's current line
set showmatch                   " show the matching part of the pair for [] {} and ()
set laststatus=2                " show status line
set splitright                  " vertical split - new in right
set autoread                    " auto reload changed files
set mouse=nicr                  " enable mouse interaction
set termencoding=utf-8          " set default encoding
set backspace=indent,eol,start
set lazyredraw

" Working with tabs
set switchbuf=usetab
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>
nnoremap <silent> <C-A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Toggle for spell checking
:map <F5> :setlocal spell! spelllang=en_us<CR>

" PLUGINS SETTINGS


" Let's save undo info!
if !isdirectory($HOME."/.local/share/nvim/undo-dir")
    call mkdir($HOME."/.local/share/nvim/undo-dir", "", 0770)
endif
if !isdirectory($HOME."/.local/share/nvim/undo-dir")
    call mkdir($HOME."/.local/share/nvim/undo-dir", "", 0700)
endif
set undodir=~/.local/share/nvim/undo-dir
set undofile"

" Enable autocomplite
let g:deoplete#enable_at_startup = 1

" NERDTree plugin
nmap <F8> :NERDTreeToggle<CR>

let g:NERDTreeShowHidden=0
let g:NERDTreeShowIgnoredStatus = 1

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" UndoTree plugin
nmap <F9> :UndotreeToggle<CR>

" Markdown preview plugin
let g:livedown_autorun = 0 " should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_open = 1    " should the browser window pop-up upon previewing
let g:livedown_port = 1337 " the port on which Livedown server will run
nmap <F3> :LivedownToggle<CR>

" Syntatic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Markdown plugin
let g:markdown_fenced_languages = ['go', 'html', 'python', 'bash=sh', 'json']
let g:markdown_syntax_conceal = 0

" Markdown preview plugin
let g:livedown_autorun = 0 " should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_open = 1    " should the browser window pop-up upon previewing
let g:livedown_port = 1337 " the port on which Livedown server will run


" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Git plugin
let g:gitgutter_override_sign_column_highlight = 0

" LENGUAGE DEPENDS SETTINGS
" Include config file for Golang
autocmd FileType go source ~/.config/nvim/configs/golang.vim

" Include config file for HTML and CSS
autocmd FileType html,css source ~/.config/nvim/configs/htmlcss.vim

" Include config file for JavaScript
autocmd FileType js source ~/.config/nvim/configs/javascript.vim

" Include config file for JSON
autocmd FileType json source ~/.config/nvim/configs/json.vim

" Include config file for YAML
autocmd FileType yml,yaml source ~/.config/nvim/configs/yaml.vim

" Include config file for TOML
autocmd FileType toml source ~/.config/nvim/configs/toml.vim

" Include config file for PROTO
autocmd FileType proto source ~/.config/nvim/configs/proto.vim

" Enable syntax for conf file
autocmd BufRead,BufNewFile *.conf setf dosini

" MANUAL COMMANDS
" Pretify JSON
com! FormatJSON %!python -m json.tool
