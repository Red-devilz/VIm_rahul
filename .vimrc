" =================Vundle settings=================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"AutoCompletion
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'

" Python AutoCompletion
Plugin 'davidhalter/jedi-vim'

"Automatic syntax checking
Plugin 'Syntastic'

" Run quickrun to run the code
Plugin 'thinca/vim-quickrun'

" plugin on Git
Plugin 'tpope/vim-fugitive'

" File manager
Plugin 'scrooloose/nerdtree'

" git for nerdtree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Nerd_commenteer
Plugin 'scrooloose/nerdcommenter'

" Tmux Syntax
Plugin 'tmux-plugins/vim-tmux'

" Tmux navigation
Plugin 'christoomey/vim-tmux-navigator'

" Snippets 
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/snipmate-snippets'

" You complete me
" Plugin 'Valloric/YouCompleteMe'

" PowerLine
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Git plugin
Plugin 'airblade/vim-gitgutter'

"Vim-wiki
Plugin 'vimwiki/vimwiki'
 
"Vim-R Plugin
Plugin 'vim-scripts/Vim-R-plugin'

"Python Code Folding
Plugin 'tmhedberg/SimpylFold'

"Code folding
Plugin 'Konfekt/FastFold'


" Plugin 'klen/python-mode'
" all of your plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" to ignore plugin indent changes, instead use:
"filetype plugin on
"
" brief help
" :pluginlist       - lists configured plugins
" :plugininstall    - installs plugins; append `!` to update or just :pluginupdate
" :pluginclean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for faq

"===============Snippets===============

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"===============YCM===============
"
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

"=======SimplyFold : Pyton ===========

let g:SimpylFold_docstring_preview = 1

"===============Variable replace===============
" For local replace
"gd(select work) + V(Visual) + G(file-end) + ::S/paste(gd)///gc(keep cursor to left thrice
nnoremap gr gdVG::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gdggVG::s/<C-R>///gc<left><left><left>


" ===========Relative line nuber===========

" Toggle relative line numbering using Ctrl-P
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

nnoremap <C-l> :call NumberToggle()<cr>


"===============Jedi Settings===============

" Dont open box when autocompletion occurs
autocmd FileType python setlocal completeopt-=preview

" Disable autocompletions
" let g:jedi#completions_enabled = 0

" Do not Autocomplete on Dots
let g:jedi#popup_on_dot = 0


" AutoCompletion key
let g:jedi#completions_command = "<C-n>"

" Always select first popup
let g:jedi#popup_select_first = 0


" So that vim splits are'nt affected
let g:jedi#use_splits_not_buffers = "left"

" Add this so that virtual environment docs also work

" Use Shift + k to bring up documentation

"=========Status Line================

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='murmur'

let g:airline_detect_modified=1 
let g:airline#extensions#whitespace#enabled = 0


"=========Syntastic settings================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5
" let g:syntastic_auto_jump = 2

" use :ll to jump to the next error

"=========General Vim settings================

"syntax highlightinig
syntax enable

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

" ======.m files are octave files ===============

augroup filetypedetect
	au! BufRead,BufNewFile *.m,*.oct set filetype=octave
	au! BufRead,BufNewFile *.s set filetype=nasm
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
" 	autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
" 	autocmd FileType sh,ruby,python   let b:comment_leader = '# '
" 	autocmd FileType conf,fstab       let b:comment_leader = '# '
" 	autocmd FileType tex              let b:comment_leader = '% '
" 	autocmd FileType mail             let b:comment_leader = '> '
" 	autocmd FileType vim              let b:comment_leader = '" '
" 	autocmd FileType octave              let b:comment_leader = '% '
" 	autocmd FileType nasm              let b:comment_leader = '; '
" 	noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" 	noremap <silent> ,uc :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
" augroup END

"============== Code folding=========

set foldmethod=syntax
set foldnestmax=10
set foldlevel=1
set foldminlines=4

let r_syntax_folding = 1 

let g:vimsyn_folding ='aflmpPrt'

" to use Ctrl-Space:map to : C-@
nnoremap <space> za
vnoremap <space> zf

" Ensure cold foldings are saved
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview 

autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadview 

autocmd BufWinLeave .vimrc mkview
autocmd BufWinEnter .vimrc silent loadview 

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
let c='a'
while c <= 'z'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endw

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

"remap the copy, paste to Ctr-shift-C and Ctrl-shift-V 
vnoremap <C-C> "+y   
noremap <C-V>  <F10>"+p<F10>

" Indent entire file
nnoremap <leader>i gg=G

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
 
" define command Cmd( syntax -----    :Cmd <CMD> )
command! -nargs=+ -complete=dir Cmd execute ':silent !echo $USER"@Enigma:~"${PWD:11}"$ "'.<q-args> |execute ':silent !'.<q-args>  | execute ':silent !read -n 1'  |  execute ':redraw!'
"  execute ':silent !clear' | | execute ':silent !echo \n

" define command Gcc( syntax -----    :Gcc <EXEC> )
command! -nargs=+ -complete=dir Gcc Cmd gcc % -o <q-args>
 
" define command Make( syntax ------  :Make <FILENAME> )
command! -nargs=+ -complete=dir Make Cmd make -f <q-args>

"tex live spell check
command -nargs=0 Spell setlocal spell spelllang=en_gb


" Run python script
command -nargs=0 RunP Cmd python % 

" Run python3 script
command -nargs=0 RunP3 Cmd python3 % 

" Run C script as a.out
command -nargs=0 RunC Cmd gcc % && ./a.out 

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


