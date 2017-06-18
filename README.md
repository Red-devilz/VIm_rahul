
## Setup
Contains the .vim folder and .vimrc files that I use. 

Run the following commands in the terminal :  

```bash
	$ git clone https://github.com/Red-devilz/Vim__files.git
	$ cd Vim__files
	$ chmod +x install.sh
	$ ./install.sh
```

[Clang Complete](https://github.com/myint/clang_complete) Plugin needs to be installed seperately and will not be installed with Vundle. Custom Neosnipppets are also present in the repo and can be added to the path '~/.vim/bundle/neosnippet-snippets/neosnippets' if required.

## Plugins

* Plugin Management
	* [Vundle](https://github.com/VundleVim/Vundle.vim) - Vim plugin manager 
* Git and File Manager :
	* [NerdTree](https://github.com/scrooloose/nerdtree) - File Manager for vim
	* [Vim GitGutter](https://github.com/airblade/vim-gitgutter) - Vim line changes indicator(for git commits)
	* [Fugitive](https://github.com/tpope/vim-fugitive) - Git wrapper 
	* [NerdTree-git](https://github.com/Xuyuanp/nerdtree-git-plugin) - Git features for Nerd Tree
* Autocompletion and Snippets:
	* [NeoComplete](https://github.com/Shougo/neocomplete.vim) - Autocompletion for Vim
	* [Neoinclude](https://github.com/Shougo/neoinclude.vim) - Completion for Include files
	* [NeoSnippets](https://github.com/Shougo/neosnippet.vim) - Snippets for Vim
	* [Neosnippet-snippet](https://github.com/Shougo/neosnippet-snippets) - Collection of various snippets
* Tmux Support :
	* [Vim-tmux](https://github.com/tmux-plugins/vim-tmux) - Vim tmux integration
	* [Vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - Vim tmux navigation
* Status Bar :
	* [Vim-Airline](https://github.com/vim-airline/vim-airline) - Status bar for Vim
	* [Vim-Airline Themes](https://github.com/vim-airline/vim-airline-themes) - Thees for Airline
* Syntax, Code-Folding Plugins : 
	* [Syntastic](https://github.com/scrooloose/syntastic) - Syntax checking 
	* [Jedi](https://github.com/davidhalter/jedi-vim) - Autocompletion for python 
	* [Clang Complete](https://github.com/myint/clang_complete) - C++, C syntax completion
	* [Vim R-Plugin](https://github.com/vim-scripts/Vim-R-plugin) - R syntax for Vun
	* [Vim-Javascript](https://github.com/pangloss/vim-javascript) - Javascript syntax for vim
	* [Vim-Coffeescript](https://github.com/kchmck/vim-coffee-script) - Coffeescript syntax for Vim
	* [Vim-gas](https://github.com/Shirk/vim-gas) - Assembly syntax for vim
	* [Vim SQL-syntax](https://github.com/shmup/vim-sql-syntax) - SQL syntax for vim
	* [Prolog](https://github.com/adimit/prolog.vim) - Prolog syntax files
	* [Lua](https://github.com/tbastos/vim-lua) - Lua syntax files
	* [vim-latex](https://github.com/vim-latex/vim-latex) - Latex shortcuts, syntax
	* [Fastfold](https://github.com/Konfekt/FastFold) - Speedup Vim fold updates
	* [SimplyFold](https://github.com/tmhedberg/SimpylFold) - Python code folding
* Misc.
	* [NerdCommenter](https://github.com/scrooloose/nerdcommenter) - For commenting Code 
	* [Instant Markdown](https://github.com/suan/vim-instant-markdown) - View markdown files in browser
	* [QuickRun](https://github.com/thinca/vim-quickrun) - Execute files from Vim 
	* [Tagbar](https://github.com/vim-scripts/Tagbar) - Functions/variables of current file
	* [VimWiki](https://github.com/vimwiki/vimwiki) - Maintaining a wiki/notes
	* [CtrlP](https://github.com/ctrlpvim/ctrlp.vim) - Fuzzy file finding
	* [Autoformat](https://github.com/Chiel92/vim-autoformat) - Auto indent/format file


# Custom Mappings

Here are some key mappings/commands:

|Command                      | Function                                          |
|-----------------------------|---------------------------------------------------|
|\<leader\>                   | ,                                                 |
|\<Esc\>                      | jk                                                |
|,t                           | All functions and variable                        |
|\<Ctrl-Shift-c\>             | copy  (terminal's copy is mapped to Ctrl-C)       |
|\<Ctrl-Shift-v\>             | paste (terminal's copy is mapped to Ctrl-V)       |
|\<Ctrl-Shift-E> e)           | Vertical Line Selection                           |
|<C-n> (insert mode)          | Autocomplete/Snippets with Neocomplete            |
|<C-n> (normal mode)          | File manager                                      |
|,c<Space> (normal mode)      | Comment lien                                      |
|<Space> (normal mode)        | To open and close Folds                           |
|,a                           | Select all                                        |
|gr                           | Local replace of variable under cursor            |
|gR                           | Local replace of variable under cursor            |
|<C-u>, <C-d>                 | Scroll up and Down                                |
|<C-l> (normal mode)          | Toggle Line Number                                |
|<Alt-j>                      | To switch splits(same follows for k,l,h)          |
|<C-j>                        | To resize splits(same follows for k,l,h)          |
|,ww                          | Vimwiki                                           |
| <C-p>                       | Fuzzy File finding                                |
|:Autoformat<CR>              | Indent entire File (Otherwise use : ,i)           |
|:InstantMarkdownPreview<CR>  | Fuzzy File finding                                |
|:ll<CR>                      | First error in syntastic                          |
|:Q                           | Quickrun current File                             |

Fugitive and Syntastic also have a bunch of interesting commands worth checking out


