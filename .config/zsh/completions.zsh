# Load compinit for completion system
# To update compinit, run 'update_compinit'
autoload -Uz compinit
compinit -C -d "$ZCOMPDUMP"

# Completion caching
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path "$ZCOMPCACHE"

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# show completion menu on successive tab press
zstyle ':completion:*:*:*:*:*' menu select

# tabtab completions (pnpm)
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# https://github.com/kenrendell/dotfiles/blob/3a72b14eed73f941adec1fbc10a42644e233b296/.config/zsh/plugins/completions.zsh
# https://github.com/ray-kast/zrc/blob/1ddebe73eb51f7631602745bd5ee82b6e4c94f5a/parts/60-completion.zsh
# https://github.com/paulmonk/dotfiles/blob/c907ba4155b283ffd7a39b4268da31808e6c0f81/zshrc