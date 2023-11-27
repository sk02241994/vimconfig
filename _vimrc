call plug#begin()
  Plug 'tomasiser/vim-code-dark'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/nerdtree',
  Plug 'skywind3000/asyncrun.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'liuchengxu/eleline.vim'
call plug#end()

let mapleader=" "

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
set t_Co=256
set t_ut=
colorscheme codedark
set number
set relativenumber
set colorcolumn=120
set is hlsearch
set nobackup
set nowritebackup
set noswapfile

nnoremap <C-l> <c-w>l
nnoremap <C-k> <c-w>k
nnoremap <C-j> <c-w>j
nnoremap <C-h> <c-w>h

nnoremap <leader>ff <cmd>FZF<cr>
nnoremap <C-n> <cmd>NERDTreeToggle<cr>

nnoremap <tab> <cmd>tabnext<cr>
nnoremap <S-tab> <cmd>tabprevious<cr>
nnoremap <C-n> <cmd>tabnew<cr>
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
nnoremap <leader>fb <cmd>buffers<cr>:buffer<space>

set laststatus=2

" lsp config
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[d` and `]d` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ca <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> to scroll float windows/popups
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
