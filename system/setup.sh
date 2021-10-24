if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
fi


if [ -z ${OS+x} ]; then
    echo "Could not detect system"
    exit 1
fi

if [[ $OS =~ "Manjaro" ]]; then
    echo "$OS"
    ./pacman.sh
fi
