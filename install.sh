mkdir ~/.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qa!

# Copy Vim files to VIMHOME
cp .vim ~/.
cp .vimrc ~/.
