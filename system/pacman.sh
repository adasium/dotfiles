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
    hunspell-{pl,en_{us,gb},de}
    npm
    ripgrep
)
python_dependencies=(
    pyenv
)
util_packages=(
    fzf
    tldr
    tmux
    stow
    recode
    enca
    jq
    xclip
    colordiff
    flameshot
    texlive-most
)
fonts=(
    ttf-fira-code
)
yay_fonts=(
    ttf-mononoki
)
yay_other=(
    # xow  # seems to fail (2021-10-24)
    jdk-openjdk
    spotify
)
# zusammen
pacman_all=(
    "${emacs_dependencies[@]}"
    "${python_dependencies[@]}"
    "${util_packages[@]}"
    "${fonts[@]}"
    "${editors[@]}"
)
yay_all=( "${yay_fonts[@]}" "${yay_other[@]}")

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
