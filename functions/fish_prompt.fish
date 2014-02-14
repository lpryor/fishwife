set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green bold

function fish_prompt -d "Write out the prompt"
  set __wx_last_status $status
  set __wx_pwd_last ''
  if [ $PWD = $HOME ]
    set __wx_pwd_last '~'
  else
    eval set __wx_pwd_list (echo -n $PWD | sed 's/ /%20/g' | sed 's/\// /g')
    set __wx_pwd_last (echo -n $__wx_pwd_list[-1] | sed 's/%20/ /g')
  end
  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end
#  set __wx_git_info ''
  set __wx_git_info (__fish_git_prompt)
  set __wx_prompt_symbol ''
  switch $USER
    case root; set __wx_prompt_symbol '#'
    case '*';  set __wx_prompt_symbol '$'
  end
  set __wx_symbol_color normal
  if not test $__wx_last_status -eq 0
    set __wx_symbol_color $fish_color_error
  end
  if [ "$__wx_git_info" = "" ]
    printf '%s%s%s %s%s ' (set_color $fish_color_cwd) "$__wx_pwd_last" (set_color $__wx_symbol_color) $__wx_prompt_symbol (set_color normal)
  else
    printf '%s%s%s%s %s%s%s ' (set_color $fish_color_cwd) "$__wx_pwd_last" (set_color normal) "$__wx_git_info" (set_color $__wx_symbol_color) $__wx_prompt_symbol (set_color normal)
  end
end
