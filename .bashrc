# git auto complete
source ~/.git-completion.bash
# git repo info for prompt
source ~/.git-prompt.sh

# ex: [current dir] [(git branch)] [hamburger emoji]
export PS1='\e[0;30m\]\A\e[0m\] \e[0;32m\]\w\e[0m\]$(__git_ps1 " (\[\e[1;33m\]%s\[\e[0m\])")\n🍔  '

# export EDITOR='vim'
export EDITOR='subl -w'

# PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$HOME/.rbenv/bin:/usr/local/bin:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/:$PATH
eval "$(rbenv init -)"

export NVM_DIR="/Users/lsirivong/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/git/bin:$PATH"
