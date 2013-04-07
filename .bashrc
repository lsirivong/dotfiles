# git auto complete
source ~/.git-completion.bash
# git repo info for prompt
source ~/.git-prompt.sh

# ex: [username]@[machine name] [current dir] [(git branch)] [hamburger emoji]
export PS1='\[\e[1;35m\]\u@\h\[\e[0m\] \W$(__git_ps1 " (\[\e[1;33m\]%s\[\e[0m\])") 🍔  '

PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
