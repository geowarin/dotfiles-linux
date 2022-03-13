# Use emacs key bindings
bindkey -e

# add / to wordchars for ctrl+left/right
WORDCHARS=$WORDCHARS:s:/:

# [PageUp] - Up a line of history
bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
# [PageDown] - Down a line of history
bindkey -M emacs "${terminfo[knp]}" down-line-or-history

# Start typing + [Up-Arrow] - fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
# Start typing + [Down-Arrow] - fuzzy find history backward
bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search

# [Home] - Go to beginning of line
bindkey -M emacs "${terminfo[khome]}" beginning-of-line
# [End] - Go to end of line
bindkey -M emacs "${terminfo[kend]}"  end-of-line

# [Shift-Tab] - move through the completion menu backwards
bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
# [Delete] - delete forward
bindkey -M emacs "${terminfo[kdch1]}" delete-char

# [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[3;5~' kill-word
# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# file rename magick
bindkey "^[m" copy-prev-shell-word