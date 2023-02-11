"d""Plug
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'

"dev

"themes staff
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'frazrepo/vim-rainbow'
Plug 'arcticicestudio/nord-vim'
"Utils
Plug 'thaerkh/vim-indentguides'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'liuchengxu/vim-which-key'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
"git
Plug 'tpope/vim-fugitive'

"PopUp window (Suggestions)
Plug 'vim-scripts/AutoComplPop'
call plug#end()

"""end Plug


"core setting by azizul Islam
syntax on
set ruler
set number
"set exrc   "Alternative of vimrc
set nobackup
set noswapfile
set incsearch
set ttyfast
set scrolloff=5
set incsearch "Do incremental searching
set splitbelow "window Decoretion buffer Horizontal open in blew
set splitright  "window Decoretion
set shortmess+=c
set nowrap
set relativenumber
set mouse=a
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set foldcolumn=1
"set pumheight = 10 "Makes Popup menu smaller
set signcolumn=no "Side space for git status someting like that
set updatetime=300
set colorcolumn=99999
set smartindent
set expandtab smarttab
set formatoptions=tcqrn1
"set emo
set wildmode=longest,list,full
set completeopt+=menuone,longest
"Utils
set dictionary+=/usr/share/dict/words
set complete+=k/usr/share/dict/words
set dict= "dictionary
set sps=best
set icon
set clipboard=unnamedplus
"set ph=0 "pumheight
"set pw=15 "pumwidth
"set ofu= "omnifunc
"set sm "showmatch
let g:netrw_winsize=25 "netrw window size in lines  

set undodir=/tmp
set directory=/tmp//,.

"Styling
highlight Comment cterm=italic
highlight CursorLine ctermbg=Black cterm=NONE
highlight CursorLineNr ctermbg=Black cterm=bold ctermbg=green
highlight LineNr ctermbg=Black ctermfg=White

"themes staff
"--------------------------------------------------------------





colorscheme onedark

"Random staff
"----------------------------------------------------------------
let g:mucomplete#enable_auto_at_startup = 1
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:mapleader = "\<Space>"
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:fzf_preview_window = ['right:45%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []
nmap <leader>f :FZF<CR>




" vim-prettier
let g:prettier#quickfix_enabled = 1
let g:prettier#quickfix_auto_focus = 1
run prettier on save
let g:prettier#autoformat = 1
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"

"rainbow
"let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
 
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>a <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>a <Plug>(EasyAlign)
let g:rust_clip_command = 'xclip -selection clipboard'

"indentguides
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indentguides_ignorelist = ['text']


"emmet
"let g:user_emmet_leader_key=','
"filetype plugin on

"KeyBinding By Azizul7m
"-----------------------------------------------------------------"
let mapleader = " "
inoremap jk <ESC>
nmap <Leader>e :Lexplore<CR>




"Tab to selete suggestions


"Navigate TAB
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprev<CR>
nmap <leader>n :tabnew<CR>
nmap <leader>wv :vsplit<cr>
nmap <leader>wh :split<cr>
nmap <leader>wq :wq<cr>
nmap <leader>wx :q<cr>



"resize buffer window with arrow
nnoremap <silent> <C-Up> :resize +2<CR>
nnoremap <silent> <C-down> :resize -2<CR>
nnoremap <silent> <C-left> :vertical resize +2<CR>
nnoremap <silent> <C-right> :vertical resize -2<CR>


"Batter window Navigation
nnoremap <C-h> <C-\><C-N><C-w>h
nnoremap <C-j> <C-\><C-N><C-w>j
nnoremap <C-k> <C-\><C-N><C-w>k
nnoremap <C-l> <C-\><C-N><C-w>l

" Automatically fix the last misspelled word and jump back to where you were.
"   Taken from this talk: https://www.youtube.com/watch?v=lwD8G1P52Sk
nnoremap <leader>sp :normal! mz[s1z=`z<CR>


" Move 1 more lines up or down in normal and visual selection modes.

nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv
nnoremap <C-Up> :m .-2<CR>==
nnoremap <C-Down> :m .+1<CR>==
vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv


"completation

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
""""Setting
