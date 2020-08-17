let mapleader = ","

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" originial repos on github
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" {{{
" :GV = open git history
" :GV! = open git history for this file only
" 'o' = show diff
" }}}
" Plnug 'kien/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'majutsushi/tagbar'
" {{{
  " map <leader>t :TagbarToggle<CR>
" }}}
Plug 'Yggdroot/indentLine'
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
Plug 'scrooloose/nerdtree'
" {{{
  map <leader>d :NERDTreeToggle<CR>
  map <leader>e :NERDTreeFind<CR>
  let NERDTreeShowBookmarks=1
  let NERDTreeChDirMode=0
  let NERDTreeQuitOnOpen=0
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }}}
Plug 'scrooloose/nerdcommenter'
" {{{
  let NERDSpaceDelims=1
" }}}
Plug 'luochen1990/rainbow'
" {{{
  let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
" }}}
Plug 'NLKNguyen/papercolor-theme'
Plug 'dense-analysis/ale'
" {{{
  let g:ale_sign_column_always = 1
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
  let g:ale_python_flake8_args="--max-line-length=128"
  " Write this in your vimrc file
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_fix_on_save = 0                   " run on save
  let g:ale_lint_on_save  = 0                 " 2 options allow to lint only when file is saved
  let g:ale_completion_enabled = 0            " do not mix up stuff with deoplete
  let g:ale_sign_error = '✖'                  " error sign
  let g:ale_sign_warning = '⚠'                " warning sign
  let g:ale_fixers = ['trim_whitespace', 'remove_trailing_lines']
  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  " let g:ale_fixers = {
  " \   'javascript': ['prettier'],
  " \   'css': ['prettier'],
  " \}
  " let g:ale_fix_on_save = 1
  " let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es6'
" }}}
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
Plug 'psf/black', { 'tag': '19.10b0' }
" {{{
  " autocmd BufWritePre *.py execute ':Black'
" }}}
Plug 'vimwiki/vimwiki'
" {{{
  let g:vimwiki_list = [{'path': '~/Dropbox/public/vimwiki'}]
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
nmap <silent> gi <Plug>(coc-implementation)
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
Plug 'junegunn/gv.vim'
Plug 'nanotech/jellybeans.vim'
" {{{
  let g:jellybeans_use_term_background_color = 0
" }}}
Plug 'itchyny/lightline.vim'
" {{{
  let g:lightline = {
        \ 'colorscheme': 'nord',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'fugitive', 'gitgutter', 'filename' ] ],
        \   'right': [ [ 'percent', 'lineinfo' ],
        \              [ 'syntastic' ],
        \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'fugitive': 'LightLineFugitive',
        \   'gitgutter': 'LightLineGitGutter',
        \   'readonly': 'LightLineReadonly',
        \   'modified': 'LightLineModified',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'filename': 'LightLineFilename'
        \ },
        \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
        \ 'subseparator': { 'left': '>', 'right': '' }
        \ }
  function! LightLineModified()
    if &filetype == "help"
      return ""
    elseif &modified
      return "+"
    elseif &modifiable
      return ""
    else
      return ""
    endif
  endfunction

  function! LightLineReadonly()
    if &filetype == "help"
      return ""
    elseif &readonly
      return "RO"
    else
      return ""
    endif
  endfunction

  function! LightLineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
  endfunction

  function! LightLineGitGutter()
    if ! exists('*GitGutterGetHunkSummary')
          \ || ! get(g:, 'gitgutter_enabled', 0)
          \ || winwidth('.') <= 90
      return ''
    endif
    let symbols = [
          \ g:gitgutter_sign_added,
          \ g:gitgutter_sign_modified,
          \ g:gitgutter_sign_removed
          \ ]
    let hunks = GitGutterGetHunkSummary()
    let ret = []
    for i in [0, 1, 2]
      if hunks[i] > 0
        call add(ret, symbols[i] . hunks[i])
      endif
    endfor
    return join(ret, ' ')
  endfunction

  function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
  endfunction

  " {{{ Modified jellybeans theme
  let s:base03    = [ '#151513', 233 ]
  let s:base02    = [ '#30302c', 236 ]
  let s:base01    = [ '#4e4e43', 237 ]
  let s:base00    = [ '#666656', 242 ]
  let s:base0     = [ '#808070', 244 ]
  let s:base1     = [ '#949484', 246 ]
  let s:base2     = [ '#a8a897', 248 ]
  let s:base3     = [ '#e8e8d3', 253 ]
  let s:yellow    = [ '#ffb964', 215 ]
  let s:red       = [ '#cf6a4c', 167 ]
  let s:magenta   = [ '#f0a0c0', 217 ]
  let s:blue      = [ '#7697D6', 4   ]
  let s:orange    = [ '#ffb964', 215 ]
  let s:green     = [ '#99ad6a', 107 ]
  let s:white     = [ '#FCFCFC', 15  ]

  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'terminal': {}}
  let s:p.normal.left     = [ [ s:white, s:blue ], [ s:base3, s:base02 ] ]
  let s:p.normal.right    = [ [ s:base02, s:base1 ], [ s:base3, s:base02 ] ]
  let s:p.inactive.right  = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
  let s:p.inactive.left   = [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
  let s:p.insert.left     = [ [ s:base02, s:orange ], [ s:base3, s:base01 ] ]
  let s:p.replace.left    = [ [ s:base02, s:red ], [ s:base3, s:base01 ] ]
  let s:p.visual.left     = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
  let s:p.terminal.left   = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
  let s:p.normal.middle   = [ [ s:base0, s:base03 ] ]
  let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]
  let s:p.tabline.left    = [ [ s:base3, s:base02 ] ]
  let s:p.tabline.tabsel  = [ [ s:white, s:blue ] ]
  let s:p.tabline.middle  = [ [ s:base01, s:base03 ] ]
  let s:p.tabline.right   = [ [ s:base03, s:base03 ], [ s:base03, s:base03 ] ]
  let s:p.normal.error    = [ [ s:red, s:base02 ] ]
  let s:p.normal.warning  = [ [ s:yellow, s:base01 ] ]
  " }}}
" }}}

Plug 'junegunn/limelight.vim'
" {{{
  let g:limelight_default_coefficient = 0.7
  let g:limelight_conceal_ctermfg = 238
  let g:limelight_conceal_guifg = '#bbbbbb'
  nmap <silent> gl :Limelight!!<CR>
  xmap gl <Plug>(Limelight)
" }}}
" Plug 'SirVer/ultisnips'
" {{{
  nnoremap <leader>se :UltiSnipsEdit<CR>

  " let g:UltiSnipsSnippetsDir = '~/.nvim/UltiSnips'
  " let g:UltiSnipsEditSplit = 'horizontal'
  " let g:UltiSnipsListSnippets = '<nop>'
  " let g:UltiSnipsExpandTrigger = '<c-l>'
  " let g:UltiSnipsJumpForwardTrigger = '<c-l>'
  " let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
  " let g:ulti_expand_or_jump_res = 0
" }}}
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <leader>f :GFiles<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
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
Plug 'Valloric/MatchTagAlways'
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
Plug 'airblade/vim-gitgutter'
" {{{
  let g:gitgutter_map_keys = 0
  let g:gitgutter_max_signs = 200
  let g:gitgutter_realtime = 1
  let g:gitgutter_eager = 1
  let g:gitgutter_sign_removed = '–'
  let g:gitgutter_diff_args = '--ignore-space-at-eol'
  nmap <silent> ]h :GitGutterNextHunk<CR>
  nmap <silent> [h :GitGutterPrevHunk<CR>
  nnoremap <silent> <leader>gu :GitGutterRevertHunk<CR>
  nnoremap <silent> <leader>gp :GitGutterPreviewHunk<CR><c-w>j
  nnoremap cog :GitGutterToggle<CR>
  nnoremap <leader>gt :GitGutterAll<CR>
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

Plug 'tyru/open-browser.vim'
" {{{
  let g:netrw_nogx = 1
  vmap gx <Plug>(openbrowser-smart-search)
" }}}

Plug 'sirtaj/vim-papyrus'

Plug 'bignimbus/you-are-here.vim'
" {{{
nnoremap <silent> <leader>here :call you_are_here#Toggle()<CR>
" }}}

Plug 'arcticicestudio/nord-vim'
Plug 'psliwka/vim-smoothie'
Plug 'rhysd/committia.vim'
Plug 'ap/vim-css-color'
Plug 'liuchengxu/vista.vim'
" {{{
let g:vista_default_executive = 'coc'
map <leader>t :Vista!!<CR>
" }}}
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
" {{{
let g:lens#disabled_filetypes = ['nerdtree', 'fzf']
let g:lens#disabled_buftypes= ['nofile']
" }}}
Plug 'brooth/far.vim'
" {{{
" Farr = interactive find and replace
" 't' = toggle line
" 's' = do the substitution
" }}}
Plug 'danilamihailov/beacon.nvim'



Plug 'ryanoasis/vim-devicons'
" {{{
set encoding=UTF-8
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Hack\ Nerd\ Font:h11
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
" }}}


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
set key=
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
nnoremap <leader>p :call CopyCurrentFilePath()<CR>
function! CopyCurrentFilePath() " {{{
  let @" = expand('%')
  echo @"
endfunction

nnoremap <leader>cd :cd %:p:h<CR>

" Remove trailing whitespaces in current buffer
nnoremap <leader><BS>s :1,$s/[ ]*$//<CR>:nohlsearch<CR>1G

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
" colorscheme PaperColor
" colorscheme gruvbox
colorscheme nord
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
