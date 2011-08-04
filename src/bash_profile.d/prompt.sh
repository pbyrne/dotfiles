# using the hg-prompt plugin (http://bitbucket.org/sjl/hg-prompt/)
hg_ps1() {
    hg prompt "{branch}{status}" 2> /dev/null
}

# for reference:
# \u is username
# \h is hostname
# \w is pathname
# __git_ps1 is the git prompt information
# rvm-prompt is the RVM prompt information
# $BOLD bolds text, \NC resets back to normal color
# 2> /dev/null swallows any errors
export PS1="\w \$(rvm-prompt 2> /dev/null)$BOLD\$(__git_ps1 2> /dev/null)$NC \n$ "
