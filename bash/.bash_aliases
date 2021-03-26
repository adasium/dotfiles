# -*- mode: shell-script -*-
if type nvim > /dev/null 2>&1; then
    alias vim="nvim"
fi
alias e="emacsclient -n "

alias aliases="vim ~/.bash_aliases && source ~/.bash_aliases"
alias locals="vim ~/.local_aliases && source ~/.local_aliases"

alias vimrc="vim ~/.vimrc"

alias gis="git status"
gib() {
    for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r
}

alias clip='xclip -selection clipboard'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

alias cls="printf '\033c'"
alias clt="cls && tmux clear-history"
alias c="python3"

alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

if [[ "${LANG:0:2}" == "en" ]]; then
    alias cdd='cd ~/Downloads'
    alias cdp='cd ~/Desktop'
    alias cdc='cd ~/Documents'
else
    alias cdd='cd ~/Pobrane'
    alias cdp='cd ~/Pulpit'
    alias cdc='cd ~/Dokumenty'
fi

mkcdir()
{
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

vlcrecord() {
    vlc \
        --no-video-deco \
        --no-embedded-video \
        --screen-fps=20 \
        --screen-top=0 \
        --screen-left=1376 \
        --screen-width=1920 \
        --screen-height=1000 \
        screen://

}

testmic() {
    arecord -f cd --buffer-time=1 - | aplay --buffer-time=1 -
}

alias apps='find ~/.local/share/applications/ /usr/local/share/applications/ /usr/share/applications/ -iname "*.desktop" -print0 | xargs -0 ls -db'

diffjson() {
    executable='diff'
    if command -v 'colordiff' &> /dev/null; then
        executable='colordiff'
    fi
    $executable <(jq -S . $1) <(jq -S . $2)
}

color() {
	  grep -E --color=always "$1|$"
}

alias again='pip install --upgrade pip'

if [[ -f ~/.local_aliases ]]; then
    source ~/.local_aliases
fi
alias urldecode='python3 -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read()), end=\"\");"'

function brek () {
    cls && echo "SMOL BREK\n$1 minutes" | cowsay && sowon -p
}
