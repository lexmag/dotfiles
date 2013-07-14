. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

for file in ~/.zsh/plugins/*
do . $file
done

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
