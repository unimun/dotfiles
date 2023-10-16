# zshenv for macOS and Ubuntu

# System defaults
# ---------------------------------------------------------------------
[ -z ${PLATFORM+x} ] && export PLATFORM=$(uname -s)

# Options
# ---------------------------------------------------------------------
### Disable CTRL-S and CTRL-O
[[ $- =~ i ]] && stty -ixoff -ixon

# Environment variables
# ---------------------------------------------------------------------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
#export LC_ALL=ko_KR.UTF-8

### Global
export GPG_TTY=$(tty)
GOROOT=~/.goroot
GOPATH=~/go
if [ -d $GOROOT ]; then
    export GOROOT
    export GOPATH
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
    export GO111MODULE=on
fi

export PATH=~/bin:$PATH
if [ "$PLATFORM" = 'Darwin' ]; then
    export EDITOR=nvim
else
    export EDITOR=nvim
fi

# Aliases
# ---------------------------------------------------------------------
alias cd.='cd ..'
alias cd..='cd ..'
alias vim=$EDITOR
alias vi=$EDITOR

### Tmux
alias tmux="tmux -2"

CUSTOM_ENV=~/.config/zsh/my_zshenv
if [[ -f "$CUSTOM_ENV" ]]; then
    source ~/.config/zsh/my_zshenv
fi
