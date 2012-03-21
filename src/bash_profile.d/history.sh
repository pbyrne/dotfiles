# both of these do the same thing, dunno what happens if they have different values
export HISTFILESIZE=5000
export HISTSIZE=5000
# ignore duplicates in command history (used with up and down arrow to redo command)
export HISTCONTROL=ignoredups
# ignore simple commands
export HISTIGNORE="&:ls:[bf]g:exit:%[0-9]"
# history -a adds the command to history immediately
# history -n reloads the history
# PROMPT_COMMAND is performed immediately before showing a command-prompt, so after every command
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


# append each history entry from ALL terminals in realtime (not after session ending)
shopt -s histappend

alias hgrep='history | grep $1'
