function prompt_user
  # User
  set -l user (whoami)
  if test $user != "$usual_user"
    set_color $fish_color_user
    echo -n $user
    set_color normal
    echo -n '@'
    # Host
    set_color $fish_color_host
    echo -n (hostname -s)
    set_color normal
    echo -n ':'
  end
end

function fish_prompt --description 'Write out the prompt'
  set -l last_status $status
  prompt_user

  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  echo -n ' '
  git_prompt
  echo -n ' '

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n '➤ '
  set_color normal
end
