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
