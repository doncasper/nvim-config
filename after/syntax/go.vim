" go.vim: more Vim syntax file for Go.
"
" Usage: copy it to the ~/.vim/after/syntax/
" 
" Improvment:
"   This file is a supplement for the origin go.vim.  
"   It supports 
"   1. Hightligt NOTE in the comments
"     let OPTION_NAME = 0
" Options:
"   There are some options for customizing the highlighting;
"   
"   You can write:
"     let OPTION_NAME = 0
"   in your ~/.vimrc file to disable particular options. 
"
"   You can also write:
"     let OPTION_NAME = 1
"   to enable particular options. At present, all options default to on.
"
"   - go_highlight_methods
"     Highlights methods.

if !exists("go_highlight_methods")
	let go_highlight_methods = 1
endif

" Comments; their contents
syn keyword     goTodo              contained NOTE
syn keyword     goTodo              contained Todo
hi def link     goTodo              Todo

" Methods; 
if go_highlight_methods != 0
	syn match goMethod 	 /\(\.\)\@<=\w\+\((\)\@=/
endif
hi def link     goMethod         Method
