alias b='bundle'
alias be='bundle exec'

# run each spec on its own (to verify that all dependencies are set up correctly, without requiring a global require-all-files setup step
alias solospec='git ls | grep _spec.rb | while read specfile; do echo testing $specfile; bundle exec rspec $specfile; done'
# and rake
alias r='trybin rake'

function trybin() {
  local bin="$1"
  local args="$2" # optional

  if [ -z $bin ]; then
    echo 'Must provide a bin to try: `trybin foo`'
  elif [ -f "bin/$bin" ]; then
    echo bin/$bin $args
    bin/$bin "$args"
  else
    echo bundle exec $bin $args
    bundle exec $bin "$args"
  fi
}

alias ra='trybin rails'
alias rc='trybin rails console'
alias rs='trybin rails server'

