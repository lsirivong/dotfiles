if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
   source ~/.bash_aliases
fi

# um, remove rvm for now cause it messed up my ruby install...
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
