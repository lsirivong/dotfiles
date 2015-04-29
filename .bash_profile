if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
   source ~/.bash_aliases
fi

# The next line updates PATH for the Google Cloud SDK.
source '/Users/lsirivong/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/lsirivong/google-cloud-sdk/completion.bash.inc'
