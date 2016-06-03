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

function create-github-repo() {
    if [ "$#" -ne 1 ]; then
        echo "please pass in a repo name"
        return
    fi

    TOKEN="$(security 2>&1 >/dev/null find-generic-password -ga github-token | awk -F'"' '{ print $2 }')"
    curl "https://api.github.com/user/repos?access_token=${TOKEN}" -d "{\"name\":\"${1}\"}" -v
    git remote rm origin
    git remote add origin "https://github.com/nickmeldrum/${1}.git"
    git push -u origin --all
    git push -u origin --tags
}

cheat
