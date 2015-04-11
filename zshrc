# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
if [ ! -d $ZSH ]; then
    echo "\033[0;34mCloning Oh My Zsh...\033[0m"
    hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH || {
        echo "git not installed"
    }
fi
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump colorize cp gpg-agent pass tmux vundle git gitignore pip python virtualenv virtualenvwrapper docker debian)

source $ZSH/oh-my-zsh.sh
# set $TERM to have many beautiful colors
export TERM=xterm-256color

# add ~/bin to path, if present.
if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi
# If using NPM, use it without sudo
export NPM_PACKAGES=$HOME/.npm-packages
if [ -d $NPM_PACKAGES ]; then
    export NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH
    export PATH=$NPM_PACKAGES/bin:$PATH
fi
# Path to powerline. I also quite like liquidprompt.
POWERLINE=/usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
if [ -e $POWERLINE ]; then
    source $POWERLINE
fi

# This is for machine-specific config, like proxies, or stuff that you don't want commited.
LOCAL_CONFIG=$HOME/.zshrc_local
if [ -e $LOCAL_CONFIG ]; then
    source $LOCAL_CONFIG
fi
# That's all for now.
