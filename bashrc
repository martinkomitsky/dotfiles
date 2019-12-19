# vim: ft=sh

export DOTFILES_PATH="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"

export LANG=en_US.UTF-8
export PATH=$DOTFILES_PATH/bin/:$HOME/.yarn/bin:$PATH

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

# GNU grep and ls
export PATH=/usr/local/opt/grep/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH

# Set SSH authentication socket location
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

# User specific aliases and functions
alias cdf='cd ~/.www/frontend'
alias gpd='git pull origin devel'
alias gpm='git pull origin master'
alias gpr='git pull origin release'
alias gbn='git branch | grep \* | cut -d " " -f2'
alias gbn2='git symbolic-ref --short HEAD'
alias aaa='git commit -am "$(gbn): $@"'

gct (){ local br=$(gbn); git commit -am "$br: $1"; }
alias gbdo='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias jira='open https://jira.mail.ru/browse/$(parse_git_branch_name)'
