
FZF_PATH=/usr/share/fzf

# Setup fzf
# ---------
if [[ ! "$PATH" == *$FZF_PATH/bin* ]]; then
  export PATH="$PATH:$FZF_PATH/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *$FZF_PATH/man* && -d "$FZF_PATH/man" ]]; then
  export MANPATH="$MANPATH:$FZF_PATH/man"
fi

# Auto-completion
# ---------------

[[ $- == *i* ]] && source "$FZF_PATH/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$FZF_PATH/key-bindings.zsh"
