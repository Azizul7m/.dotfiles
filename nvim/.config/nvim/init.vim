""Plug
call plug#begin('~/.vim/pluggedNvim/')

    if has ("nvim") 
        Plug 'nvim-lua/plenary.nvim'
        Plug 'lewis6991/gitsigns.nvim'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'romgrk/barbar.nvim'
        Plug 'kyazdani42/nvim-web-devicons'
        Plug 'hrsh7th/nvim-compe'
        Plug 'prettier/vim-prettier', { 'do': 'npm install' }
        Plug 'mattn/emmet-vim'
        Plug 'ap/vim-css-color'
        Plug 'Xuyuanp/yanil'


        Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
        "lang
        Plug 'rust-lang/rust.vim'
        Plug 'mrdotb/vim-tailwindcss'
        Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
        "lavravel
        Plug 'tpope/vim-dispatch'             "| Optional
        Plug 'tpope/vim-projectionist'        "|
        Plug 'noahfrederick/vim-composer'     "|
        Plug 'noahfrederick/vim-laravel'
        endif
    "themes staff
    Plug 'https://github.com/vim-airline/vim-airline' " Status bar
    Plug 'navarasu/onedark.nvim'
    "Utils
    Plug 'arcticicestudio/nord-vim'
    Plug 'thaerkh/vim-indentguides'
    Plug 'jiangmiao/auto-pairs'
    Plug 'mcchrish/nnn.vim'
    Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
    Plug 'scrooloose/nerdtree'
    Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
    Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
    Plug 'iamcco/markdown-preview.nvim'


    "Dashboard
    Plug 'glepnir/dashboard-nvim'
    Plug 'liuchengxu/vim-clap'

    "Plug 'wfxr/minimap.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'liuchengxu/vim-which-key'
    Plug 'sheerun/vim-polyglot'

    "git
    Plug 'tpope/vim-fugitive'
    Plug 'jreybert/vimagit'

    "PopUp window (Suggestions)
    Plug 'vim-scripts/AutoComplPop'

call plug#end()



"themes staff
"--------------------------------------------------------------
colorscheme nord
let g:onedark_style = 'warm'
"colorscheme onedark


"Random staff
"----------------------------------------------------------------
let g:mucomplete#enable_auto_at_startup = 1
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:mapleader = "\<Space>"
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"



" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>



" vim-prettier
let g:prettier#quickfix_enabled = 1
let g:prettier#quickfix_auto_focus = 1
run prettier on save
let g:prettier#autoformat = 1
let g:prettier#exec_cmd_async = 1
nmap <Leader>py <Plug>(Prettier)
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"rainbow
let g:rainbow_active = 1
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


"indentguides
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indentguides_ignorelist = ['text']


"emmet
let g:user_emmet_leader_key=','
filetype plugin on

" Set the completefunc you can do this per file basis or with a mapping
set completefunc=tailwind#complete
" The mapping I use
nnoremap <leader>tt :set completefunc=tailwind#complete<cr>
" Add this autocmd to your vimrc to close the preview window after the completion is done
autocmd CompleteDone * pclose

"nnn
let g:nnn#set_default_mappings = 0

"Coc
let g:coc_global_extensions = ['coc-json', 'coc-git']



"Dashboard

"markdown
let g:mkdp_browser = 'firefox'

let g:mkdp_auto_start = 1
let g:mkdp_open_ip = '127.0.0.1:8080'

"devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1





"NERDTree
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusConcealBrackets = 1



"
"Clap
let g:clap_layout = { 'relative': 'editor' }


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"KeyBinding By Azizul7m
"-----------------------------------------------------------------"
let mapleader = " "
inoremap jk <ESC>
nmap <leader>nt :NERDTree<CR>
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

"markdown
nmap <leader>mp <Plug>MarkdownPreview
nmap <leader>ms <Plug>MarkdownPreviewStop
nmap <leader>mt <Plug>MarkdownPreviewToggle

nmap <leader>pi :PlugInstall<cr>
nmap <leader>pc :PlugClean<cr>
nmap <leader>ps :PlugStatus<cr>

"Dashboard
nmap <leader>ss :<C-u>SessionSave<CR>
nmap <leader>sl :<C-u>SessionLoad<CR>

"Nnn
" Start n³ in the current file's directory
nnoremap <leader>nn :NnnPicker<CR>

"Tab to selete suggestions

"Tagbar
nmap <leader>tg :TagbarToggle<CR>

"Navigate TAB
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprev<CR>
nmap <leader>wn :tabnew<CR>
nmap <leader>wv :vsplit<cr>
nmap <leader>wh :split<cr>
nmap <leader>wQ :wq<cr>
nmap <leader>wq :q<cr>



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

"nnoremap <C-k> :m .-2<CR>==
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-Up> :m .-2<CR>==
"nnoremap <C-Down> :m .+1<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv


"completation
"____________________________________________________________________

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"




"autocmd

"NERDTree 
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1






"
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
""""Setting


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
set complete+=kspell
set wildmode=longest,list,full
set wildmenu
set emo



"Utils
set dictionary+=/usr/share/dict/words
set complete+=k/usr/share/dict/words
set dict= "dictionary
set sps=best
set icon
"set clipboard=unnamed
set ph=0 "pumheight
set pw=15 "pumwidth
set ofu= "omnifunc
set sm "showmatch

set undodir=/tmp
set directory=/tmp//,.
