if [ -d /usr/local/heroku/ ]
    set -x PATH /usr/local/heroku/bin $PATH
end
if [ -d $HOME/bin ]
    set -x PATH $HOME/bin $PATH
end
