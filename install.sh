mkdir ~/.vim -p

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy Vim files to VIMHOME
cp .vim ~/. -r
cp .vimrc ~/. -r

vim +PlugInstall +qa!

