source /usr/share/zsh/scripts/zplug/init.zsh

if ! zplug check; then
    zplug install
fi

zplug load
