functions springs() {
  ps -ef | grep -v grep | grep spring
}

function killspring() {
  echo "Starting with these springs…"
  springs || echo "None"

  echo "Killing those springs…"
  springs | awk '{ print $2 }' | xargs -n1 kill
  sleep 1

  echo "Now we have these springs…"
  springs || echo "None"
}

# autocomplete for bin/deploy helper
_deploy() {
  envs=("${(@)${(f)$(grep ':$' .opsicle | tr -d :)}}")
  branches=("${(@)${(f)$(git branch | sed 's/\*/ /g')}#??}")
  _arguments "1: :($envs)" "2: :($branches)"
}

compdef _deploy deploy

_opsicle() {
  actions=("chef-update instances ssh")
  envs=("${(@)${(f)$(grep ':$' .opsicle | tr -d :)}}")

  _arguments "1: :($actions)" "2: :($envs)"
}

compdef _opsicle opsicle
