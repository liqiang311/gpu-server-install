set -e
if ls /opt/set-gpu-fans >/dev/null 2>&1; then
    echo -e "\033[32m /opt/set-gpu-fans exists \033[0m"
    exit 0
fi
apt-get update -qq
apt-get install -y xinit tcsh
chmod +x /opt/set-gpu-fans/cool_gpu
chmod +x /opt/set-gpu-fans/nvscmd
service lightdm stop | true
nohup /opt/set-gpu-fans/cool_gpu 2>&1 > /dev/null &

sed -i 's/exit 0//g' /etc/rc.local
sed -i '/nohup \/opt\/set-gpu-fans\/cool_gpu 2>&1 > \/dev\/null &/d' /etc/rc.local
echo 'nohup /opt/set-gpu-fans/cool_gpu 2>&1 > /dev/null &' >> /etc/rc.local
echo 'exit 0' >> /etc/rc.local