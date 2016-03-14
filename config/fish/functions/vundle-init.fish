function vundle-init
    if [ ! -d ~/.vim/bundle/Vundle.vim ]
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        echo "Go read the docs! https://github.com/gmarik/Vundle.vim"
    else
        echo "Vundle is already installed!"
    end
end
