
zplug "rupa/z", use:z.sh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"

zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh

# Press esc-esc to add sudo to the previous command
zplug "hcgraf/zsh-sudo"

# Prompt
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Syntax highlighting needs to be loaded after compinit
zplug "zsh-users/zsh-syntax-highlighting", defer:2