# i3 tricks

## Focus or launch

(i3-msg "[title=Testing] focus" 2>&1 | grep -q  false) && termite -t Testing &