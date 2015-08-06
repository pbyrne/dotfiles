# List commands in history (grouped by the first two 'words', e.g., "git
# commit" or "cd ~") and ordered from most-used to least-used.
function command-frequency() {
  cut -d ';' -f 2 < ~/.history 2> /dev/null | awk '{print $1 " " $2}' | sort | uniq -c | sort -rn
}

# List the most-frequently used commands
function top-commands() {
  command-frequency | head -n 15
}

# List the most-frequently used non-Git commands
function top-non-git() {
  command-frequency | grep -v ' g ' | grep -v ' git ' | head -n 15
}
