" set nocompatible
" set nomodeline
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vunde manage Vundle
Plugin 'gmarik/Vundle.vim'

" originial repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'shougo/neocomplete.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'ervandew/supertab'
Plugin 'ajh17/Spacegray.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'sheerun/vim-polyglot'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'habamax/vim-skipit'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'MattesGroeger/vim-bookmarks'
" Plugin 'scrooloose/syntastic'
" Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --omnisharp-completer' }
" Plugin 'dyng/ctrlsf.vim'
" Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
" Plugin 'Raimondi/delimitMate'
" Plugin 'shime/vim-livedown', { 'do' : 'npm install -g livedownstall -g livedownn' }
" Plugin 'tommcdo/vim-lion'
" Plugin 'unblevable/quick-scope'
" Plugin 'mhinz/vim-grepper'
" Plugin 'kburdett/vim-nuuid'

" Plugin 'tpope/vim-sleuth'
" Plugin 'terryma/vim-expand-region'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'https://bitbucket.org/goeb/vimya.git'
" Plugin 'w0ng/vim-hybrid'
" Plugin 'neilagabriel/vim-geeknote'
" Plugin 'gabesoft/vim-ags'
" Plugin 'vim-scripts/Conque-GDB', {'on': 'ConqueGDB'}
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
" Plugin 'c.vim', {'for': 'c'}
" Plugin 'justinmk/vim-syntax-extra', {'for': 'c'} " bison, flex, c syntax (operators, delimiters, functions..)
" Plugin 'hdima/python-syntax', {'for': 'python'} " neccesary, vim default python syntax has a regex bug as of 7.4.663
" Plugin 'godlygeek/tabular'

call vundle#end()

filetype plugin indent on
let mapleader = ","

" Tabstops
set tabstop=2
set shiftwidth=4
set softtabstop=2
set autoindent
set wrapscan
set noignorecase
set ch=2
set backspace=2
set laststatus=2
set lazyredraw
set showcmd
set mousehide
set history=700
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set scrolloff=8
set virtualedit=all
"disable encryption
set key=
set wildmenu
" set textwidth=80
set textwidth=1000
set diffopt+=iwhite
set fillchars=""
set showfulltag
set hlsearch
set incsearch
set clipboard+=unnamed
set autoread
set synmaxcol=2048

"""""FUNCTIONALITY
set nocp
set noerrorbells
set history=1000
set number
set guioptions=em
set showtabline=2

"clear highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

"cd to dir contatining file in buffer
nmap <silent> <leader>cd :lcd %:h<CR>
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

"set text wrapping toggles
nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR>

"Search curr file for curr in search reg
nmap <silent> <leader>gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

"Window Shifting
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

"keep code folding
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

"save file
nnoremap <leader>w :w<CR>

nnoremap j gj
nnoremap k gk

"GUI
syntax enable
" colorscheme spacegray
set background=dark
colorscheme PaperColor
if $COLORTERM == 'gnome-terminal'
		  set t_Co=256
endif

silent !mkdir $HOME/.vim/swap > /dev/null 2>&1
set directory=$HOME/.vim/swap

"""""PLUGIN CONF
"nerdcommenter
let NERDSpaceDelims=1

"vimya
" let g:vimyaShowLog = 1
" let g:vimyaTailCommand = 'Tail'
" nnoremap <leader>mo :py vimyaOpenLog ()<cr>
" vnoremap <leader>mr :py vimyaRefreshLog ()<cr>

"NERDTree
map <leader>d :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Tagbar
map <leader>t :TagbarToggle<CR>

" Airline
let g:airline_powerline_fonts = 1 " automatically populate the g:airline_symbols dictionary with the powerline symbols
set laststatus=2 " always show statusline
set noshowmode " hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:airline#extensions#tabline#enabled = 1	" automatically displays all buffers when there's only one tab open
"let g:airline#extensions#tabline#left_sep = ' ' " straight separators
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_idx_mode = 1	" display numbers in the tab line, and use mappings <leader>1 to <leader>9

"YCM
let g:ycm_key_detailed_diagnostics= '<leader>D'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_register_as_syntastic_checker = 1
" nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ctrlSF
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>s <Plug>CtrlSFCwordPath<CR>
nmap     <leader>s <Plug>CtrlSFCwordPath<CR>
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
let g:ctrlsf_position = 'right'

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" map <leader>st :SyntasticToggleMode<CR>
" map <leader>sc :SyntasticCheck<CR>
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_pylint_post_args="--max-line-length=120"
" let g:syntastic_python_flake8_args='--ignore=E501,E225'
" let g:syntastic_debug=0
" let g:ycm_goto_buffer_command = 'vertical-split'

" indent guides
" let g:indent_guides_enable_on_vim_startup = 0
map <leader>ig :IndentLinesToggle<CR>

" rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

nnoremap <leader>g :Grepper -tool git<cr>
nnoremap <leader>G :Grepper -tool ag<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0

nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>

vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

set expandtab
nmap <Leader>bt <Plug>BookmarkToggle
nmap <Leader>bs <Plug>BookmarkShowAll
nmap <Leader>bj <Plug>BookmarkNext
nmap <Leader>kk <Plug>BookmarkPrev
