#!/usr/bin/env bash
function yay_install_needed1 {
    yay -S --noconfirm $(yay -Qi $@ 2>&1 >/dev/null | grep "error: package" | grep "was not found" | cut -d"'" -f2 | tr "\n" " ")
}

editors=(
    vim
    emacs
    gedit
)
emacs_dependencies=(
    hunspell
    hunspell-{pl,en_{us,gb},de}
    npm
    ripgrep
)
python_dependencies=(
    pyenv
)
other=(
    ark
    dolphin
    syncthing
)
util_packages=(
    fzf
    tldr
    tmux
    stow
    recode
    enca
    jq
    colordiff
    xclip
    colordiff
    flameshot
    #texlive-most
    docker
    docker-compose
    pdftk
    cups
)
fonts_icons=(
    papirus-icon-theme
    ttf-fira-code
    # noto
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
)
yay_fonts=(
    ttf-mononoki
)
yay_other=(
    # xow  # seems to fail (2021-10-24)
    jdk-openjdk
    dive  # inspecting docker images
    spotify
)
# zusammen
pacman_all=(
    "${emacs_dependencies[@]}"
    "${python_dependencies[@]}"
    "${other[@]}"
    "${util_packages[@]}"
    "${fonts_icons[@]}"
    "${editors[@]}"
)
yay_all=( "${yay_fonts[@]}" "${yay_other[@]}")

if ! command -v yay &> /dev/null
then
    sudo pacman -S --needed --noconfirm git base-devel
    mkdir -p /tmp/yay
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si
fi


# install
sudo pacman -S --needed --noconfirm "${pacman_all[@]}"

for package in "${yay_all[@]}"; do
    yay_install_needed1 $package
done

fc-cache -f

if ! pacman -Qi pipewire > /dev/null; then
    sudo pacman -Rdd pulseaudio
    sudo pacman -S --needed --noconfirm pipewire pipewire-pulse
fi
