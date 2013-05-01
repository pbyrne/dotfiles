# Convenience wrapper around Dash documentation lookup app
# http://kapeli.com/dash
#
# Examples:
#
#   # Look up "args" command in Vim documentation
#   dash vim:args
#   # Look up "setTimeout" across all documentation
#   dash setTimeout
function dash() {
  terms=$*
  open "dash://$terms"
}
