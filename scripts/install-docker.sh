set -e
if docker --version >/dev/null 2>&1; then
    echo -e "\033[32m docker have been already installed \033[0m"
    exit 0
fi
apt-get remove docker docker-engine docker.io
apt-get update
apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce
docker --version