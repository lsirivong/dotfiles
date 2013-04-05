source ~/.git-completion.bash
source ~/.git-prompt.sh
export PS1='\[\e[1;35m\]\u@\h\[\e[0m\] \W$(__git_ps1 " (\[\e[1;33m\]%s\[\e[0m\])") 🍔  '
# export PS1='\u@\h \W$(__git_ps1 " (\[\e[1;33m\]%s\[\e[0m\])") \$ '

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
