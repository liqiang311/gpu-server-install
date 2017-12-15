#!/usr/bin/bash
set -e

apt-get update -qq
apt-get install -y -qq expect

# Asia/Shanghai
bash scripts/set-time.sh
# user: gpu:gpu
bash scripts/useradd.sh
# GPU Drivers
bash scripts/install-gpu-drivers.sh
# Zabbix
bash scripts/install-zabbix.sh
# Docker
bash scripts/install-docker.sh
bash scripts/install-docker-compose.sh
bash scripts/install-nvidia-docker.sh
bash scripts/set-jfrog-cert.sh
chmod +x scripts/docker-login.sh
scripts/docker-login.sh
# IB drivers
bash scripts/install-ib-drivers.sh
# GPU-Fans daemon
bash scripts/install-set-gpu-fans.sh
# NFS
bash scripts/install-nfs.sh
# 下载镜像
bash scripts/pull-images.sh
rm -rf scripts/

echo "Install Success!"