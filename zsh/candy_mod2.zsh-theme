eval custom_gray='$FG[007]'
eval custom_green='$FG[002]'
eval custom_red='$FG[001]'
eval custom_yellow='$FG[003]'
eval custom_blue='$FG[004]'

PROMPT=$'%{$custom_blue%}%n %{$reset_color%}at %{$reset_color%}%{$custom_yellow%}%m %{$reset_color%}%{$my_gray%}% in %~%{$reset_color%} $(git_prompt_info)\
%{$fg_bold[blue]%} %#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$custom_green%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$custom_green%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
