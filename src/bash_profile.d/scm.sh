# mercurial
alias hs='hg status'
alias ha='hg add'
alias hc='hg commit -m'
alias hu='hg pull; hg update --verbose'
alias hp='hg push'
alias hdm='hg diff | mate'
alias hb='hg branch'
alias hbs='hg branches'
alias hpd='hg push && cap deploy'

# git 
alias gc='git commit -m'
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpd='git push && cap deploy'
alias gu='git pull'
alias gb='git branch'
alias gdm='git diff | mate'

# alias hub to git for awesomeness https://github.com/defunkt/hub
eval `hub alias -s bash 2> /dev/null`

# svn
alias sc='svn commit -m'
alias ss='svn status'
alias sa='svn add'
alias su='svn up'
alias sl='svn log -r HEAD:{`date -v "-27d" +%Y-%m-%d`}'
alias slm='sl | mate'
alias sr='svn diff -r {`date -v "-14d" +%Y-%m-%d`}:HEAD'
alias srm='sr | mate'
# alias svnurl="svn info | grep 'Repository Root:' | sed -e 's/Repository Root: //'"
# alias sms='svn merge `svnurl`/branches/staging -r'
# alias smt='svn merge `svnurl`/trunk -r'
