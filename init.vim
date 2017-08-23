call plug#begin('~/.local/share/nvim/plugged')

" On-demand loading
Plug 'vim-airline/vim-airline',                                       " Status line
Plug 'scrooloose/nerdtree',         { 'on':  'NERDTreeToggle' }       " File manager
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }       " NERDTree git icons
Plug 'mbbill/undotree'                                                " Local history
Plug 'fatih/vim-go',                { 'do': ':GoInstallBinaries' }    " Golang plugin
Plug 'jodosha/vim-godebug',                                           " Golang debug plugin
Plug 'godoctor/godoctor.vim'                                          " Some refactoring tools
Plug 'airblade/vim-gitgutter',                                        " Git plugin
Plug 'vim-syntastic/syntastic',                                       " Syntax checking
Plug 'Shougo/deoplete.nvim',        { 'do': ':UpdateRemotePlugins' }  " Autocomplite plugin
Plug 'zchee/deoplete-go',           { 'build': {'unix': 'make'} }     " Autocomplete for golang
Plug 'tpope/vim-markdown',          { 'for': 'markdown' }             " Markdown plugin
Plug 'shime/vim-livedown',          { 'for': 'markdown' }             " Markdown preview plugin
Plug 'SirVer/ultisnips'                                               " Snipets plugin
Plug 'Townk/vim-autoclose'                                            " Autoclose braces

" Initialize plugin system
call plug#end()


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
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <F8> :NERDTreeToggle<CR>

" UndoTree plugin
nmap <F9> :UndotreeToggle<CR>

" Markdown preview plugin
let g:livedown_autorun = 0 " should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_open = 1    " should the browser window pop-up upon previewing
let g:livedown_port = 1337 " the port on which Livedown server will run
nmap <F4> :LivedownToggle<CR>

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
autocmd FileType yml source ~/.config/nvim/configs/yaml.vim

" MANUAL COMMANDS
" Pretify JSON
com! FormatJSON %!python -m json.tool
