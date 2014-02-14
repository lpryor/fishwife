function fish_right_prompt -d "Write out the right prompt"
  if [ $PWD = $HOME ]
    echo -n (hostname|cut -d . -f 1)
  else
    set -l __wx_home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
    eval set __wx_pwd_list (echo -n $PWD | sed 's/ /%20/g' | sed 's/\// /g')
    set __wx_pwd_init (echo -n "/$__wx_pwd_list[1..-2]" | sed 's/ /\//g' | sed 's/%20/ /g' | sed "s/^$__wx_home_escaped/~/")
    echo -n (hostname|cut -d . -f 1)":$__wx_pwd_init"
  end
end
