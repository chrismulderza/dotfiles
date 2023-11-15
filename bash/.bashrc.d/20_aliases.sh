alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias open='xdg-open'
alias firewall-public='firewall-cmd --zone=public --change-interface=wlp0s20f3'
alias firewall-default='firewall-cmd --zone=FedoraWorkstation --change-interface=wlp0s20f3'
alias weather='curl https://wttr.in/Johannesburg+South+Africa'
alias spot-like='spt pb --like'
alias spot-play-pause='spt pb --toggle'
alias spot-play-discover='spt play --playlist --name "Discover Weekly"'

# custom tools

alias bookmarks='~/bin/bookmarks.sh'
alias fof='~/bin/fof.sh'
