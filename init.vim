set nocompatible
filetype off
set backspace=indent,eol,start
set nu
set showcmd
set spell
syntax on
set nowrap
set laststatus=2
set  ruler
set showmatch
colorscheme solarized8

set mouse=a

set encoding=utf-8

filetype indent on

set hlsearch

set incsearch
set ignorecase

set tabstop=4
set shiftwidth=4
set autoindent
set softtabstop=4

set autowrite
set ignorecase

nmap<Leader>p "+p
vmap <C-c> "+y

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'https://github.com/tpope/vim-fugitive.git'
" A Vim plugin which shows a git diff in the sign column
Plugin 'airblade/vim-gitgutter'


call vundle#end()            " required
filetype plugin indent on

nnoremap <F2> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_add_preview_to_completeopt="popup"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'
let g:ycm_autoclose_preview_window_after_insertion = 1
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

let g:NERDTreeGitStatusShowIgnored= 1

let g:NERDTreeGitStatusIndicatorMapCustom= {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusConcealBrackets = 1

let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" Switch to the previous tab with Ctrl+h
nnoremap <C-h> :tabprevious<CR>

" Close the current tab with Ctrl+c
nnoremap <C-c> :tabclose<CR>

function! TabNextOrCreate()
    " If the current tab is the last tab
    if tabpagenr() == tabpagenr('$')
        " Open a new tab in the current directory
        tabnew .
    else
        " Switch to the next tab
        tabnext
    endif
endfunction

" Map Ctrl+l to the function
nnoremap <C-l> :call TabNextOrCreate()<CR>
" 快速垂直分屏当前文件
nnoremap <Leader>v :vsp<CR>

" 快速水平分屏当前文件
nnoremap <Leader>s :sp<CR>

