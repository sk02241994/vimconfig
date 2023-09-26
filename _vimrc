call plug#begin()
  Plug 'sickill/vim-monokai'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/nerdtree',
  Plug 'skywind3000/asyncrun.vim'
  Plug 'udalov/kotlin-vim'
call plug#end()

let mapleader=" "

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
colorscheme monokai
set number
set relativenumber
set colorcolumn=120
set is hlsearch
set nobackup
set noswapfile
set list listchars+=space:.

nnoremap <C-l> <c-w>l
nnoremap <C-k> <c-w>k
nnoremap <C-j> <c-w>j
nnoremap <C-h> <c-w>h

nnoremap <leader>ff <cmd>FZF<cr>
nnoremap <C-n> <cmd>NERDTreeToggle<cr>

nnoremap <tab> <cmd>tabnext<cr>
nnoremap <S-tab> <cmd>tabprevious<cr>
nnoremap <C-t> <cmd>tabnew<cr>
nnoremap <C-w> <cmd>close<cr>
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

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <silent> <F2> :call ToggleQuickFix()<cr>
nnoremap <silent> <leader>fg <cmd>grep -S "\b<cword>\b"<cr><F2>
nnoremap <leader>fb <cmd>buffers<cr>:buffer<space>
