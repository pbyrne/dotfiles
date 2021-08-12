functions springs() {
  ps -ef | grep -v grep | grep spring
}

function killspring() {
  while [[ -n $(springs) ]]; do
    echo "Current springs running…"
    springs

    springs | awk '{ print $2 }' | xargs -n1 kill

    echo
    sleep 2
  done

  echo "No springs running!"
}

# autocomplete for bin/deploy helper
_deploy() {
  envs=("${(@)${(f)$(grep ':$' .opsworks | tr -d :)}}")
  branches=("${(@)${(f)$(git branch | sed 's/\*/ /g')}#??}")
  _arguments "1: :($envs)" "2: :($branches)"
}

compdef _deploy deploy

_ops() {
  actions=("${(@)${(f)$(ops help | grep '  \w' | cut -d' ' -f3)}}")
  envs=("${(@)${(f)$(grep ':$' .opsworks | tr -d :)}}")

  _arguments "1: :($actions)" "2: :($envs)"
}

compdef _ops ops
