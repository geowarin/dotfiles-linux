
# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

function touch() {
	mkdir -p "$(dirname "$1")" && /usr/bin/touch "$1"
}

# run in background and detach
bgh() { 
	"$@" &>/dev/null &!
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

pacnew() {
	#find /etc -regextype posix-extended -regex ".+\.pac(new|save)" 2> /dev/null
	fd ".+\.pac(new|save)" /etc 2> /dev/null
}

# requires aur/p3wm
pacmerge() {
	tomerge=$(pacnew | fzf)
	sudo p3wm "$tomerge"
}

whoneeds() {
	comm -12 <(pactree -lru $1|sort) <(pacman -Qqe|sort) | grep -v $1
}

# launch http server
server() {
	local dir="${1:-.}";
	local port="${2:-9000}";
	sleep 1 && firefox --new-window "http://localhost:${port}" &
	python -m http.server "${port}" --directory "${dir}"
}

# Downloads a site completely with wget
function dlsite() {
	wget --mirror --convert-links --adjust-extension --page-requisites -U Mozilla --no-parent -e robots=off --wait=3 --random-wait --limit-rate=900k --no-check-certificate $@
}

# Update compinit
update_compinit() {
	command rm -rf "$ZCOMPDUMP"
	compinit -i -d "$ZCOMPDUMP"
}

# pacman

# List orphan
# pacman -Qtdq

# Remove orphans
# pacman -Qtdq | pacman -Rns -

# save pkglist
# pacman -Qqen > pkglist.txt
# pacman -Qqem > pkglist_aur.txt