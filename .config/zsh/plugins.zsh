
zplug "rupa/z", use:z.sh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"

# requires pkgfile
zplug "plugins/command-not-found", from:oh-my-zsh

# Press esc-esc to add sudo to the previous command
zplug "hcgraf/zsh-sudo"

# Syntax highlighting needs to be loaded after compinit
zplug "zsh-users/zsh-syntax-highlighting", defer:2