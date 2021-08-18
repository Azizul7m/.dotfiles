
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
set emo
"Utils
set dict= "dictionary
set sps=best
set icon
set clipboard=unnamed
set ph=0 "pumheight
set pw=15 "pumwidth
set ofu= "omnifunc
set sm "showmatch
colorscheme pablo 

"Random staff
"----------------------------------------------------------------
setlocal omnifunc=syntaxcomplete#Complete

"KeyBinding By Azizul7m
"-----------------------------------------------------------------"
let mapleader = " "

inoremap kj <ESC>
nmap <Leader>e :Lexplore<CR>

"Navigate TAB
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprev<CR>
nmap <leader>n :tabnew<CR>
nmap <leader>c :tabclose<CR>



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

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
