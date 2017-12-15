set -e
if nvidia-smi >/dev/null 2>&1; then
    echo -e "\033[32m gpu driver have been already installed \033[0m"
    exit 0
fi
dpkg -i nvidia-diag-driver-local-repo-ubuntu1404-384.81_1.0-1_amd64.deb
apt-key add /var/nvidia-diag-driver-local-repo-384.81/7fa2af80.pub
apt-get update -qq
apt-get install -y -qq cuda-drivers
nvidia-smi
rm nvidia-diag-driver-local-repo-ubuntu1404-384.81_1.0-1_amd64.deb