set -x EDITOR vim
set -x TERM xterm-256color
set usual_user paul

if [ -d /usr/local/heroku/ ]
    set -x PATH /usr/local/heroku/bin $PATH
end
if [ -d $HOME/.local/bin ]
    set -x PATH $HOME/.local/bin $PATH
end

# if we have autojump:
if test -f $HOME/.autojump/share/autojump/autojump.fish
    source $HOME/.autojump/share/autojump/autojump.fish
end

if which ruby > /dev/null; and which gem > /dev/null
    set -x PATH (ruby -rubygems -e 'puts Gem.user_dir')/bin $PATH
end

if [ -f "$HOME/.config/fish/local_config.fish" ]
    source $HOME/.config/fish/local_config.fish
end

# virtualfish: a fish virtualenvwrapper replacement
eval (python -m virtualfish auto_activation compat_aliases global_requirements projects)
set -x PATH "/home/paul/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
rvm default
