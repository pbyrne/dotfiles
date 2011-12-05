current_git_branch() {
  git branch 2> /dev/null |
  grep '^\* ' |
  awk '{ print $2 }'
}

work() {
  cd ~/workspace/$1
}

# bash completion function for work()
_work() {
  local cur
  local trim
  cur=${COMP_WORDS[COMP_CWORD]}
  # length of expanded path, used to trim off first portion of matched paths below
  trim=`echo ~/workspace/ | wc -c`
  # perform completion, returning all directories in workspace, trimming off the path to the workspace
  COMPREPLY=( $( compgen -S/ -d ~/workspace/$cur | cut -b $trim- ) )
}

# enable completion for work() function using _work(), but only if `complete` exists
command -v complete && complete -o nospace -F _work work
