DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.gvimrc ~/.gvimrc

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
curl -o ~/.config/kitty/nord.conf https://raw.githubusercontent.com/connorholyday/nord-kitty/master/nord.conf
cp $DIR/kitty.conf ~/.config/kitty/kitty.conf

# install bat
sudo apt install bat
ln -s /usr/bin/batcat ~/.local/bin/bat

# install lazygit
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit

# install vim8.2
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
sudo apt install vim-gtk3 vim-nox
