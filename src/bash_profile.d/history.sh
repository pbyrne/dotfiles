# both of these do the same thing, dunno what happens if they have different values
export HISTFILESIZE=5000
export HISTSIZE=5000
# ignore duplicates in command history (used with up and down arrow to redo command)
export HISTCONTROL=ignoredups
alias hgrep='history | grep $1'
