# Nvim install script
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/config/Vim__files/init.vim/ ~/.config/nvim/ 
nvim +PlugInstall +qa!
cp neosnippets ~/.config/nvim/plugged/neosnippet-snippets/ -r

