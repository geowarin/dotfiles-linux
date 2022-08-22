# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias d="cd ~/dev"
alias dw="cd ~/dev/wip"
alias g="git"
alias h="history"
alias j="jobs"

alias ls='ls --color=auto --hyperlink=auto'
alias l="ls -lF"
alias la="ls -laF"
alias lt="l -s time"

alias grep="grep --color=auto"

if command -v hub >/dev/null 2>&1; then
	alias git="hub"
fi

if command -v bat >/dev/null 2>&1; then
	alias cat="bat"
fi

if command -v exa >/dev/null 2>&1; then
	# alias exa='LS_COLORS=" " exa'
	alias ls="exa --icons"
fi


# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# dotfiles
alias df='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias dfe='GIT_DIR=$HOME/dotfiles/ GIT_WORK_TREE=$HOME $EDITOR $HOME/.config'

alias pstree="ps --user $(id -u) f"

# IDEs
JB_TB="$HOME/.local/share/JetBrains/Toolbox/scripts"
alias idea="bgh ${JB_TB}/idea"
alias clion="bgh ${JB_TB}/clion"
alias rider="bgh ${JB_TB}/rider"
alias goland="bgh ${JB_TB}/goland"
alias pycharm="bgh ${JB_TB}/pycharm"
alias fleet="bgh ${JB_TB}/fleet"
