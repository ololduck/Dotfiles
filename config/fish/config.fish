if [ -d /usr/local/heroku/ ]
    set -x PATH /usr/local/heroku/bin $PATH
end
if [ -d $HOME/.local/bin ]
    set -x PATH $HOME/.local/bin $PATH
end

# if we have autojump:
if test -f $HOME/.autojump/share/autojump/autojump.fish
    . $HOME/.autojump/share/autojump/autojump.fish
end

if [ -f "$HOME/.config/fish/local_config.fish" ]
    . $HOME/.config/fish/local_config.fish
end
