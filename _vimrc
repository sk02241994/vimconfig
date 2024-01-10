call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/tagbar'
call plug#end()
let mapleader=" "

syntax off
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
set t_Co=256
set t_ut=
colorscheme wildcharm
set number
set relativenumber
set colorcolumn=120
set is hlsearch
set nobackup
set nowritebackup
set noswapfile
set listchars+=space:.,tab:>>
set list

nnoremap <C-l> <c-w>l
nnoremap <C-k> <c-w>k
nnoremap <C-j> <c-w>j
nnoremap <C-h> <c-w>h

let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']

nnoremap <silent> <leader>ff :Files<CR>
nnoremap <leader>gf <CMD>GFiles<CR>
nnoremap <leader>fb <CMD>Buffers<CR>
nnoremap <C-f> :Rg! 

nnoremap <tab> <cmd>bNext<cr>
nnoremap <S-tab> <cmd>bprevious<cr>
nnoremap <leader>bd <cmd>bd<cr>
nnoremap <leader><C-n> <cmd>tabnew<cr>
nnoremap <leader>vs <cmd>vsplit<cr>
nnoremap <leader>ss <cmd>split<cr>

set ignorecase
set nowrap
set cursorcolumn
set cursorline
set grepprg=rg\ --vimgrep\ $*
set grepformat^=%f:%l:%c:%m
nnoremap <F4> <cmd>cn<cr>
nnoremap <F5> <cmd>cp<cr>
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
nnoremap <silent> <leader>fg <cmd>grep -S "\b<cword>\b"<cr><F2>
" nnoremap <leader>fb <cmd>buffers<cr>:buffer<space>
nnoremap <leader>ds <cmd>Tagbar<cr>

au BufWritePost * :silent make | redraw!
au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow
