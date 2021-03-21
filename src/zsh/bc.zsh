alias bc='bc -lq'

function calc() {
  echo "$*" | bc
}
export BC_ENV_ARGS=$HOME/.bc
