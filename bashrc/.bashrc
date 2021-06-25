source ~/.git-prompt.sh
color_prompt=yes
if [ "$color_prompt" = yes ]; then
 PS1='\[\e[1;32m\]\u\[\e[1;32m\]@\[\e[1;32m\]\h\[\e[1;32m\]:\[\e[1;34m\]\w\[\e[1;34m\]\[\e[1;31m\]$(__git_ps1 " (%s)")\[\e[0;39m\]\$ '
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

#default path to my python 3.8.3 modules
export PATH="$PATH:/usr/local/lib/python3.8/site-packages/"
export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python3.8/site-packages/"

# remove duplicates from bash history
export HISTCONTROL="ignoreboth:erasedups"
