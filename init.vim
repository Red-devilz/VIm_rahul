" ==== Vim-plug settings {{{

set nocompatible              
filetype off                 

call plug#begin('~/.config/nvim/plugged') "

" ### Autocomplete ###
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets', {'frozen': 1}

" ### File Manipulation ###
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'

" ### Tools. ###
Plug 'christoomey/vim-tmux-navigator'
Plug 'rhysd/vim-grammarous'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'Konfekt/FastFold'
Plug 'w0rp/ale'
Plug 'michaeljsmith/vim-indent-object'

" ### Language Specific Plugins ####
Plug 'rahul13ramesh/SimpylFold'
Plug 'tell-k/vim-autopep8'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'

Plug 'lervag/vimtex', {'frozen': 1}
Plug 'rahul13ramesh/vim-tex-fold'
Plug 'KeitaNakamura/tex-conceal.vim'

Plug 'suan/vim-instant-markdown'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'ferrine/md-img-paste.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-pandoc/vim-pandoc'
Plug 'tmux-plugins/vim-tmux'

" ### Aesthetics ###
Plug 'jnurmine/Zenburn'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" Plug 'flazz/vim-colorschemes'
" Plug 'Shougo/deoplete-clangx'
" Plug 'majutsushi/tagbar'
" Plug 'artur-shaik/vim-javacomplete2'
" Plug 'vim-scripts/javacomplete'
" Plug 'pangloss/vim-javascript'
" Plug 'kchmck/vim-coffee-script'
" Plug 'vim-scripts/Vim-R-plugin'
" Plug 'shirk/vim-gas'
" Plug 'shmup/vim-sql-syntax'
" Plug 'adimit/prolog.vim'
" Plug 'tbastos/vim-lua'
" Plug 'https://github.com/mephux/bro.vim.git'
" Plug 'sukima/xmledit'
" Plug 'actionshrimp/vim-xpath'
" Plug 'vim-scripts/XML-Folding'

" all of your plugins must be added before the following line
call plug#end()

filetype plugin indent on
syntax enable

"}}}
" ==== Deoplete {{{
set omnifunc=syntaxcomplete#Complete

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#max_list = 8
let g:deoplete#sources#jedi#python_path = '/home/rahul/Documents/software/anaconda3/envs/py36/bin/python3'
let g:deoplete#sources#jedi#show_docstring = 1

call deoplete#custom#source('jedi', 'debug_enabled', 0)
 
" Enable omni completion.
augroup filecompletion
    au! FileType css setlocal omnifunc=csscomplete#CompleteCSS
    au! FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    au! FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    au! FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    au! FileType python setlocal omnifunc=jedi#completions
    au! FileType python set completeopt=menuone,longest
    au! FileType python setlocal complete-=i
augroup END
"}}}
" ==== Snippets {{{
let g:neosnippet#snippets_directory = '/home/rahul/.config/nvim/plugged/neosnippet-snippets/neosnippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"}}}
" ==== Jedi {{{

let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#popup_on_dot = 0

" So that vim splits aren't affected
let g:jedi#use_splits_not_buffers = "left" 
" }}}
" ==== SimplyFold : Python {{{
let g:SimpylFold_docstring_preview = 1
" }}}
" ==== Ale settings {{{
let g:ale_close_preview_on_insert = 1

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
" ==== Markdown {{{
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_browser = "surf"
"}}}
" ==== Clang {{{
" Change clang binary path
" call deoplete#custom#var('clangx', 'clang_binary', '/usr/local/bin/clang')

" Change clang options
" call deoplete#custom#var('clangx', 'default_c_options', '')
" call deoplete#custom#var('clangx', 'default_cpp_options', '')
" }}}
" ==== Latex {{{
let maplocalleader = ","
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal="abdgms"

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
    au BufRead,BufNewFile *.tex set filetype=tex
augroup END

"}}}
" ==== Pandoc {{{
let g:pandoc#syntax#codeblocks#embeds#langs = ["python"]
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#folding#fold_fenced_codeblocks = 1
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#folding#mode = ["syntax"]
let g:pandoc#modules#enabled = ["formatting", "folding", "toc"]
let g:pandoc#formatting#mode = "h"
let g:pandoc#folding#use_foldtext = 0
 
augroup markdownformat
    au! FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
    let g:mdip_imgdir = "images"
    au FileType markdown highlight Conceal  ctermbg=NONE
    au! FileType markdown set syntax=pandoc
augroup END
" }}}
" ==== Vim Wiki {{{

let g:vimwiki_global_ext= 0 
let g:vimwiki_list = [{'path': '$HOME/Documents/personal/wikiNotes',
			\ 'syntax': 'markdown', 
			\ 'template_ext': '.html'}]

let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_folding='expr'

" au FileType vimwiki set filetype=vimwiki.markdown
au FileType md set syntax=pandoc
au FileType vimwiki set syntax=markdown.pandoc
au FileType vimwiki set foldtext=Foldtxt()
au BufNewFile,BufRead *.wiki  set syntax=markdown.pandoc
au BufNewFile,BufRead vimwiki  set syntax=markdown.pandoc

let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,pre,script'
"}}}
" ==== Status Line {{{
set laststatus=2
set noshowmode
let g:lightline = {
			\ 'colorscheme': 'seoul256',
			\ }

let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
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

if (colorschemeval == 0)
	colorscheme gruvbox
endif
if (colorschemeval == 1)
	colorscheme zenburn
endif
if (colorschemeval == 2)
	colorscheme nord
endif


" set background colour
set background=dark
hi normal guibg=NONE ctermbg=NONE

if (colorschemeval == 0)
	highlight Search ctermfg=9 ctermbg=8
	highlight ALEErrorSign ctermfg=9 ctermbg=NONE
	highlight ALEWarningSign ctermfg=11 ctermbg=NONE
endif
if (colorschemeval == 1)
	highlight Pmenu ctermbg=NONE
	highlight LineNr ctermbg=NONE ctermfg=8
	highlight CursorLineNr ctermbg=NONE ctermfg=NONE
	highlight Folded ctermbg=NONE ctermfg=8
	highlight Search ctermfg=2 ctermbg=66
	highlight Visual ctermbg=66
	highlight ALEErrorSign ctermfg=1 ctermbg=NONE
	highlight ALEWarningSign ctermfg=3 ctermbg=NONE
endif
if (colorschemeval == 2)
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
autocmd BufWinEnter *.{wiki,md,mkd,mkdn,mdown,mark*} silent setf markdown
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
			\| exe "normal! g'\"" | endif


" }}}
" ==== Detect Files {{{
augroup filetypedetect
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

autocmd FileType vim :set foldmethod=marker
autocmd BufWinLeave .* mkview

autocmd BufWinLeave *.tex mkview
autocmd BufWinEnter *.tex silent! loadview

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

"}}}
" ==== Nerd Tree settings {{{

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
" ==== FzF {{{

" This is the default extra key bindings
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'left': '~20%' }
let g:fzf_preview_window = ''

" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '30new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
let g:fzf_history_dir = '~/.local/share/fzf-history'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

"}}}
" ==== Scrolling, Text-width {{{

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

" Toggle relative line numbering using Ctrl-l
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc
 
" Text center of screen
set so=10
 
"}}}
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

" Neomake mappings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

nnoremap <leader>h :nohls<CR>
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <C-l> :call NumberToggle()<cr>
nnoremap <leader>tw :call WidthToggle()<cr>

"Ctags newtab and vsplit
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags=./tags;/

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

nnoremap <C-f> :GFiles<CR>
nnoremap <leader>l <Esc>:BLines!<CR>
nnoremap <leader>g :Commits!<CR>

nmap <leader>c <Plug>Commentary
vmap <leader>c <Plug>Commentary

"}}}
" ==== Startup Page {{{

let g:startify_bookmarks = [ {'vim': '~/Documents/config/Vim__files/init.vim'},
            \ {'zsh': '~/Documents/config/term_files/shell/dot.zshrc'},
            \ {'tmux': '~/Documents/config/term_files/shell/dot.tmux.conf'},
            \ {'wiki': '~/Documents/personal/wikiNotes/index.wiki'} ]
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 5
let g:startify_lists = [
			\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
			\ { 'type': 'files',     'header': ['   MRU']            },
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
let g:startify_custom_header = g:ascii + startify#pad(startify#fortune#boxed())
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

"}}}
" ==== Tabs {{{
"ExpandTab inserts 4 spaces instead of the tab
set expandtab
set tabstop=4
set shiftwidth=4
" set softtabstop=0 noexpandtab
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
