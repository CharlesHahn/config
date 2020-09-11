" define by charlie ! ! !

set number
set relativenumber
set wildmenu
set cursorline
set tabstop=4
set expandtab
set autoindent


map <F5> :call CompileRun()<CR>
func! CompileRun()
	exec "w"
	if &filetype == 'python'
		exec "!time python %"
	endif
endfunc