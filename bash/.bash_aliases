# -*- mode: shell-script -*-
if command -v 'nvim' &> /dev/null; then
    alias vim="nvim"
fi
alias e="emacsclient -n "

alias aliases="vim ~/.bash_aliases && source ~/.bash_aliases"
alias reload="source ~/.bash_aliases"
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
alias ..6="cd ../../../../../.."
alias ..7="cd ../../../../../../.."

if [[ "${LANG:0:2}" == "pl" ]]; then
    alias cdd='cd ~/Pobrane'
    alias cdp='cd ~/Pulpit'
    alias cdc='cd ~/Dokumenty'
else
    alias cdd='cd ~/Downloads'
    alias cdp='cd ~/Desktop'
    alias cdc='cd ~/Documents'
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
alias please='sudo'

rf() {
    if [ "$#" -ne 1 ]; then
        rg --files
    else
        rg --files | rg $@
    fi
}
alias rgv='rg --vimgrep --color=auto'
alias rgfile="awk -F ':' '{print \$1}'"

mark() {
    if [ "$#" -ne 1 ]; then
        cat
    else
        rg "$@|$"
    fi
}
alias colour=mark

nth() {
    if [ "$#" -ne 1 ]; then
        cat
    else
        head -n $1 | tail -n 1
    fi
}

lower() {
    tr '[:upper:]' '[:lower:]'
}

upper() {
    tr '[:lower:]' '[:upper:]'
}

prepend() {
    if [ "$#" -ne 1 ]; then
        cat
    else
        sed -e "s/^/$1/"
    fi
}

setmem() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: setmem <name>"
    else
        mkdir -p /tmp/.mem
        echo "setmem: $1"
        clip -o > /tmp/.mem/$1
    fi
}
getmem() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: getmem <name>"
        echo "Available mems:"
        ls /tmp/.mem
    else
        cat /tmp/.mem/$1
    fi
}

nicehtml() {
    tidy -q -i -utf8 -w 0 -asxml -xml -indent --indent-spaces 4 -wrap 0 -c -f /dev/stdout
}

open() {
    filename="$1"
    extension="${1##*.}"
    filename_no_ext="${1%.*}"

    # if -e or --explorer is passed as second argument, open the file in nemo
    if [ "$2" = "-e" ] || [ "$2" = "--explorer" ]; then
        nemo "$filename"
        return
    fi

    echo "$extension: $filename_no_ext"
    if [ "$extension" = "dot" ]; then
        echo "$1 -> $filename_no_ext.svg"
        echo "Opening with `xdg-open`"
        dot -Tsvg $1 -o "$filename_no_ext.svg" && xdg-open "$filename_no_ext.svg"
    elif [ "$extension" = "svg" ]; then
        display $filename
        echo "Opening with `display` (imagemagick)"
    elif [ "$extension" = "mp4" ]; then
        mpv --really-quiet $filename
    else
        echo "$extension: No dedicated program"
    fi
}
alias synctime='sudo ntpdate -u 0.europe.pool.ntp.org'

# https://askubuntu.com/a/620142
alias lh='ls -Ad .??*'

t() {
    mkdir t
    pushd t > /dev/null
    touch t.py
    virtualenv .venv --python python3.8 > /dev/null
    source .venv/bin/activate
    ll
}

regex() {
    python -c "import re, sys; print(\"\\n\".join([group for match in re.finditer(\"$1\", sys.stdin.read(), re.MULTILINE) for group in match.groups()]))"
}
alias seba='source .venv/bin/activate'

alias remote='x11vnc -repeat -forever -nomodtweak -remap less-comma -display :0'

alias bak='bak_func'
bak_func() {
    local copy_flag=false
    local source_files=()

    while [ $# -gt 0 ]; do
        case "$1" in
            --copy|-c)
                copy_flag=true
                shift
                ;;
            *)
                source_files+=("$1")
                shift
                ;;
        esac
    done

    if [ "${#source_files[@]}" -eq 0 ]; then
        echo "Usage: bak [--copy|-c] <filename(s)>"
        return 1
    fi

    for source_file in "${source_files[@]}"; do
        destination_file="${source_file}.bak"

        if [ "$copy_flag" = true ]; then
            cp "$source_file" "$destination_file"
            echo "Copied $source_file to $destination_file"
        else
            mv "$source_file" "$destination_file"
            echo "Renamed $source_file to $destination_file"
        fi
    done
}

alias unbak='unbak_func'
unbak_func() {
    local copy_flag=false
    local source_files=()

    while [ $# -gt 0 ]; do
        case "$1" in
            --copy|-c)
                copy_flag=true
                shift
                ;;
            *)
                source_files+=("$1")
                shift
                ;;
        esac
    done

    if [ "${#source_files[@]}" -eq 0 ]; then
        echo "Usage: unbak [--copy|-c] <filename(s)>"
        return 1
    fi

    for source_file in "${source_files[@]}"; do
        if [[ "$source_file" =~ \.bak$ ]]; then
            destination_file="${source_file%.bak}"

            if [ -e "$destination_file" ]; then
                echo "Error: Destination file '$destination_file' already exists. Skipping '$source_file'."
            else
                if [ "$copy_flag" = true ]; then
                    cp "$source_file" "$destination_file"
                    echo "Restored (copied) $source_file to $destination_file"
                else
                    mv "$source_file" "$destination_file"
                    echo "Restored $source_file to $destination_file"
                fi
            fi
        else
            echo "Error: '$source_file' doesn't seem to be a valid backup file. Skipping."
        fi
    done
}

alias mirrors-drop-caches='sudo paccache -rk3; yay -Sc --aur --noconfirm'
alias mirrors-update-all='export TMPFILE="$(mktemp)"; \
    sudo true; \
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && mirrors-drop-caches \
      && yay -Syyu --noconfirm'

