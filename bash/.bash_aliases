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

apps() {
    desktop_file_dirs=(
        "$HOME/.local/share/applications/"
        "/usr/local/share/applications/"
        "/usr/share/applications/"
    )
    for dir in ${desktop_file_dirs[@]}; do
        if [ ! -d $dir ]; then
            desktop_file_dirs=(${desktop_file_dirs[@]/$dir})
        fi
    done
    find ${desktop_file_dirs[@]} -iname "*.desktop" -print0 | xargs -0 ls -db
}

alias first='head -n 1'

unlink () {
    while read line
    do
        readlink -f "$line"
    done < "${1:-/dev/stdin}"
}

recodeifneeded() {
    for file in *; do
        if enca -p -L polish $file | grep -q UTF; then
            echo "$file is already UTF"
        else
            echo "converting $file"
            recode windows-1250..utf-8 $file
        fi
    done
}

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

alias trim="sed -e 's/^ *//' -e 's/ *$//'"
alias open='xdg-open'
