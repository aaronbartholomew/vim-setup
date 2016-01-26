DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.gvimrc ~/.gvimrc
