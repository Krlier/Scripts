parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

emoji() {
        if [ $? == 0 ]
        then
                echo ✅
        else
                echo ❌
        fi
}

export CLICOLOR=1
export PS1="\$(emoji)\[\033[38;5;9m\][\A]\[$(tput sgr0)\]\[\033[38;5;10m\]\u@Labs\[$(tput sgr0)\]\[\033[38;5;12m\]:\w\[$(tput sgr0)\]\[\033[38;5;15m\]\$(parse_git_branch)\n\\$ \[$(tput sgr0)\]"
