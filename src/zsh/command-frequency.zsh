# List commands in history (grouped by the first two 'words', e.g., "git
# commit" or "cd ~") and orderd from most-used to least-used.
function command-frequency() {
  # LC_CTYPE=C LANG=C causes cut to not fall down on control characters ending up in .history
  # http://stackoverflow.com/questions/19242275/re-error-illegal-byte-sequence-on-mac-os-x
  LC_CTYPE=C LANG=C cut -d ';' -f 2 < ~/.history 2> /dev/null | awk '{print $1 " " $2}' | sort | uniq -c | sort -rn
}

# List the most-frequently used commands
function top-commands() {
  command-frequency | head -n 15
}

# List the most-frequently used non-Git commands
function top-non-git() {
  command-frequency | grep -v ' g ' | grep -v ' git ' | head -n 15
}
