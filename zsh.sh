parse_git_branch() {
        git symbolic-ref --short HEAD 2> /dev/null
}

NEWLINE=$'\n'
setopt PROMPT_SUBST
PROMPT='%(?.%F{green}✔%f.%F{red}✘%f) [%F{196}%T%f] %F{10}%n@labs%f:%F{111}%~%f %F{11}$(parse_git_branch)%f${NEWLINE}\$ '

alias ls="ls -G"

alias stopdocker='docker stop $(docker ps -a -q)'
alias diedocker='docker rm $(docker ps -a -q)'
alias fimdocker='stopdocker && diedocker'
alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative --all'
alias dex2jar='d2j-dex2jar'
