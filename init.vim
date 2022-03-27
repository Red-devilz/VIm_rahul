" ==== Vim-plug settings {{{
set nocompatible              
filetype off                 

call plug#begin('~/.config/nvim/plugged')

" Language server
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer', { 'branch': 'main' } 

" Autocomplete plugin/sources
Plug 'hrsh7th/nvim-cmp',          { 'branch': 'main' } 
Plug 'hrsh7th/cmp-nvim-lsp',      { 'branch': 'main' } 
Plug 'hrsh7th/cmp-buffer',    
Plug 'uga-rosa/cmp-dictionary',   { 'branch': 'main' } 
Plug 'hrsh7th/cmp-path',          { 'branch': 'main' }
Plug 'hrsh7th/cmp-omni',          { 'branch': 'main' }

" Snippets
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets', {'branch': 'main'}

" Git/File Manipulation
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mbbill/undotree'

" Tools
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'Konfekt/FastFold'
Plug 'christoomey/vim-tmux-navigator'

" Writing 
Plug 'rhysd/vim-grammarous', {'for': ['tex','pandoc', 'md']}
Plug 'davidbeckingsale/writegood.vim', {'for': ['tex','pandoc', 'md']}
Plug 'preservim/vim-wordy', {'for': ['tex','pandoc', 'md']}
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim', {'for': ['tex','pandoc', 'md', 'vimwiki']}

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'ferrine/md-img-paste.vim', {'for': ['pandoc', 'md']}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': ['pandoc', 'vimwiki']}
Plug 'vim-pandoc/vim-pandoc', {'for': ['pandoc', 'vimwiki', 'txt', 'md']}

" Tex
Plug 'tmux-plugins/vim-tmux', {'for': ['tmux']}
Plug 'lervag/vimtex', {'tag': 'v1.6', 'for': ['tex']}
Plug 'rahul13ramesh/vim-tex-fold', {'for': ['tex']}
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

" Vim motions
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
Plug 'rhysd/clever-f.vim'
Plug 'nacro90/numb.nvim'

" Python
Plug 'davidhalter/jedi-vim', {'for': ['python']}
Plug 'goerz/jupytext.vim'
Plug 'rahul13ramesh/SimpylFold'

" ### Aesthetics ###
Plug 'jnurmine/Zenburn'
Plug 'rahul13ramesh/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

call plug#end()

filetype plugin indent on
syntax enable

"}}}
" ==== Lua config {{{
lua require('config')
" }}}
" ==== General setting {{{
set completeopt=menu,menuone,noselect
set pumheight=10
set pumwidth=30
set conceallevel=2
set expandtab
set tabstop=4
set shiftwidth=4

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set so=10
set tw=80

let maplocalleader = ","
"}}}
" ==== Jedi {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#popup_on_dot = 0
let g:jedi#max_doc_height=50

" So that vim splits aren't affected
let g:jedi#use_splits_not_buffers = "left" 
" }}}
" ==== SimplyFold : Python {{{
let g:SimpylFold_docstring_preview = 1
" }}}
" ==== Ale settings {{{
" Check Python files with flake8 and pylint.
let g:ale_lint_on_enter = 0
let b:ale_linters = ['flake8']
" let b:ale_linters = ['flake8', 'cpplint', 'mypy']

" Fix Python files with autopep8 and yapf.
" let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_warn_about_trailing_blank_lines=0

let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on = 'never'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '•'
" }}}
" ==== Markdown {{{
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_browser = "surf"

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_browser = 'surf'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown', 'wiki', 'pandoc']

let g:pandoc#syntax#codeblocks#embeds#langs = ["python"]
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#filetypes#pandoc_markdown = 1
let g:pandoc#modules#enabled = ["formatting", "folding", "toc"]
" let g:pandoc#formatting#mode = "A"
 
let g:mdip_imgdir = "images"

augroup pandoc
    autocmd FileType pandoc nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
    autocmd BufWinEnter *.{wiki,md,mkd,mkdn,mdown,mark*} silent setf pandoc
    autocmd FileType markdown,pandoc,vimwiki set foldexpr=NestedMarkdownFolds()
    autocmd FileType markdown,pandoc highlight Conceal ctermbg=NONE
augroup END
"}}}
" ==== Latex {{{
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:tex_conceal="abdgm"
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"

let g:vimtex_syntax_enabled = 1

" let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
			\ 'backend' : 'process',
			\ 'background' : 1,
			\ 'build_dir' : '',
			\ 'callback' : 0,
			\ 'continuous' : 1,
			\ 'executable' : 'latexmk',
			\ 'options' : [
			\   '-pdf',
			\   '-verbose',
			\   '-file-line-error',
			\   '-synctex=1',
			\   '-interaction=nonstopmode',
			\ ],
			\}

let g:vimtex_compiler_progname = 'nvr'
let g:tex_no_error = 1
let g:tex_fold_additional_envs = ['center', 'tikzpicture', 'enumerate', 'itemize', 'frame', 'abstract', 'question', 'solution', 'question', 'python']

augroup texsettings
    au FileType tex highlight Conceal  ctermbg=NONE
augroup END

"}}}
" ==== Vim Wiki {{{

let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_folding='expr'
let g:vimwiki_global_ext= 0 
let g:vimwiki_list = [{'path': '$HOME/Documents/personal/wikiNotes',
			\ 'syntax': 'markdown', 
			\ 'template_ext': '.html'}]

let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_folding='expr'

augroup vimwiki_settings
    au FileType vimwiki set syntax=markdown.pandoc
    au FileType vimwiki set foldtext=Foldtxt()
    au FileType vimwiki set foldmethod=syntax
    au BufNewFile,BufRead *.wiki  set syntax=markdown.pandoc
augroup END

let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,pre,script'
"}}}
" ==== Writing {{{
augroup writing
    autocmd BufWinEnter *.{wiki,md,mkd,mkdn,mdown,mark*} silent setf markdown
    autocmd FileType tex,pandoc,markdown,vimwiki setlocal spell spelllang=en_us
    autocmd FileType tex set tw=0
augroup END
" }}}
" ==== Status Line {{{
set laststatus=2
set noshowmode
let g:lightline = {
			\ 'colorscheme': 'seoul256',
			\ }
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'component': {
    \   'lineinfo': '⭡ %3l:%-2v',
    \ },
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'fugitive': 'LightlineFugitive'
    \ },
    \ 'separator': { 'left': '', 'right': ''},
    \ 'subseparator': { 'left': '', 'right': ''}
    \ }
function! LightlineReadonly()
    return &readonly ? '⭤' : ''
endfunction
function! LightlineFugitive()
    if exists('*FugitiveHead')
        let branch = FugitiveHead()
        return branch !=# '' ? '⭠ '.branch : ''
    endif
    return ''
endfunction

let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste', 'spell'],
    \           [ 'readonly', 'filename', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'filetype' ] ] }
let g:lightline.inactive = {
    \ 'left': [ [ 'filename' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ] ] }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ] }
" }}}
" ==== General Vim settings {{{

" Turn on the WiLd menu
set wildmenu
let &wildcharm = &wildchar
cnoremap <C-j> <DOWN>
set wildignore=*.o,*~,*.pyc

set incsearch
set hlsearch
set nobackup

if has('mouse')
	set mouse=a
endif

let mapleader=","
let colorschemeval=1
set background=dark

" set background colour
if (colorschemeval == 0)
	colorscheme gruvbox
	highlight Search ctermfg=9 ctermbg=8
	highlight ALEErrorSign ctermfg=9 ctermbg=NONE
	highlight ALEWarningSign ctermfg=11 ctermbg=NONE
endif
if (colorschemeval == 1)
	colorscheme zenburn
	highlight DiffAdd ctermbg=0
	highlight DiffDelete ctermbg=0
	highlight DiffChange ctermbg=0
	highlight DiffText ctermbg=0
	highlight Pmenu ctermbg=NONE
	highlight LineNr ctermbg=NONE ctermfg=8
	highlight SignColumn ctermbg=NONE
	highlight CursorLineNr ctermbg=NONE ctermfg=NONE
	highlight Folded ctermbg=NONE ctermfg=8
	highlight Search ctermfg=2 ctermbg=66
	highlight Visual ctermbg=66
	highlight ALEErrorSign ctermfg=1 ctermbg=NONE
	highlight ALEWarningSign ctermfg=3 ctermbg=NONE
endif
if (colorschemeval == 2)
	colorscheme nord
	highlight Pmenu ctermbg=NONE
	highlight CursorLineNr ctermbg=NONE ctermfg=8
	highlight LineNr ctermbg=NONE ctermfg=8
	highlight Folded ctermbg=NONE ctermfg=8
	highlight Search ctermfg=225 ctermbg=6
	highlight Visual ctermbg=65
	highlight ALEErrorSign ctermfg=1 ctermbg=NONE
	highlight ALEWarningSign ctermfg=3 ctermbg=NONE
endif
highlight GitGutterAdd    ctermbg=NONE ctermfg=2
highlight GitGutterDelete ctermbg=NONE ctermfg=1
highlight GitGutterChange ctermbg=NONE ctermfg=3
hi normal guibg=NONE ctermbg=NONE


if has('gui_running')
	set guioptions-=T
	set lines=1000 columns=999
else
	set t_Co=256
endif

" keep 50 lines of command line history
set history=50
set cmdheight=1
set hidden
set ruler
set number
set backspace=indent,eol,start


autocmd FileType help wincmd L
" TODO: What does this line do?
" au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") \| exe "normal! g'\"" | endif


" }}}
" ==== Detect Files {{{
augroup filetypedetect
    au! BufRead,BufNewFile *.tex set filetype=tex
	au! BufRead,BufNewFile *.m,*.oct set filetype=octave
	au! BufRead,BufNewFile *.vimrc set syntax=vim
	au! BufRead,BufNewFile *.zshrc set syntax=zsh
	au! BufRead,BufNewFile *.s set filetype=nasm
	au! BufRead,BufNewFile *.S set filetype=gas
augroup END
" }}}
" ==== Undo {{{
" Put plugins and dictionaries in this dir
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir

if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	call system('mkdir ' . vimDir)
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif
"}}}
" ==== Code folding {{{
set foldmethod=syntax
set foldnestmax=4
set foldlevel=0
set foldlevelstart=0
set foldminlines=1

let r_syntax_folding = 1
let g:vimsyn_folding ='aflmpPrt'

let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

function! Foldtxt()
	let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
	let lines_count = v:foldend - v:foldstart + 1
	let lines_count_text = '[' . printf("%4s", lines_count . s:small_l) . ']'
	let foldtextstart = strpart(s:raquo . repeat(" ", v:foldlevel*2) . line, 0, (60*2)/3)
	let foldtextend = lines_count_text . repeat(" ", 8)
	let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
	return foldtextstart . repeat(s:middot, 60-foldtextlength) . foldtextend . repeat(" ", 1000)
endfunction
set foldtext=Foldtxt()
hi Folded ctermbg=NONE

augroup code_folding
    autocmd FileType vim :set foldmethod=marker
    " Store manual foldJ
    " autocmd BufWinLeave *.* mkview
    " autocmd BufWinEnter *.* silent! loadview
augroup END

" }}}
" ==== Tmux settings {{{
if exists('$TMUX')
	function! TmuxOrSplitSwitch(wincmd, tmuxdir)
		let previous_winnr = winnr()
		silent! execute "wincmd " . a:wincmd
		if previous_winnr == winnr()
			call system("tmux select-pane -" . a:tmuxdir)
			redraw!
		endif
	endfunction

	let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
	let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
	let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

	nnoremap <silent> <M-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
	nnoremap <silent> <M-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
	nnoremap <silent> <M-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
	nnoremap <silent> <M-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
	map <M-h> <C-w>h
	map <M-j> <C-w>j
	map <M-k> <C-w>k
	map <M-l> <C-w>l
endif

let g:tmux_navigator_no_mappings = 1
"}}}
" ==== Telescope settings {{{
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <C-n> <cmd>Telescope file_browser<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"}}}
" ==== Git gutter {{{
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_max_signs = 200  " default value

let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_removed = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_modified_removed = '┃'
set updatetime=1000

" }}}
" ==== Scrolling {{{
"smooth scrolling using Ctrl-D and Ctrl-U
function SmoothScroll(up)
	if a:up
		let scrollaction="\<C-y>"
	else
		let scrollaction="\<C-e>"
	endif
	exec "normal " . scrollaction
	redraw
	let counter=1
	while counter<&scroll
		let counter+=1
		sleep 10m
		redraw
		exec "normal " . scrollaction
	endwhile
endfunction
" }}}
" ==== Mappings in VIM  {{{

inoremap jk <Esc>
noremap <leader>a  ggVG

" Remap vertical selection
noremap <C-b> <C-v>

" Copy, paste
set pastetoggle=<F10>
vnoremap <C-c> "+y
noremap <C-v>  <F10>"+p<F10> 

" Indent entire file
nnoremap <leader>i gg=G

" ALE mappings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

nnoremap <leader>h :nohls<CR>
nnoremap <leader>u :UndotreeToggle<cr>

function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc
nnoremap <C-l> :call NumberToggle()<cr>

" to use Ctrl-Space:map to : C-@
nnoremap <space> za
vnoremap <space> zf

"Ctags newtab and vsplit
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags=./tags;/
set timeout timeoutlen=300

" resize vertical splits with Ctrl-w + l / Ctrl-w + h
nnoremap <c-w>l 5<C-w>>
nnoremap <c-w>h 5<C-w><
nnoremap <c-w>j 5<C-w>+
nnoremap <c-w>k 5<C-w>-

" Scrolling
nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

command -nargs=0 Spell setlocal spell spelllang=en_us
hi SpellBad cterm=underline ctermbg=NONE ctermfg=NONE

nmap <leader>c <Plug>Commentary
vmap <leader>c <Plug>Commentary

"}}}
" ==== Startup Page {{{

let g:startify_bookmarks = [ {'vim': '~/Documents/config/Vim__files/init.vim'},
            \ {'zsh': '~/Documents/config/term_files/shell/dot.zshrc'},
            \ {'tmux': '~/Documents/config/term_files/shell/dot.tmux.conf'},
            \ {'wiki': '~/Documents/personal/wikiNotes/index.wiki'},
            \ {'org': '~/Documents/personal/wikiNotes/org/index.wiki'} ]
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 5
let g:startify_lists = [
			\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'dir',       'header': ['   Files '. getcwd()] },
			\ { 'type': 'sessions',  'header': ['   Sessions']       },
			\ ]

let g:ascii = [
			\'                                       ',
			\'     _   _                 _           ',
			\'    | \ | |               (_)          ',
			\'    |  \| | ___  _____   ___ _ __ ___  ',
			\'    | . ` |/ _ \/ _ \ \ / / |  _   _ \ ',
			\'    | |\  |  __/ (_) \ V /| | | | | | |',
			\'    \_| \_/\___|\___/ \_/ |_|_| |_| |_|',
			\'                                       ',
			\'                                       ',
			\]
let g:startify_custom_header = g:ascii
"}}}
" ==== Grammarous {{{

let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
	nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
	nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
	nmap <buffer><C-f> <Plug>(grammarous-fixit)
	nmap <buffer><C-r> <Plug>(grammarous-remove-error)
	nmap <buffer><C-e> <Plug>(grammarous-open-info-window)
	nmap <buffer><C-o> <Plug>(grammarous-disable-rule)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
	nunmap <buffer><C-n>
	nunmap <buffer><C-p>
	nunmap <buffer><C-f>
	nunmap <buffer><C-r>
	nunmap <buffer><C-e>
	nunmap <buffer><C-o>
endfunction

let g:grammarous#disabled_categories = {
            \ '*' : ['TYPOGRAPHY'],
            \ }
let g:grammarous#disabled_rules = {
            \ '*' : ['DASH_RULE', 'WORD_CONTAINS_UNDERSCORE', 'UNLIKELY_OPENING_PUNCTUATION'],
            \ }

let g:wordy#ring = [
  \ 'weak',
  \ ['being', 'passive-voice', 'weasel'],
  \ 'business-jargon',
  \ 'puffery',
  \ ['problematic', 'redundant', ],
  \ ['colloquial', 'idiomatic', 'similies', ],
  \ 'art-jargon',
  \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
  \ 'adjectives',
  \ 'adverbs',
  \ ]

"}}}
" ==== Goyo {{{
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
" }}}
" ==== Allow for projcet specific configs {{{
set exrc
set secure
" }}}
