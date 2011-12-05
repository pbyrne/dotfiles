current_git_branch() {
  git branch 2> /dev/null |
  grep '^\* ' |
  awk '{ print $2 }'
}

# `work foo` to navigate to SHARED_WORKSPACE/foo.
work() {
  dir=$(workspace)
  cd "$dir/${1}"
}

# Used by work() and _work() to determine workspace your projects live in. Set
# the SHARED_WORKSPACE environment variable if this is not ~/workspace/.
workspace() {
  result=$([ -s "$SHARED_WORKSPACE" ] && echo $SHARED_WORKSPACE || echo "~/workspace/")
  echo "$result"
}

# bash completion function for work(). Allows you to type `work f` to
# auto-complete to `work foo`, following standard Bash directory-completion
# rules.
_work() {
  local cur
  local trim
  local dir=$(workspace)
  cur=${COMP_WORDS[COMP_CWORD]}
  # length of expanded path, used to trim off first portion of matched paths below
  trim=`echo $dir/ | wc -c`
  # perform completion, returning all directories in workspace, trimming off the path to the workspace
  COMPREPLY=( $( compgen -S/ -d $dir/$cur | cut -b $trim- ) )
}

# enable completion for work() function using _work(), but only if `complete` exists
command -v complete && complete -o nospace -F _work work
