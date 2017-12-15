set -e
apt-get update -qq
apt-get install -y -qq tzdata
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone
ntpdate 10.30.1.105
if grep "0 0 0 0 0 ntpdate 10.30.1.105" /var/spool/cron/crontabs/root >/dev/null 2>&1; then
    echo -e "\033[32m ntpdate crontab had already set \033[0m"
    exit 0
fi
echo "0 0 0 0 0 ntpdate 10.30.1.105" >> /var/spool/cron/crontabs/root