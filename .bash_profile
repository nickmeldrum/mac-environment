# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

alias g="git"

function execline() {
    sed -n $1p $2 | source /dev/stdin
}

function acg() {
    git add .
    git commit -v -m "$1"
}

function log() {
    if [ "$#" -ne 1 ]; then
        length=5
    else
        length=$1
    fi

    git --no-pager log -$length --pretty=format:'%C(yellow)%h %Cred%ad %C(yellow)%an%Cgreen%d %Creset%s' --date=short
}

function cheat() {
    cat ~/src/mac-environment/bash-cheatsheet.md
}

cheat
