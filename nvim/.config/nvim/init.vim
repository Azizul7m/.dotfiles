""Plug
call plug#begin('~/.vim/pluggedNvim/')

    if has ("nvim") 
        Plug 'nvim-lua/plenary.nvim'
        Plug 'lewis6991/gitsigns.nvim'
        Plug 'nvim-telescope/telescope.nvim'
        Plug 'romgrk/barbar.nvim'
        Plug 'https://github.com/preservim/tagbar.git' "Tagbar all function set form there;
        Plug 'hrsh7th/nvim-compe'
        Plug 'mattn/emmet-vim'
        Plug 'ap/vim-css-color'
        Plug 'Xuyuanp/yanil'
        Plug 'tpope/vim-commentary'
        Plug 'https://tpope.io/vim/surround.git' " Tag Changing
        "snippets
        Plug 'SirVer/ultisnips'
        Plug 'https://github.com/honza/vim-snippets.git' "Snippet file


        Plug 'https://github.com/Valloric/MatchTagAlways.git' " Matching Tag
        "Browser Sync
        Plug 'tamago324/vim-browsersync'
        Plug 'tyru/open-browser.vim'
        Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm install --frozen-lockfile'}
        "lang
        Plug 'mrdotb/vim-tailwindcss'


        "wordpress
        Plug 'https://github.com/shawncplus/phpcomplete.vim.git' " PHP
        Plug 'dsawardekar/wordpress.vim'

        "lavravel
        Plug 'noahfrederick/vim-composer'     "|
        Plug 'noahfrederick/vim-laravel'
        Plug 'https://github.com/github/copilot.vim.git' " github copilot
        endif
    "themes staff
    Plug 'navarasu/onedark.nvim'
    "Utils
    Plug 'https://github.com/kien/ctrlp.vim.git' " CtrlP like vscode search
    Plug 'terryma/vim-multiple-cursors'
    Plug 'arcticicestudio/nord-vim'
    Plug 'thaerkh/vim-indentguides'
    Plug 'jiangmiao/auto-pairs'

    "explorer
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    " Plug 'preservim/nerdtree'
    " Plug 'vwxyutarooo/nerdtree-devicons-syntax'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'https://github.com/vifm/vifm.vim.git' " Vifm filemanager


    "Dashboard
    Plug 'glepnir/dashboard-nvim'
    Plug 'liuchengxu/vim-clap'
    Plug 'tpope/vim-fugitive'
    Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation

    "Plug 'wfxr/minimap.vim'
    Plug 'liuchengxu/vim-which-key'
    Plug 'sheerun/vim-polyglot'

    "git
    Plug 'jreybert/vimagit'
    " post install (yarn install | npm install) then load plugin only for editing supported files
    Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install --frozen-lockfile --production',
      \ 'for': ['javascript', 'php' ,'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()



"themes staff
"--------------------------------------------------------------
colorscheme onedark
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


autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()


"Commtentary
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>



nnoremap <space>v :TabVifm<CR>



" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"Mutli Cursor
let g:multi_cursor_use_default_mapping=0

" Default mapping
" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_select_all_word_key = '<A-n>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
" let g:multi_cursor_next_key            = '<C-n>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'




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
" nnoremap <leader>tt :set completefunc=tailwind#complete<cr>
" Add this autocmd to your vimrc to close the preview window after the completion is done
" autocmd CompleteDone * pclose


"Coc

command! -nargs=0 Tailwind :CocCommand tailwind.formatFile
command! -nargs=0 TailwindAsync :CocCommand tailwind.formatFileAsync
command! -nargs=0 TailwindPreview :CocCommand tailwind.previewFile
command! -nargs=0 TailwindPreviewAsync :CocCommand tailwind.previewFileAsync
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-phpls',
    \ 'coc-python',
    \ 'coc-yaml',
    \ 'coc-pairs',
    \ 'coc-snippets',
    \ 'coc-diagnostic'
    \]




autocmd ColorScheme *
  \ hi CocExplorerNormalFloatBorder guifg=#414347 guibg=#272B34
  \ | hi CocExplorerNormalFloat guibg=#272B34
  \ | hi CocExplorerSelectUI guibg=blue


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

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

"NERDTree
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusConcealBrackets = 1


"
"Clap
let g:clap_layout = { 'relative': 'editor' }


"Prettier
nmap <Leader>py <Plug>(Prettier)

" vim-prettier
let g:prettier#quickfix_enabled = 1
let g:prettier#quickfix_auto_focus = 1
run prettier on save
autocmd BufWritePre  *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html,*.php PrettierAsync



let g:phpcomplete_mappings = {
  \ 'jump_to_def': ',g',
  \ 'jump_to_def_tabnew': ',t',
  \ }




"Neoformat
" let g:neoformat_php_phpcbf = {
"       \ 'exe': 'phpcbf',
"       \ 'args': [
"       \ '--standard=WordPress',
"       \ ],
"       \ 'stdin': 1,
"       \ 'valid_exit_codes': [0,1]
"       \ }
" let g:neoformat_enabled_php = ['phpcbf']
" nnoremap <leader>ns :Neoformat<cr>

" UltiSnips
let g:UltiSnipsEditSplit="vertical"


"BrowserSync
nmap <leader>bs :BrowserSyncStart<CR>
nmap <leader>bo :BrowserSyncOpen<CR>
nmap <leader>bu :BrowserSyncOpenUI<CR>
nmap <leader>bq :BrowserSyncStop<CR>
nmap <leader>br :BrowserSyncReload<CR>



"KeyBinding By Azizul7m
"-----------------------------------------------------------------"
let mapleader = " "
inoremap jk <ESC>
" nmap <leader>nt :NERDTree<CR>
nmap <leader>e :CocCommand explorer<CR>
" nmap <leader>e :NERDTreeToggle<CR>
" nmap <leader>nf :NERDTreeFind<CR>

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
set tabstop=4
set shiftwidth=2
set foldcolumn=1
" set pumheight = 10 "Makes Popup menu smaller
set signcolumn=no "Side space for git status someting like that
set updatetime=300
set colorcolumn=99999
set smartindent
set expandtab smarttab
set formatoptions=tcqrn1
set complete+=kspell
set complete-=nofold
set mps+=<:> "Matching pairs
" set wildmode=longest,list,full
" set emo



"Utils
set dictionary+=/usr/share/dict/words
set complete+=k/usr/share/dict/words
set dict= "dictionary
set sps=best
set icon
set clipboard=unnamed
set ph=0 "pumheight
set pw=15 "pumwidth
set ofu= "omnifunc
set sm "showmatch

set undodir=/tmp
set directory=/tmp//,.
