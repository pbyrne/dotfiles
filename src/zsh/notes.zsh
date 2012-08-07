# Search current directory for comment tags, such as TODO or FIXME
notes() {
  if [ -n "$1" ]; then
    _notes_help
  else
    _notes_search
  fi
}

# Specify the notes to search for, and their order
#
# XXX is for high-priority "beware" warnings
# FIXME is for known problems to be fixed
# TODO is for longer-term, lower-priority work to be done
_notes_tags() {
  echo "XXX" "FIXME" "TODO"
}

_notes_search() {
  for tag in `_notes_tags`; do
    echo Searching for $tag
    # Output matches, or if none found, indicate this and insert a new line
    ack $tag || echo None found && echo
  done
}

_notes_help() {
  echo "Search the current directory for the following notes: `_notes_tags`"
  echo
  echo "Usage: notes"
  echo "Takes no parameters"
}
