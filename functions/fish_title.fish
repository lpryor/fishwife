function fish_title -d "Write out the window title."
  set __wx_pwd_last ''
  if [ $PWD = $HOME ]
    set __wx_pwd_last '~'
  else
    eval set __wx_pwd_list (echo -n $PWD | sed 's/ /%20/g' | sed 's/\// /g')
    set __wx_pwd_last (echo -n $__wx_pwd_list[-1] | sed 's/%20/ /g')
  end
  echo -n (hostname|cut -d . -f 1)" : $__wx_pwd_last"
  if [ $_ != 'fish' ]
    echo -n ' $ '
    echo -n $_
  end
end
