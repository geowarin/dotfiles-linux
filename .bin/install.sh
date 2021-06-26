#! /bin/bash

git clone --bare https://github.com/geowarin/dotfiles-linux.git "$HOME/dotfiles"
function dotfiles {
   /usr/bin/git --git-dir="$HOME/dotfiles/" --work-tree="$HOME" "$@"
}
function back {
    mkdir -p "$(dirname "$2")"
    mv "$1" "$2"
}


if ( dotfiles checkout ); then
    echo "Checked out dotfiles."
else
    echo "Backing up pre-existing dotfiles."
    dotfiles checkout 2>&1 | grep -E "\s+\." | awk '{ print $1 }' \
        | xargs -I{} bash -c 'mkdir -p ".dotfiles-backup/{}" && mv "{}" ".dotfiles-backup/{}"'
fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no
