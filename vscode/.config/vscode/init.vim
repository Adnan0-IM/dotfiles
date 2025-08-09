
" =============================
" VS Code init.vim with LazyVim + custom keymaps
" =============================

" Use space as leader key
let mapleader="<space>"

" =============================
" CUSTOM KEYMAPS
" =============================

" Exit insert mode with jk
inoremap jk <Esc>

" Don't copy character when deleting with x
nnoremap x "_x

" Increment / decrement numbers
nnoremap + <C-a>
nnoremap - <C-x>

" Select all
nnoremap <C-a> gg<S-v>G

" Save / quit
nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>Q :qa<CR>

" NvimTree-like shortcuts (replace with VS Code explorer)
nnoremap <Leader>f :call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>
nnoremap <Leader>t :call VSCodeNotify('workbench.view.explorer')<CR>

" Tabs
nnoremap te :tabedit<Space>
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>
nnoremap tw :tabclose<CR>

" Split window
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>

" Move between splits
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l

" Resize splits
nnoremap <C-S-h> <C-w><
nnoremap <C-S-l> <C-w>>
nnoremap <C-S-k> <C-w>+
nnoremap <C-S-j> <C-w>-

" Toggle VS Code explorer with backslash
nnoremap \ :call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>

" =============================
" LAZYVIM DEFAULT-LIKE KEYMAPS
" =============================
" (Only those that work in VS Code — plugin-specific ones omitted)

" Window navigation with Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
