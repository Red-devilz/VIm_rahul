" ==== Vim-plug settings {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.config/nvim/plugged') " alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" ### Autocomplete ###
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
Plug 'Shougo/neoinclude.vim'

" Snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets', {'frozen': 1}

"Automatic syntax checking
Plug 'w0rp/ale'

" ### File Manipulation ###
" plugin for Git, line changes
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" File manager
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Vim Devicons
Plug 'ryanoasis/vim-devicons'

"Fuzzy file finding
Plug 'ctrlpvim/ctrlp.vim'

" ## Tools. ###
" Tmux Syntax, Navigation
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

" Nerd_commenter
Plug 'scrooloose/nerdcommenter'

"Grammar
Plug 'rhysd/vim-grammarous'

" Ctags
Plug 'majutsushi/tagbar'


"Vim-wiki
Plug 'vimwiki/vimwiki'

" Slime
" Plug 'jpalardy/vim-slime'

" ### Language Specific Plugins ####
" Python 
Plug 'rahul13ramesh/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'tell-k/vim-autopep8'
" Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'

" Cpp/C
Plug 'Shougo/deoplete-clangx'

"Java Completion
" Plug 'artur-shaik/vim-javacomplete2'
" Plug 'vim-scripts/javacomplete'

" Javascript
" Plug 'pangloss/vim-javascript'

" Coffeescript
" Plug 'kchmck/vim-coffee-script'

"Vim-R Plug
" Plug 'vim-scripts/Vim-R-plugin'

" NASM syntax
" Plug 'shirk/vim-gas'

" SQL
" Plug 'shmup/vim-sql-syntax'

" Markdown
Plug 'suan/vim-instant-markdown'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'ferrine/md-img-paste.vim'
" Plug 'vim-pandoc/vim-pandoc'

"Prolog
" Plug 'adimit/prolog.vim'

"Latex
Plug 'lervag/vimtex', {'frozen': 1}
Plug 'rahul13ramesh/vim-tex-fold'

" Lua syntax
" Plug 'tbastos/vim-lua'

" Bro syntax
" Plug 'https://github.com/mephux/bro.vim.git'

" XML-editor
" Plug 'sukima/xmledit'
" Plug 'actionshrimp/vim-xpath'
" Plug 'vim-scripts/XML-Folding'

" ### Themes ###

" Gruvbox
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'flazz/vim-colorschemes'

" PowerLine
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Startup
Plug 'mhinz/vim-startify'

" all of your plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required
syntax enable
" to ignore plugin indent changes, instead use:

"}}}
" ==== Deocomplete {{{
set omnifunc=syntaxcomplete#Complete

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1

let g:deoplete#max_list = 8

let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
let g:deoplete#sources#jedi#show_docstring = 1

call deoplete#custom#source('jedi', 'debug_enabled', 0)
"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
" }}}
" ==== Jedi {{{

" Dont open box when autocompletion occurs
autocmd FileType python set completeopt=menuone,longest
autocmd FileType python setlocal complete-=i
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#auto_vim_configuration = 0

" Disable autocompletions
let g:jedi#completions_enabled = 0
let g:jedi#popup_on_dot = 0
let g:pymode_rope = 0

" So that vim splits are'nt affected
let g:jedi#use_splits_not_buffers = "left" 
" }}}
" ==== Snippets {{{

let g:neosnippet#snippets_directory = '/home/rahul/.config/nvim/plugged/neosnippet-snippets/neosnippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
			\ pumvisible() ? "\<C-n>" :
			\ neosnippet#expandable_or_jumpable() ?
			\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" }}}
" ==== Ale settings {{{
let g:ale_close_preview_on_insert = 1
let g:airline#extensions#ale#enabled = 1

" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_warn_about_trailing_blank_lines=0

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on = 'never'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '•'
" }}}
" ==== SimplyFold : Python {{{
let g:SimpylFold_docstring_preview = 1
" }}}
" ==== Markdown {{{
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 0
let g:instant_markdown_mathjax = 1
"}}}
" ==== Clang {{{
" Change clang binary path
call deoplete#custom#var('clangx', 'clang_binary', '/usr/local/bin/clang')

" Change clang options
call deoplete#custom#var('clangx', 'default_c_options', '')
call deoplete#custom#var('clangx', 'default_cpp_options', '')
" }}}
" ==== Latex {{{
let maplocalleader = ","
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


nnoremap <leader>xl :!xelatex %

" let g:vimtex_fold_enabled = 0
let g:vimtex_syntax_enabled = 1

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

let g:tex_no_error = 1
let g:tex_fold_additional_envs = ['center', 'tikzpicture', 'enumerate', 'itemize', 'frame', 'abstract', 'question', 'solution', 'question']

"}}}
" ==== Relative line nuber {{{

" Toggle relative line numbering using Ctrl-l
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

nnoremap <C-l> :call NumberToggle()<cr>
"}}}
" ==== Status Line {{{

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='angr'
" powerlineish, murmur, angr, base16_color

let g:airline_detect_modified=1
let g:airline#extensions#whitespace#enabled = 0
" }}}
" ==== General Vim settings {{{

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" Change Leader
let mapleader=","

" color scheme of code
let colorschemeval=1

if (colorschemeval > 0)
	colorscheme zenburn
else
	colorscheme gruvbox
endif

" set background colour
set background=dark
hi normal guibg=NONE ctermbg=NONE

if colorschemeval < 1
	highlight Search ctermfg=9 ctermbg=8
	highlight GitGutterAdd    ctermbg=NONE ctermfg=2
	highlight GitGutterChange ctermbg=NONE ctermfg=3
	highlight GitGutterDelete ctermbg=NONE ctermfg=1
	highlight ALEErrorSign ctermfg=9 ctermbg=NONE
	highlight ALEWarningSign ctermfg=11 ctermbg=NONE
else
	highlight Search ctermfg=225 ctermbg=6
	highlight ALEErrorSign ctermfg=1 ctermbg=0
	highlight ALEWarningSign ctermfg=3 ctermbg=0
	highlight Visual ctermbg=65
endif

if has('gui_running')
	set guioptions-=T
	" no toolbar
	" Ensure window is maximised when opened
	set lines=1000 columns=999
else
	set t_Co=256
endif

" keep 50 lines of command line history
set history=50

" show the cursor position all the time
set ruler

"show line number
set number

" Increase the height of the command line
set cmdheight=2

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" }}}
" ==== Detect Files {{{

augroup filetypedetect
	au! BufRead,BufNewFile *.m,*.oct set filetype=octave
	au! BufRead,BufNewFile *.s set filetype=nasm
	au! BufRead,BufNewFile *.S set filetype=gas
augroup END

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
" }}}
" ==== Keep undo history across sessions {{{

if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir ' . vimDir)
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif
"}}}
" ==== Comments {{{

" Using NerdCommenter instead
let NERDSpaceDelims=1
"}}}
" ==== Code folding {{{

set foldmethod=syntax
set foldnestmax=4
set foldlevel=0
set foldlevelstart=0
set foldminlines=0

let r_syntax_folding = 1

let g:vimsyn_folding ='aflmpPrt'

" to use Ctrl-Space:map to : C-@
nnoremap <space> za
vnoremap <space> zf

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

autocmd FileType wiki :set foldmethod=marker
autocmd FileType vim :set foldmethod=marker
autocmd BufWinLeave .* mkview

autocmd BufWinLeave *.tex mkview
autocmd BufWinEnter *.tex silent! loadview
autocmd BufRead,BufNewFile *.tex set filetype=tex

autocmd FileType help wincmd L
autocmd BufWinEnter *.{wiki,md,mkd,mkdn,mdown,mark*} silent setf markdown

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


" Add alt character
" let c='a'
" while c <= 'z'
	" exec "set <A-".c.">=\e".c
	" exec "imap \e".c." <A-".c.">"
	" let c = nr2char(1+char2nr(c))
" endw

set timeout ttimeoutlen=50

let g:tmux_navigator_no_mappings = 1
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

"}}}
" ==== Split management {{{

" resize vertical splits with Ctrl-w + l / Ctrl-w + h
nnoremap <c-w>l 5<C-w>>
nnoremap <c-w>h 5<C-w><
nnoremap <c-w>j 5<C-w>+
nnoremap <c-w>k 5<C-w>-
"}}}
" ==== Nerd Tree settings {{{

" Always open Nerd Tree, Additionally, Start cursor in current window
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" Close NerdTree if only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Tree toggle
nnoremap <C-n> :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$']

let NERDTreeChDirMode = 2


" Vim fonts
set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

let g:gitgutter_override_sign_column_highlight = 1

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('pdf', 'blue', 'none', '#3366FF', '#151515')

call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('yaml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')

call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')

call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('py', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('cpp', 'Red', 'none', '#ffa500', '#151515')

call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')

call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('sh', 'Cyan', 'none', '#686868', '#151515')
"}}}
" ==== CtrlP {{{

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"}}}
" ==== Change backup dirctory to tmp {{{

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"}}}
" ==== Mappings in VIM  {{{

"Map Esc key to jk
inoremap jk <Esc>

"paste toggle(toggle between paste and no-paste mode)
set pastetoggle=<F10>

"select all text
noremap <leader>a  ggVG

" Remap vertical selection
" nnoremap <C-E> <C-V>

"remap the copy, paste to Ctr-shift-C and Ctrl-shift-V
noremap <C-b> <C-v>

vnoremap <C-c> "+y
noremap <C-v>  <F10>"+p<F10> 
" Indent entire file
nnoremap <leader>i gg=G

" Neomake mappings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Indent entire file
nnoremap <leader>h :nohls<CR>

" TagBar
nmap <leader>t :TagbarToggle<CR>

"
noremap <C-f> *:%s///g<left><left><left>

"Ctags newtab and vsplit
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags=./tags;/

command -nargs=0 Spell setlocal spell spelllang=en_us
hi SpellBad cterm=underline

"}}}
" ==== Scrolling {{{

"smooth scrolling using Ctrl-D and Ctrl-U(note: if scrolling gets stuck in the middle then simply press Enter and continue)
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

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

" Text width
set tw=75
function! WidthToggle()
	let l:menu_option = strridx(&fo, "t")
	if( l:menu_option > 0)
		set fo-=t
	else
		set fo+=t
	endif
endfunc

nnoremap <leader>tw :call WidthToggle()<cr>

" Text center of screen
set so=5
"}}}
" ==== Pandoc {{{
let g:pandoc#syntax#codeblocks#embeds#langs = ["python"]
" highlight LineNr  ctermbg=NONE
highlight Conceal  ctermbg=NONE
autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = "/home/rahul/Documents/personal/wikiNotes/img"
" }}}
" ==== Vim Wiki {{{

let g:vimwiki_list = [{'path': '$HOME/Documents/personal/wikiNotes',
			\ 'syntax': 'markdown', 
			\ 'template_ext': '.html'}]

au FileType vimwiki set syntax=markdown.pandoc
au FileType md set syntax=pandoc

let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script'
"}}}
" ==== Startup Page {{{

let g:startify_bookmarks = [ {'vim': '~/.config/nvim/init.vim'}, {'zsh' : '~/.zshrc'} ]
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
"}}}
" ==== Grammarous {{{

let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
    nmap <buffer><C-f> <Plug>(grammarous-fixit)
	nmap <buffer><C-e> <Plug>(grammarous-open-info-window)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
    nunmap <buffer><C-f>
    nunmap <buffer><C-e>
endfunction
"}}}
" ==== Tabs {{{

"Tabstop is number of spaces the tab counts for
"set tabstop=8
"Soft tabstop is number of spaces counts for when editing
" set softtabstop=8

"ExpandTab inserts 4 spaces instead of the tab
set noexpandtab
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
"}}}
" ==== Set of Mappings {{{

" == normal ==
" <C>-n - Nerd Tree
" <C>-p -  File search 
" <C>-U, <C>-D scroll
" <C>-b - Vertical visual select
" <C>-\ - ctags open in newtab
" gt - change tab
" gq - word wrap
" <C>-l - relative line toggle
" ,c<space> - comment
" ,ll - latex auto compile
" ,s - syntastic active passive
" ,a - select all
" ,i - Aut indent(or Autopep8)
" ,h - Remove highlight
" ,t - Tagbar
" <space> - code fold
" <alt>  kjlh(switch windows)

" == insert ==
" C-n - Auto-complete
" C-K - complete trigger
" jk - Esc

" === Some useful ===
" GrammarousCheck
" INstantMarkdownPreview
" Vimwiki2HTML
" Gdiff
" }}}
