# Nvim install script
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp init.vim/ ~/.config/nvim/ -r
nvim +PlugInstall +qa!
cp neosnippets ~/.config/nvim/plugged/neosnippet-snippets/ -r

