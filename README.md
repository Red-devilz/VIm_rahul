Neovim is based on async execution which results in a snappy text-editor

## Setup

```bash
	$ git clone https://github.com/rahul13ramesh/Vim__files.git
	$ cd Vim__files
	$ bash install.sh
```

## Key Plugins

* Plugin Management
	* [vim-plug](https://github.com/VundleVim/Vundle.vim) - Async Vim plugin manager 
* Git and File Manager :
	* [NerdTree](https://github.com/scrooloose/nerdtree) - File Manager for vim
	* [Vim GitGutter](https://github.com/airblade/vim-gitgutter) - Vim line changes indicator(for git commits)
	* [Fugitive](https://github.com/tpope/vim-fugitive) - Git wrapper 
	* [NerdTree-git](https://github.com/Xuyuanp/nerdtree-git-plugin) - Git features for Nerd Tree
* Autocompletion and Snippets:
	* [Deoplete](https://github.com/Shougo/neocomplete.vim) - Autocompletion for Nvim
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
	* [Jedi](https://github.com/davidhalter/jedi-vim) - Autocompletion for python 
	* [vimtex](https://github.com/vim-latex/vim-latex) - On the fly compiling of tex documents
* Misc.
	* [NerdCommenter](https://github.com/scrooloose/nerdcommenter) - For commenting Code 
	* [VimWiki](https://github.com/vimwiki/vimwiki) - Maintaining a wiki/notes
	* [CtrlP](https://github.com/ctrlpvim/ctrlp.vim) - Fuzzy file finding


# Custom Mappings

Here are some key mappings/commands:

|Command                      | Function                                          |
|-----------------------------|---------------------------------------------------|
|\<leader\>                   | ,                                                 |
|\<Esc\>                      | jk                                                |
|,t                           | All functions and variable                        |
|\<Ctrl-c\>             | copy        |
|\<Ctrl-v\>             | paste    |
|\<Ctrl-b)           | Vertical Line Selection                           |
|<C-n> (normal mode)          | File manager                                      |
|,c<Space> (normal mode)      | Comment lien                                      |
|<Space> (normal mode)        | To open and close Folds                           |
|,a                           | Select all                                        |
|<C-u>, <C-d>                 | Scroll up and Down                                |
|<C-l> (normal mode)          | Toggle Line Number                                |
|<Alt-j>                      | To switch splits(same follows for k,l,h)          |
|<C-j>                        | To resize splits(same follows for k,l,h)          |
|,ww                          | Vimwiki                                           |
| <C-p>                       | Fuzzy File finding                                |
|:Autoformat<CR>              | Indent entire File (Otherwise use : ,i)           |
|:InstantMarkdownPreview<CR>  | Fuzzy File finding                                |

Fugitive and Syntastic also have a bunch of interesting commands worth checking out


