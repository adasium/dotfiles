alias aliases="vim ~/.bash_aliases && source ~/.bash_aliases"
alias locals="vim ~/.local_aliases && source ~/.local_aliases"
alias ci3="vim ~/.config/i3/config.base && bash ~/.config/i3/i3.sh"
alias ci3l="vim ~/.config/i3/config.local && bash ~/.config/i3/i3.sh"
alias ci3s="bash ~/.config/i3/i3.sh"
alias vimrc="vim ~/.vimrc"
alias vimc="vim ~/.vim/.config"
alias pip="pip3"
alias gis="git status"
gib() {
    for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r
}
alias py='python3'
alias screenrc='vim ~/.screenrc'
alias clip='xclip -selection clipboard'
alias awe='vim ~/.config/awesome/rc.lua'
alias gimme='sudo apt install '
alias qwe='source .env/bin/activate'
alias qwer='source .venv/bin/activate'
alias .qwe='source ../.env/bin/activate'
upr() {
    uprecords -s | grep "\->" | awk '{print $2}' | xargs uprecords -m | head -n-7 | tail -n+3 | sed '$ s/->/  /; s/.\[[01]m//g; s/ ,/, /g' | LC_TIME=C sort -k 12n -k 9M -k 10n
}


alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias l='ls -FGlAhp'                        # Preferred 'ls' implementation
alias ls='ls -GFh --color=always'                          # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias lsd='ls -d */'

alias cls="printf '\033c'"
alias c="python3"

alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

if [[ "$LANG" == "en_US.UTF-8" ]] || [[ "$LANG" == "en_GB.UTF8" ]] || [[ "$LANG" == "en_US.utf8" ]]; then
    alias cdd='cd ~/Downloads'
    alias cdp='cd ~/Desktop'
else
    alias cdd='cd ~/Pobrane'
    alias cdp='cd ~/Pulpit'
fi

alias cdv='cd ~/.vim'

alias governors='cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors'
alias governor='cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor'
change_background() {
    FILE="'file://$(readlink -e "$1" )'"
    if [ "$FILE" != "'file://'" ]
    then
        gsettings set org.gnome.desktop.background picture-uri "$FILE"
    else
        echo "File doesn't exist"
    fi
}

mkcdir()
{
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

kp(){
    FILE=$1
    if [ -z ${FILE} ]; then
        echo "Tell me what you want to kill"
    fi
    PID=`ps aux | grep xbindkeys | head -n -1 | awk '{print $2}'`
    if [[ ! -z "${PID// }" ]]; then
        echo $PID
        #echo test
        kill $PID
    fi

}

if [[ -f ~/.local_aliases ]]; then
    source ~/.local_aliases
fi

################
# 3. File and folder management
##

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
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

p() {
    curl -s https://www.lexico.com/en/definition/$1 | grep "phoneticspelling.*/</span>" -o |
        sed 's#phoneticspelling">/##g' | sed 's#/</span>##g' | tr -d '\n'
}
alias r='gnome-terminal -e ranger'
alias c=python3
alias s='systemctl '
testmic() {
    arecord -f cd --buffer-time=1 - | aplay --buffer-time=1 -
}
alias apps='ls ~/.local/share/applications/* /usr/local/share/applications/* /usr/share/applications*'

diffjson() {
    executable='diff'
    if command -v 'colordiff' &> /dev/null; then
        executable='colordiff'
    fi
    $executable <(jq -S . $1) <(jq -S . $2)
}
