source ~/.git-prompt.sh
color_prompt=yes
if [ "$color_prompt" = yes ]; then
 PS1='\[\e[1;32m\]\u\[\e[1;32m\]@\[\e[1;32m\]\h\[\e[1;32m\]:\[\e[1;36m\]\w\[\e[1;36m\]\[\e[1;33m\]$(__git_ps1 " (%s)")\[\e[0;39m\]\$ '
else
 PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi
export PATH="$PATH:/opt/mssql-tools/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/user/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/user/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/user/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/user/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#PROMPT_COMMAND='echo -en "\033]0;$(whoami)@$(hostname):\$ $(pwd)\a"'
PROMPT_COMMAND='echo -en "\033]0;$(whoami)@$(hostname):$(pwd | sed -e "s!$HOME!~!ig")\007"'

export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

# remove duplicates from bash history
export HISTCONTROL="ignoreboth:erasedups"

if [ -n "$GTK_MODULES" ]; then
    GTK_MODULES="${GTK_MODULES}:appmenu-gtk-module"
else
    GTK_MODULES="appmenu-gtk-module"
fi

if [ -z "$UBUNTU_MENUPROXY" ]; then
    UBUNTU_MENUPROXY=1
fi

export GTK_MODULES
export UBUNTU_MENUPROXY

alias archey="python3 -m archey"