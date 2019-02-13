" =================Vundle settings=================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.config/nvim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" Python AutoCompletion
Plug 'zchee/deoplete-jedi'

"Automatic syntax checking
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'

" Run quickrun to run the code
" Plug 'thinca/vim-quickrun'

" plugin for Git, line changes
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Neocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'

" Snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" File manager
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Nerd_commenteer
Plug 'scrooloose/nerdcommenter'

" Tmux Syntax, Navigation
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

" PowerLine
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Ctags
Plug 'majutsushi/tagbar'

"Vim-wiki
Plug 'vimwiki/vimwiki'

"Python Code Folding
Plug 'tmhedberg/SimpylFold'

"Code folding
Plug 'Konfekt/FastFold'

" Beuatify Code - python
Plug 'tell-k/vim-autopep8'

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

"Prolog
" Plug 'adimit/prolog.vim'

"Latex
Plug 'lervag/vimtex'
Plug 'matze/vim-tex-fold'
" Plug 'gi1242/vim-tex-syntax'

" Lua syntax
" Plug 'tbastos/vim-lua'

" XML-editor
" Plug 'sukima/xmledit'
" Plug 'actionshrimp/vim-xpath'
" Plug 'vim-scripts/XML-Folding'

"Fuzzy file finding
Plug 'ctrlpvim/ctrlp.vim'

" Gruvbox
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'flazz/vim-colorschemes'

" Startup
Plug 'mhinz/vim-startify'

"Grmmar
Plug 'rhysd/vim-grammarous'


"SCreenshot
Plug 'kristijanhusak/vim-carbon-now-sh'

" Vim Devicons
Plug 'ryanoasis/vim-devicons'

" all of your plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required
syntax enable
" to ignore plugin indent changes, instead use:

" Omni Completion ============

set omnifunc=syntaxcomplete#Complete

" brief help
" :pluginlist       - lists configured plugins
" :plugininstall    - installs plugins; append `!` to update or just :pluginupdate
" :pluginclean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for faq


"=======SimplyFold : Python ===========

let g:SimpylFold_docstring_preview = 1

"===============Variable replace===============
" For local replace
"gd(select work) + V(Visual) + G(file-end) + ::S/paste(gd)///gc(keep cursor to left thrice
" nnoremap gr gdVG::s/<C-R>///gc<left><left><left>

" For global replace
" nnoremap gR gdggVG::s/<C-R>///gc<left><left><left>


" ================ Markdown ======================
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1

" ================  Clang ======================
" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1
" Disable Preview
set completeopt-=preview

" ============== Neocomplete =================

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1

let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'

call deoplete#custom#source('jedi', 'debug_enabled', 1)
"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete


"===============Snippets===============

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


" ===========Relative line nuber===========

" Toggle relative line numbering using Ctrl-l
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

nnoremap <C-l> :call NumberToggle()<cr>


"===============Jedi Settings===============

let g:jedi#force_py_version=3

" Dont open box when autocompletion occurs
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal complete-=i
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#auto_vim_configuration = 0

" Disable autocompletions
let g:jedi#completions_enabled = 0
let g:jedi#popup_on_dot = 0

" Always select first popup
let g:jedi#popup_select_first = 0

" So that vim splits are'nt affected
let g:jedi#use_splits_not_buffers = "left"


" ========== Latex ==================
let maplocalleader = ","
let g:tex_flavor='tex'

nnoremap <leader>xl :!xelatex %

" let g:vimtex_fold_enabled = 0
let g:vimtex_syntax_enabled = 0

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

let g:tex_fold_additional_envs = ['center', 'tikzpicture', 'enumerate', 'itemize']

" let g:vimtex_compiler_method='latexrun'

" set grepprg=grep\ -nH\ $*
" set iskeyword+=:
" let g:Imap_UsePlaceHolders = 0


" let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $*'
" let g:Tex_CompileRule_dvi = 'pdflatex --interaction=nonstopmode $*'
" le g:Tex_IgnoredWarnings = 1

"=========Status Line================

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='murmur'

let g:airline_detect_modified=1
let g:airline#extensions#whitespace#enabled = 0


"=========Ale settings================

let g:ale_close_preview_on_insert = 1
let g:airline#extensions#ale#enabled = 1

" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on = 'never'

"=========General Vim settings================

"syntax highlightinig

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" Change Leader
let mapleader=","

" color scheme of code
colorscheme gruvbox

" set background colour
set background=dark

hi normal guibg=NONE ctermbg=NONE


" highlight Normal ctermbg=1500
" highlight Folded ctermfg=5638
highlight Search ctermfg=9 ctermbg=8


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

" ====== Detect Files ===============

augroup filetypedetect
	au! BufRead,BufNewFile *.m,*.oct set filetype=octave
	au! BufRead,BufNewFile *.s set filetype=nasm
	au! BufRead,BufNewFile *.S set filetype=gas
augroup END

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

"======== Keep undo history across sessions by storing it in a file==========

if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir ' . vimDir)
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif

"==============commenting blocks of code======================

" Using NerdCommenter instead
let NERDSpaceDelims=1

" augroup configgroup
"	autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
"	autocmd FileType sh,ruby,python   let b:comment_leader = '# '
"	autocmd FileType conf,fstab       let b:comment_leader = '# '
"	autocmd FileType tex              let b:comment_leader = '% '
"	autocmd FileType mail             let b:comment_leader = '> '
"	autocmd FileType vim              let b:comment_leader = '" '
"	autocmd FileType octave              let b:comment_leader = '% '
"	autocmd FileType nasm              let b:comment_leader = '; '
"	noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"	noremap <silent> ,uc :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
" augroup END

"============== Code folding=========

set foldmethod=syntax
set foldnestmax=4
set foldlevel=0
set foldlevelstart=1
set foldminlines=0

let r_syntax_folding = 1

let g:vimsyn_folding ='aflmpPrt'

" to use Ctrl-Space:map to : C-@
nnoremap <space> za
vnoremap <space> zf

" Ensure cold foldings are saved
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent! loadview

autocmd BufWinLeave *.md mkview
autocmd BufWinEnter *.md silent! loadview

autocmd BufWinLeave *.txt mkview
autocmd BufWinEnter *.txt silent! loadview

autocmd BufWinLeave *.html mkview
autocmd BufWinEnter *.html silent! loadview

autocmd BufWinLeave *.tex mkview
autocmd BufWinEnter *.tex silent! loadview
autocmd BufRead,BufNewFile *.tex set filetype=tex

autocmd BufWinLeave .vimrc mkview
autocmd BufWinEnter .vimrc silent! loadview

autocmd FileType help wincmd L
autocmd BufWinEnter *.{wiki,md,mkd,mkdn,mdown,mark*} silent setf markdown

" ======= Tmux settings========

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

" ======= Split management ========

" resize vertical splits with Ctrl-w + l / Ctrl-w + h
nnoremap <c-w>l 5<C-w>>
nnoremap <c-w>h 5<C-w><
nnoremap <c-w>j 5<C-w>+
nnoremap <c-w>k 5<C-w>-

" ======= Nerd Tree settings ========

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


" ================= CtrlP ==================

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


"================change backup dirctory to tmp===========

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"=========Mappings in VIM  ===================

"Map Esc key to jk
inoremap jk <Esc>

"paste toggle(toggle between paste and no-paste mode)
set pastetoggle=<F10>

"select all text
noremap <leader>a  ggVG

" Remap vertical selection
" nnoremap <C-E> <C-V>

"remap the copy, paste to Ctr-shift-C and Ctrl-shift-V
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

"Ctags newtab and vsplit
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags=./tags;/

" ==================Scrolling ===================

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
set tw=80
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

"============= Menu ====================
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"================== Vim Wiki=======================

let g:vimwiki_list = [{'path': '$HOME/Documents/personal/wikiNotes',
			\ 'syntax': 'markdown', 
			\ 'template_ext': '.html'}]

au FileType vimwiki set syntax=pandoc
au FileType md set syntax=pandoc

" let wiki = {}
" let wiki.path = '$HOME/Documents/vim/wiki'
" let wiki.nested_syntaxes = {'python': 'python', 'cpp': 'cpp'}

" let wiki.template_path =  '$HOME/Documents/vim/wiki/templates'
" let wiki.template_default = 'def_template'
" let wiki.template_ext= '.html'
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script'



" ================= Mouse =========================
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" ===========USER DEFINED COMMANDS =============

" define command Cmd(user command must begin with CAPS)
"  :Cmd <CMD> ---- --- executes shell command
" Clear screen
" Execute the command
" then wait for key-stroke(read any character)
" redraw screen, go back to VIM
" @% refers to current file name

"tex live spell check
command -nargs=0 Spell setlocal spell spelllang=en_gb

" ================Startup Page =============

let g:startify_bookmarks = [ {'vim': '~/.config/nvim/init.vim'}, {'zsh' : '~/.zshrc'} ]
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
" ============== Grammarous ===============
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


" ============== Tabs ====================


"Tabstop is number of spaces the tab counts for
"set tabstop=8
"Soft tabstop is number of spaces counts for when editing
" set softtabstop=8

"ExpandTab inserts 4 spaces instead of the tab
set noexpandtab
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4



" =========== Set of Mappings =======

" == normal ==
" <C>-n - Nerd Tree
" <C>-l - relative line toggle
" <C>-p -  File search 
" <C>-U, <C>-D scroll
" <C>-\ - ctags open in newtab
" gt - change tab
" gq - word wrap
" ,c<space> - comment
" ,ll - latex auto compile
" ,s - syntastic active passive
" ,a - select all
" ,i - Aut indent(or Autopep8)
" ,h - Remove highlight
" ,t - Tagbar
" ,tw - tree width toggle
" <space> - code fold
" <alt>  kjlh(switch windows)

" == insert ==
" C-n - Auto-complete
" C-K - complete trigger
" jk - Esc
" 

" === Some useful ===
" GrammarousCheck
" INstantMarkdownPreview
" Vimwiki2HTML
" Gdiff



