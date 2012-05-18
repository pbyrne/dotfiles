# `work foo` to navigate to SHARED_WORKSPACE/foo.
work() {
  cd ~/workspace/$1
}

# for easier typing
alias w='work'

# the autocompletion function, listing contents of workspace
_work() {
  _files -W ~/workspace/
}

# and set up autocomplete for the function and its alias
compdef _work work

