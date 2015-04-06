# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
if [ -d $ZSH ]; then
    # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
    # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
    # Example format: plugins=(rails git textmate ruby lighthouse)
    # Add wisely, as too many plugins slow down shell startup.
    plugins=(autojump colorize cp gpg-agent pass tmux vundle git gitignore pip python virtualenv virtualenvwrapper debian)
    # export MANPATH="/usr/local/man:$MANPATH"

    source $ZSH/oh-my-zsh.sh
fi
# set $TERM to have many beautiful colors
export TERM=xterm-256color

# add ~/bin to path, if present.
if [ -d $HOME/bin ]; then
    export PATH="$HOME/bin:$PATH"
fi

# Path to powerline. I also quite like liquidprompt.
POWERLINE=/usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
if [ -e $POWERLINE ]; then
    . $POWERLINE
fi

# That's all for now.
