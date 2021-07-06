
# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# run in background and detach
bgh() { 
	"$@" &>/dev/null & 
}

# list installed packages
pacls() {
	pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'
}

# list all packages and installs selected
pacfind () {
	paru -Sl | fzf --multi --preview 'paru -Si {2}' | cut -d " " -f 2 | xargs -ro paru -S
}

# list all packages and removes selected
pacremove() {
	pacman -Qq | fzf -m --preview "pacman -Qil {}" --layout=reverse  | xargs -ro sudo pacman -Rsn
}
