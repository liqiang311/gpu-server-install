set -e
if docker-compose --version >/dev/null 2>&1; then
    echo -e "\033[32m docker-comose have been already installed \033[0m"
    exit 0
fi
mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version