#!/bin/bash
if ls /mnt/bigdata60/public_data >/dev/null 2>&1; then
    echo -e "\033[32m /mnt/bigdata60 has already mounted \033[0m"
    exit 0
fi

#安装nfs客户端
apt-get update -qq
apt-get install -y -qq nfs-common

#新建挂载点目录: /mnt/bigdata60
mkdir -p /mnt/bigdata60

#挂载nfs目录
mount -t nfs 10.42.10.60:/mnt/bigdata /mnt/bigdata60 -o nolock | true

#新增开机自动挂载
sed -i 's/exit 0//g' /etc/rc.local
#删除已存在
sed -i '/sudo mount -t nfs 10.42.10.60:\/mnt\/bigdata \/mnt\/bigdata60 -o nolock/d' /etc/rc.local
#新增
echo 'sudo mount -t nfs 10.42.10.60:/mnt/bigdata /mnt/bigdata60 -o nolock' >> /etc/rc.local
echo 'exit 0' >> /etc/rc.local