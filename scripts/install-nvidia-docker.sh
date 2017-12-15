set -e
if nvidia-docker-plugin -v >/dev/null 2>&1; then
    echo -e "\033[32m nvidia-docker have been already installed \033[0m"
    exit 0
fi
dpkg -i nvidia-docker_1.0.1-1_amd64.deb
rm nvidia-docker_1.0.1-1_amd64.deb
nvidia-docker-plugin -v