" define by charlie ! ! !
" my nvim file

" ====== little tricks ======
" <C-o> goto origin position
" <C-i> go back to writing position 


" ================== set part ===================

"let mapleader = "\<space>"
let mapleader = ","

set nocompatible
filetype plugin on
syntax on
set number
set relativenumber
set wildmenu
set cursorline
set tabstop=4
set expandtab
" set spell
set autoindent
set shiftwidth=4
set showmatch
set scrolloff=10
set clipboard+=unnamed
set encoding=utf-8
" set neovim language to be english
let $LANG='en'
set langmenu=en
" default current working directory
" cd C:\Users\hhhhh\Desktop
" enable mouse rolling
" set mouse=a
" set updatetime
set updatetime=1000
set noshowmode


" ====================== markdown part ==============================

" <++> place holder
"map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd FileType markdown inoremap ,h <++>
autocmd FileType markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd FileType markdown inoremap ,n ---<Enter><Enter>
autocmd FileType markdown inoremap ,b ****<++><Esc>F*hi
autocmd FileType markdown inoremap ,s ~~~~<++><Esc>F~hi
autocmd FileType markdown inoremap ,i **<++><Esc>F*i
autocmd FileType markdown inoremap ,d ``<++><Esc>F`i
autocmd FileType markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd FileType markdown inoremap ,= ====<++><Esc>F=hi
autocmd FileType markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap ,l --------<Enter>
autocmd FileType markdown inoremap ,t #### 
autocmd FileType markdown inoremap ,m $$$$ <++><Esc>F$hi


" markdown preview
"let g:mkdp_auto_start = 0
"let g:mkdp_auto_close = 1
"let g:mkdp_refresh_slow = 0
"let g:mkdp_command_for_global = 0
"let g:mkdp_open_to_the_world = 0
"let g:mkdp_open_ip = ''
"let g:mkdp_browser = 'chromium'
"let g:mkdp_echo_preview_url = 0
"let g:mkdp_browserfunc = ''
"let g:mkdp_preview_options = {
    "\ 'mkit': {},
    "\ 'katex': {},
    "\ 'uml': {}, \ 'maid': {},
    "\ 'disable_sync_scroll': 0,
    "\ 'sync_scroll_type': 'middle',
    "\ 'hide_yaml_meta': 1,
    "\ 'sequence_diagrams': {},
    "\ 'flowchart_diagrams': {},
    "\ 'content_editable': v:false
    "\ }
"let g:mkdp_markdown_css = ''
"let g:mkdp_highlight_css = ''
"let g:mkdp_port = ''
"let g:mkdp_page_title = '「${name}」'


" === auto run python scripts by F5 === 

map <F5> :call CompileRun()<CR>
func! CompileRun()
	exec "w"
	if &filetype == 'python'
		exec "!time python %"
	endif
endfunc


" ========================= vim-plug part ============================

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'JuliaEditorSupport/julia-vim', {'for':['julia','vim-plug']}
" using 'julia_charlie' to not start this plug cause julia'sLanguageServer.jl is full of fucking bug !
Plug 'autozimu/LanguageClient-neovim', {'branch':'next','do':'powershell -executionpolicy bypass -File install.ps1', 'for':['julia_charlie','vim-plug']}
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
" Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install_sync() }, 'for':['markdown','vim-plug']}
Plug 'airblade/vim-gitgutter'

call plug#end()


" === global setting ===

"airline-theme"
"let g:airline_theme='simple'
"let g:airline_theme='molokai'
"let g:airline_powerline_fonts = 1


" vim wiki "
" let g:vimwiki_list = [{'path': 'D:\PhD\courses\vimwiki\', 'path_html': 'D:\PhD\courses\vimwiki'}]

" NerdTree
nmap tt :NERDTreeToggle

"MarkdownPreview
nmap mp :MarkdownPreview
nmap mps :MarkdownPreviewStop
"
"" ================== coc settings ======================
"

" use TAB to completion
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" global coc extensions which would be installed automatically
let g:coc_global_extensions = ["coc-python","coc-vimlsp","coc-json"]


