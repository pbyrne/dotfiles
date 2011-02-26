# using the hg-prompt plugin (http://bitbucket.org/sjl/hg-prompt/)
hg_ps1() {
    hg prompt "{branch}{status}" 2> /dev/null
}


export PS1="\u @ \h in \w $BOLD\$(hg_ps1)$NC \n$ "
