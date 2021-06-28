export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

export PATH="${PATH}:${HOME}/.bin"

export HISTFILE="$XDG_DATA_HOME/zsh/history"
if [ ! -d $(dirname $HISTFILE) ]; then mkdir -p $(dirname $HISTFILE); fi

export HISTSIZE=10000
export SAVEHIST=10000

export ZCOMPDUMP=$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
if [ ! -d $(dirname $ZCOMPDUMP) ]; then mkdir -p $(dirname $ZCOMPDUMP); fi

export EDITOR=code
#export TERM=kitty
export PAGER=less

export _Z_DATA="$XDG_DATA_HOME"/z/data
if [ ! -d $(dirname $_Z_DATA) ]; then mkdir -p $(dirname $_Z_DATA); fi

export ZPLUG_LOADFILE="$XDG_CONFIG_HOME/zsh/plugins.zsh"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh