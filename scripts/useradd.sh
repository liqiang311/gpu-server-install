set -e
if id -u gpu >/dev/null 2>&1; then
    echo -e "\033[32m user exists \033[0m"
    exit 0
fi
useradd -s /bin/bash -mr gpu
echo gpu:gpu | chpasswd
adduser gpu sudo