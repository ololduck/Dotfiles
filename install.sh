#!/bin/sh
export PATH=$HOME/.local/bin:$PATH
PREFIX=$HOME/.local
SRC_SOFTS=$PREFIX/src

install_dotfiles() {
    if test -d ~/dotfiles; then
        echo "dotfiles already there"
        return 1
    fi
    pip install --user dotfiles
    git clone https://github.com/paulollivier/Dotfiles.git ~/dotfiles
    dotfiles -s
}

install_vundle(){
    if test -d ~/.vim/bundle/Vundle.vim; then
        echo "vundle already installed"
        return 1
    fi
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim -c "execute \"PluginInstall\" | qa"
}

install_dmenu2() {
    if test "$(which dmenu_run)" = "$HOME/.local/bin/dmenu_run"; then
        echo "dmenu2 already installed"
        return 1
    fi
    git clone https://github.com/mrshankly/dmenu2 $SRC_SOFTS/dmenu2
    cd $SRC_SOFTS/dmenu2
    make
    PREFIX=$PREFIX make install
}

install_autojump() {
    if test -d ~/.autojump; then
        echo "autojump already installed"
        return 1;
    fi
    git clone https://github.com/joelthelion/autojump.git $SRC_SOFTS/autojump
    cd $SRC_SOFTS/autojump
    ./install.py
}

install_i3pystatus() {
    pip3 install --user i3pystatus colour psutil
}

install_dotfiles
install_vundle
install_dmenu2
install_i3pystatus
install_autojump
