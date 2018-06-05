" set nocompatible
" set nomodeline
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vunde manage Vundle
Plugin 'gmarik/Vundle.vim'

" originial repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'sheerun/vim-polyglot'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'html-improved-indentation'
Plugin 'godlygeek/tabular'
Plugin 'gregsexton/matchtag'
Plugin 'dyng/ctrlsf.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-surround'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'isruslan/vim-es6'
Plugin 'justinj/vim-react-snippets'

call vundle#end()

let s:python_version=3
let g:jedi#force_py_version=3

filetype plugin indent on
let mapleader = ","

" Tabstops
set expandtab
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

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
map <leader>st :SyntasticToggleMode<CR>
map <leader>sc :SyntasticCheck<CR>
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_pylint_post_args="--max-line-length=120"
let g:syntastic_python_flake8_args='--ignore=E501,E225'
let g:syntastic_debug=0
let g:ycm_goto_buffer_command = 'vertical-split'

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

" nnoremap <leaderc>* :Grepper -tool ag -cword -noprompt<cr>

vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

nmap <Leader>bt <Plug>BookmarkToggle
nmap <Leader>bs <Plug>BookmarkShowAll
nmap <Leader>bj <Plug>BookmarkNext
nmap <Leader>kk <Plug>BookmarkPrev

nmap <Leader>mz :VimroomToggle<CR>
let g:vimroom_width = 180

nmap <Leader>u :UndotreeToggle<CR>
" nnoremap <Leader>a :Ags<Space>

" ctrlSF
nmap     <Leader>f <Plug>CtrlSFPrompt -I<space>
nmap     <Leader>* <Plug>CtrlSFCwordPath<CR>
let g:ctrlsf_position = 'right'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" disable autocomplete by default
" let b:deoplete_disable_auto_complete=1
" let g:deoplete_disable_auto_complete=1
" call deoplete#custom#buffer_option('auto_complete', v:false)

" if !exists('g:deoplete#omni#input_patterns')
    " let g:deoplete#omni#input_patterns = {}
" endif

" Disable the candidates in Comment/String syntaxes.
" call deoplete#custom#source('_',
            " \ 'disabled_syntaxes', ['Comment', 'String'])

" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" set sources
" let g:deoplete#sources = {}
" let g:deoplete#sources.cpp = ['LanguageClient']
" let g:deoplete#sources.python = ['LanguageClient']
" let g:deoplete#sources.python3 = ['LanguageClient']
" let g:deoplete#sources.rust = ['LanguageClient']
" let g:deoplete#sources.c = ['LanguageClient']
" let g:deoplete#sources.vim = ['vim']

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

let g:ale_sign_column_always = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_python_flake8_args="--max-line-length=128"
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
