" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"syntax highlighting
syntax enable
"
"indentation
filetype indent plugin on

" search as characters are entered
set incsearch           

" highlight matches
set hlsearch            


" color scheme of code
colorscheme gruvbox

" set background colour
set background=dark



if has('gui_running')
	" no toolbar
 	set guioptions-=T  
	" Ensure window is maximised when opened
 	set lines=1000 columns=999

else
	set t_Co=256	
endif


"Tabstop is number of spaces the tab counts for
"set tabstop=8

"Soft tabstop is number of spaces counts for when editing
" set softtabstop=8

"ExpandTab inserts 4 spaces instead of the tab
"set expandtab

" keep 50 lines of command line history
set history=50		

" show the cursor position all the time
set ruler		

"show line number
set number

" Increase the height of the command line
set cmdheight=2



" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" .m files are octave files
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

"commenting blocks of code.
augroup configgroup
	autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
	autocmd FileType sh,ruby,python   let b:comment_leader = '# '
	autocmd FileType conf,fstab       let b:comment_leader = '# '
	autocmd FileType tex              let b:comment_leader = '% '
	autocmd FileType mail             let b:comment_leader = '> '
	autocmd FileType vim              let b:comment_leader = '" '
	autocmd FileType octave              let b:comment_leader = '% '
	noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
	noremap <silent> ,uc :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
augroup END

"change backup dirctory to tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


" allow backspacing over everything in insert mode
set backspace=indent,eol,start




"Mappings in VIM

"Map Esc key to jk 
inoremap jk <Esc>

"paste toggle(toggle between paste and no-paste mode)
set pastetoggle=<F10>


"remap the copy, paste to Ctr-shift-C and Ctrl-shift-V 
vnoremap <C-C> "+y   
noremap <C-V>  <F10>"+p<F10>

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


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"USER DEFINED COMMANDS

" define command Cmd(user command must begin with CAPS)
"  :Cmd <CMD> ---- --- executes shell command
" Clear screen
" Execute the command
" then wait for key-stroke(read any character)
" redraw screen, go back to VIM
" @% refers to current file name
 
" define command Cmd( syntax -----    :Cmd <CMD> )
command! -nargs=+ -complete=dir Cmd execute ':silent !echo $USER"@"$HOSTNAME":~"${PWD:11}"$ "'.<q-args> |execute ':silent !'.<q-args>  | execute ':silent !read -n 1 -s'  |  execute ':redraw!'
"  execute ':silent !clear' | | execute ':silent !echo \n

" define command Gcc( syntax -----    :Gcc <EXEC> )
command! -nargs=+ -complete=dir Gcc Cmd gcc % -o <q-args>
 
" define command Make( syntax ------  :Make <FILENAME> )
command! -nargs=+ -complete=dir Make Cmd make -f <q-args>







