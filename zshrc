. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

for file in ~/.zsh/plugins/*
do source $file
done

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
