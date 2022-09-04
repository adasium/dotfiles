SCRIPT_DIR=$(dirname $(realpath -s $0))


if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
fi


if [ -z ${OS+x} ]; then
    echo "Could not detect system"
    exit 1
fi

if [[ $OS =~ "Manjaro" || $OS =~ "Arch" ]]; then
    echo "$OS"
    $SCRIPT_DIR/pacman.sh
fi
