if [ -n "$PS1" ]; then

    export LANG=en_US.UTF-8
    export TERM=xterm-256color

    export PATH=$HOME/.dotfiles/bin/:$HOME/.gem/ruby/2.0.0/bin:$PATH

    export PASSBOX_LOCATION=$HOME/Dropbox/.passwords.gpg

    for file in $HOME/.dotfiles/includes/*.sh; do
        [ -r "$file" ] && source "$file"
    done
    unset file

    # Set SSH authentication socket location
    SOCK="/tmp/ssh-agent-$USER-screen"
    if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
    then
        rm -f /tmp/ssh-agent-$USER-screen
        ln -sf $SSH_AUTH_SOCK $SOCK
        export SSH_AUTH_SOCK=$SOCK
    fi

    # Setup git completion for its alias
    __git_complete g __git_main

    # http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html

    # Case-insensitive globbing (used in pathname expansion)
    shopt -s nocaseglob

    # Append to the Bash history file, rather than overwriting it
    shopt -s histappend

    # Autocorrect typos in path names when using `cd`
    shopt -s cdspell

    # Save all lines of a multiple-line command in the same history entry (allows easy re-editing of multi-line commands)
    shopt -s cmdhist

    # Don't autocomplete when accidentally pressing Tab on an empty line. (It takes forever and yields "Display all 15 gazillion possibilites?")
    shopt -s no_empty_cmd_completion

    # Enable some Bash 4 features when possible:
    # * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
    # * Recursive globbing, e.g. `echo **/*.txt`
    # for option in autocd globstar; do
    #   shopt -s "$option" 2> /dev/null
    # done

    # Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
    [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | awk '{print $2}')" scp sftp ssh

    # Add `killall` tab completion for common apps
    complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes Terminal" killall

    # If possible, add tab completion for many more commands
    # [ -f /etc/bash_completion ] && source /etc/bash_completion

    # Make fzf to use git ls-tree when available
    export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//) 2> /dev/null'

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
gcmt (){ local br=$(gbn); git commit -m "$br: $1"; }
alias gbdo='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias jira='open https://jira.mail.ru/browse/$(parse_git_branch_name)'

export BASH_SILENCE_DEPRECATION_WARNING=1
