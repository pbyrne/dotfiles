current_git_branch() {
  git branch 2> /dev/null |
  grep '^\* ' |
  awk '{ print $2 }'
}
