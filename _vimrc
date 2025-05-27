syntax off
let mapleader=" "
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
set t_Co=256
set t_ut=
set background=dark
colorscheme habamax
set number
" set relativenumber
" set colorcolumn=120
set is hlsearch
set nobackup
set nowritebackup
set noswapfile
set listchars+=space:.,tab:>>
set list
set smarttab
set smartindent
set autoindent
set laststatus=2
set nowrap
set statusline=%m\ %F%<\ %=[bufno:\ %n]:%y[%l:%c\ of\ %L\ %p%%]
set fileencoding=utf-8
set path+=**
highlight NORMAL guibg=NONE ctermbg=NONE

let g:netrw_winsize=20

nnoremap <C-l> <c-w>l
nnoremap <C-k> <c-w>k
nnoremap <C-j> <c-w>j
nnoremap <C-h> <c-w>h

nnoremap <tab> <cmd>bNext<cr>
nnoremap <S-tab> <cmd>bprevious<cr>
nnoremap <leader>bd <cmd>bd<cr>
nnoremap <leader><C-n> <cmd>tabnew<cr>
nnoremap <leader>vs <cmd>vsplit<cr>
nnoremap <leader>ss <cmd>split<cr>
nnoremap <leader>fb :buffers<cr>:buffer 
nnoremap <leader>fm :marks<cr>:normal '
nnoremap <leader>e :Lex<CR>
nnoremap <F4> <cmd>cn<cr>
nnoremap <F5> <cmd>cp<cr>
nnoremap <leader>v :registers<cr>:normal "p<left>

set ignorecase
" set cursorcolumn
" set cursorline
set grepprg=rg\ -sw\ --vimgrep\ $*
set grepformat^=%f:%l:%c:%m
nnoremap <leader>E <cmd>Vexplore<cr>
nnoremap <leader>fw :grep 

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <silent> <F2> :call ToggleQuickFix()<cr>
nnoremap <silent> <leader>fg <cmd>grep -s -w "\b<cword>\b"<cr>:cwindow<cr>
nnoremap <C-s> <cmd>w<cr>

" set runtimepath+=~/vimrc/
" set runtimepath+=~/vimrc/fzf
" set runtimepath+=~/vimrc/fzf.vim
" set runtimepath+=~/vimrc/vim-gradle

" nnoremap <leader>ff <CMD>FZF<cr>
" nnoremap <leader>fb <cmd>Buffers<cr>
" nnoremap <leader>rg <CMD>Rg<cr>
" nnoremap <leader>m <CMD>Marks<CR>

set shell=powershell
" set shellcmdflag=-NoLogo -ExecutionPolicy RemoteSigned -Command
" set shellquote=
" set shellxquote=
" set shellpipe=| Out-File -Encoding UTF8 %s; exit $LastExitCode
" set shellredir=| Out-File -Encoding UTF8 %s; exit $LastExitCode
