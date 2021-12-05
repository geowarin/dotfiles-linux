
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
	pacman -Qq | fzf -q "${@:-}" --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'
}

# list all packages and installs selected
pacfind () {
	paru -Sl | fzf -q "${@:-}" --multi --preview 'paru -Si {2}' | cut -d " " -f 2 | xargs -ro paru -S
}

# list all packages and removes selected
pacremove() {
	pacman -Qq | fzf -q "${@:-}" -m --preview "pacman -Qil {}" --layout=reverse  | xargs -ro sudo pacman -Rsn
}

# launch http server
server() {
	local dir="${1:-.}";
	local port="${2:-9000}";
	sleep 1 && firefox --new-window "http://localhost:${port}" &
	python -m http.server "${port}" --directory "${dir}"
}

# pacman

# List orphan
# pacman -Qtdq

# Remove orphans
# pacman -Qtdq | pacman -Rns -

# save pkglist
# pacman -Qqen > pkglist.txt
# pacman -Qqem > pkglist_aur.txt