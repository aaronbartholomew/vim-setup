let mapleader = ","

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" originial repos on github
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" {{{
" :GV = open git history
" :GV! = open git history for this file only
" 'o' = show diff
" }}}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ntpeters/vim-better-whitespace'
Plug 'MattesGroeger/vim-bookmarks'
" {{{
  nmap <leader>bt <Plug>BookmarkToggle
  nmap <leader>bs <Plug>BookmarkShowAll
  nmap <leader>bj <Plug>BookmarkNext
  nmap <leader>kk <Plug>BookmarkPrev
" }}}
Plug 'gregsexton/matchtag'
Plug 'dyng/ctrlsf.vim'
" {{{
  nmap <leader>s <Plug>CtrlSFPrompt -I<space>
  nmap <leader>* <Plug>CtrlSFCwordPath<CR>
  let g:ctrlsf_position = 'right'
" }}}
Plug 'Lokaltog/vim-easymotion'
" {{{
" s{char}{char} to move to {char}{char}
map <leader><leader>l <Plug>(easymotion-bd-jk)
nmap <leader><leader>L <Plug>(easymotion-overwin-line)
map  <leader><leader>w <Plug>(easymotion-bd-w)
nmap <leader><leader>W <Plug>(easymotion-overwin-w)
" }}}
Plug 'luochen1990/rainbow'
" {{{
  let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
" }}}
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'master',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
" {{{
  let g:prettier#exec_cmd_async = 1
  let g:prettier#autoformat = 0
  let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
" }}}
" Plug 'psf/black', { 'tag': '19.10b0' }
" {{{
  " autocmd BufWritePre *.py execute ':Black'
" }}}
Plug 'google/vim-jsonnet'
" {{{
  augroup libsonnet_ft
    au!
    autocmd BufNewFile,BufRead *.libsonnet set syntax=jsonnet
  augroup END
" }}}
Plug 'mbbill/undotree'
" {{{
  nmap <leader>u :UndotreeToggle<CR>
" }}}
Plug 'neoclide/coc.nvim', {'branch': 'release',  'do': { -> ':CocInstall coc-tsserver' } }
" {{{
"""""PLUGIN CONF
" COC
let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-snippets']
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> <leader>< <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>> <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
" nnoremap <silent> D :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" END - COC
" }}}
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
" {{{
  let g:jellybeans_use_term_background_color = 0
" }}}

Plug 'junegunn/gv.vim'
Plug 'junegunn/limelight.vim'
" {{{
  let g:limelight_default_coefficient = 0.7
  let g:limelight_conceal_ctermfg = 238
  let g:limelight_conceal_guifg = '#bbbbbb'
  nmap <silent> gl :Limelight!!<CR>
  xmap gl <Plug>(Limelight)
" }}}
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  " nnoremap <silent> <leader>f :GFiles<CR>
  " nmap <silent> <leader>f :Ag<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>o :Files<CR>
  nnoremap <silent> <leader>T :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
  nnoremap <silent> <leader>. :AgIn

  nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>FT :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
  endfunction
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
" }}}
Plug 'junegunn/vim-easy-align'
" {{{
  let g:easy_align_ignore_comment = 0 " align comments
  vnoremap <silent> <Enter> :EasyAlign<cr>
" }}}
Plug 'AndrewRadev/splitjoin.vim'
" {{{
  nmap <leader>ss :SplitjoinSplit<cr>
  nmap <leader>sj :SplitjoinJoin<cr>
" }}}
Plug 'Shougo/context_filetype.vim'
Plug 'othree/html5.vim'
Plug 'mxw/vim-jsx'
Plug 'ekalinin/Dockerfile.vim'


Plug 'tpope/vim-fugitive'
" {{{
  " Fix broken syntax highlight in gitcommit files
  " (https://github.com/tpope/vim-git/issues/12)
  let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'

  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>ge :Gedit<CR>
  nnoremap <silent> <leader>gE :Gedit<space>
  nnoremap <silent> <leader>gr :Gread<CR>
  nnoremap <silent> <leader>gR :Gread<space>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>gW :Gwrite!<CR>
  nnoremap <silent> <leader>gq :Gwq<CR>
  nnoremap <silent> <leader>gQ :Gwq!<CR>

  function! ReviewLastCommit()
    if exists('b:git_dir')
      Gtabedit HEAD^{}
      nnoremap <buffer> <silent> q :<C-U>bdelete<CR>
    else
      echo 'No git a git repository:' expand('%:p')
    endif
  endfunction
  nnoremap <silent> <leader>g` :call ReviewLastCommit()<CR>

  augroup fugitiveSettings
    autocmd!
    autocmd FileType gitcommit setlocal nolist
    autocmd BufReadPost fugitive://* setlocal bufhidden=delete
  augroup END
" }}}
Plug 'airblade/vim-rooter'

Plug 'ludovicchabant/vim-gutentags'
" {{{
  let g:gutentags_ctags_exclude = [
      \ '*.min.js',
      \ '*html*',
      \ 'jquery*.js',
      \ '*/vendor/*',
      \ '*/node_modules/*',
      \ '*/python2.7/*',
      \ '*/migrate/*.rb'
      \ ]
  let g:gutentags_generate_on_missing = 0
  let g:gutentags_generate_on_write = 0
  let g:gutentags_generate_on_new = 0
  nnoremap <leader>t! :GutentagsUpdate!<CR>
" }}}

Plug 'janko-m/vim-test'
" {{{
  function! TerminalSplitStrategy(cmd) abort
    tabnew | call termopen(a:cmd) | startinsert
  endfunction
  let g:test#custom_strategies = get(g:, 'test#custom_strategies', {})
  let g:test#custom_strategies.terminal_split = function('TerminalSplitStrategy')
  let test#strategy = 'terminal_split'

  nnoremap <silent> <leader>rr :TestFile<CR>
  nnoremap <silent> <leader>rf :TestNearest<CR>
  nnoremap <silent> <leader>rs :TestSuite<CR>
  nnoremap <silent> <leader>ra :TestLast<CR>
  nnoremap <silent> <leader>ro :TestVisit<CR>
" }}}

Plug 'sirtaj/vim-papyrus'
Plug 'bignimbus/you-are-here.vim'
" {{{
nnoremap <silent> <leader>here :call you_are_here#Toggle()<CR>
" }}}

" Plug 'arcticicestudio/nord-vim'
Plug 'psliwka/vim-smoothie'
Plug 'rhysd/committia.vim'
Plug 'ap/vim-css-color'
Plug 'liuchengxu/vista.vim'
" {{{
let g:vista_default_executive = 'coc'
map <leader>t :Vista!!<CR>
" }}}
Plug 'danilamihailov/beacon.nvim'
Plug 'tpope/vim-repeat'
Plug 'bergercookie/vim-debugstring'
" {{{
let g:debugstringAlwaysIncludeHeader = 'false'
nmap <leader>x <Plug>DumpDebugStringVar
nmap <leader>X <Plug>DumpDebugStringExpr
" }}}


" Plug 'ryanoasis/vim-devicons'
" {{{
" set encoding=UTF-8
" if has("gui_running")
  " if has("gui_gtk2")
    " set guifont=Inconsolata\ 12
  " elseif has("gui_macvim")
    " set guifont=Hack\ Nerd\ Font:h11
  " elseif has("gui_win32")
    " set guifont=Consolas:h11:cANSI
  " endif
" endif
" }}}

Plug 'aaronbartholomew/img-paste.vim'
" {{{
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" }}}

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" {{{
let g:mkdp_refresh_slow = 1
nmap <Leader>mp :MarkdownPreview<CR>
" }}}
Plug 'renerocksai/calendar-vim'

Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'RRethy/nvim-treesitter-textsubjects'
" Plug 'ThePrimeagen/refactoring.nvim',
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'renerocksai/telekasten.nvim'
" {{{
" }}}
Plug 'aaronbartholomew/inka.nvim'

Plug 'stevearc/oil.nvim'
Plug 'jiangmiao/auto-pairs'
" Plug 'folke/flash.nvim'

call plug#end()


" General settings
" ================================================================================
filetype plugin indent on

" Tabstops
set expandtab
set tabstop=2
set shiftwidth=2
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
set wildmenu
" set textwidth=80
set textwidth=1000
set diffopt+=iwhite
set fillchars=""
set showfulltag
set hlsearch
set incsearch
set autoread
set synmaxcol=2048

"""""FUNCTIONALITY
set nocp
set noerrorbells
set history=1000
set number
set guioptions=em
set showtabline=2

if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
  set clipboard+=unnamed
else
  set clipboard=unnamedplus "Linux
  set clipboard+=unnamedplus
endif
set termguicolors

"clear highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

"cd to dir contatining file in buffer
nmap <silent> <leader>cd :lcd %:h<CR>
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

"set text wrapping toggles
" nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR>

"Search curr file for curr in search reg
nmap <silent> <leader>gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

"Window Shifting
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Copy current file path to clipboard
" nnoremap <leader>p :call CopyCurrentFilePath()<CR>
" function! CopyCurrentFilePath() " {{{
  " let @" = expand('%')
  " echo @"
" endfunction

nnoremap <leader>cd :cd %:p:h<CR>

" Remove trailing whitespaces in current buffer
nnoremap <leader><BS>s :1,$s/[ ]*$//<CR>:nohlsearch<CR>1G

"keep code folding
" au BufWinLeave ?* mkview
" au BufWinEnter ?* silent loadview

"save file
nnoremap <leader>w :w<CR>

nnoremap j gj
nnoremap k gk

"GUI
syntax enable
" colorscheme spacegray
set background=dark
" colorscheme PaperColor
colorscheme gruvbox
" colorscheme nord
if $COLORTERM == 'gnome-terminal'
		  set t_Co=256
endif
let g:airline_theme = 'tender'

silent !mkdir $HOME/.vim/swap > /dev/null 2>&1
set directory=$HOME/.vim/swap

nnoremap <silent> <leader>gz :call Flt_term_win('lazygit',0.9,0.6,'Todo')<CR>
function! Flt_term_win(cmd, width, height, border_highlight) abort
    let width = float2nr(&columns * a:width)
    let height = float2nr(&lines * a:height)
    let bufnr = term_start(a:cmd, {'hidden': 1, 'term_finish': 'close'})

    let winid = popup_create(bufnr, {
            \ 'minwidth': width,
            \ 'maxwidth': width,
            \ 'minheight': height,
            \ 'maxheight': height,
            \ 'border': [],
            \ 'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
            \ 'borderhighlight': [a:border_highlight],
            \ 'padding': [0,1,0,1],
            \ 'highlight': a:border_highlight
            \ })

    " Optionally set the 'Normal' color for the terminal buffer
    " call setwinvar(winid, '&wincolor', 'Special')

    return winid
endfunction
