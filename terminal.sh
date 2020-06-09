# PS1="[\[$(tput sgr0)\]\[\033[38;5;9m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\]] ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@labs\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

function Color() {
  echo "\[$(tput setaf $1)\]"
}
function ResetColor() {
  echo "\[$(tput sgr0)\]"
}

function BashPrompt() {
    local last_status=$?
    local reset=$(ResetColor)

    local failure="✘"
    local success="✔"

    if [[ "$last_status" != "0" ]]; then
        last_status="$(Color 5)$failure$reset"
    else
        last_status="$(Color 2)$success$reset"
    fi

    echo "$last_status"
}


alias ls="ls -G"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT_COMMAND='PS1="$(BashPrompt) [\[$(tput sgr0)\]\[\033[38;5;9m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\]] ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@labs\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\[\033[00m\]\n\$ "'

alias stopdocker='docker stop $(docker ps -a -q)'
alias diedocker='docker rm $(docker ps -a -q)'
alias fimdocker='stopdocker && diedocker'
alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative --all'
alias dex2jar='d2j-dex2jar'
