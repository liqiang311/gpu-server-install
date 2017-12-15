set -e
if ls /etc/zabbix >/dev/null 2>&1; then
    echo -e "\033[32m /etc/zabbix exists \033[0m"
    exit 0
fi
apt-get update -qq
apt-get install -y -qq zabbix-agent lm-sensors
sed -i 's/^Server=127.0.0.1/Server=10.42.10.39/g' /etc/zabbix/zabbix_agentd.conf
sed -i 's/^ServerActive=127.0.0.1/ServerActive=10.42.10.39:10051/g' /etc/zabbix/zabbix_agentd.conf
echo "UserParameter=cpu0.temp, sensors coretemp-isa-0000|grep Physical|awk '{print \$4}'|cut -d \".\" -f1" >> /etc/zabbix/zabbix_agentd.conf
echo "UserParameter=cpu1.temp, sensors coretemp-isa-0001|grep Physical|awk '{print \$4}'|cut -d \".\" -f1" >> /etc/zabbix/zabbix_agentd.conf
echo "UserParameter=gpu0.temp, nvidia-smi -q -g 0 2>&1|grep -i \"gpu current temp\"|awk '{print \$5}'| sed s/\%//g" >> /etc/zabbix/zabbix_agentd.conf
echo "UserParameter=gpu1.temp, nvidia-smi -q -g 1 2>&1|grep -i \"gpu current temp\"|awk '{print \$5}'| sed s/\%//g" >> /etc/zabbix/zabbix_agentd.conf
echo "UserParameter=gpu2.temp, nvidia-smi -q -g 2 2>&1|grep -i \"gpu current temp\"|awk '{print \$5}'| sed s/\%//g" >> /etc/zabbix/zabbix_agentd.conf
echo "UserParameter=gpu3.temp, nvidia-smi -q -g 3 2>&1|grep -i \"gpu current temp\"|awk '{print \$5}'| sed s/\%//g" >> /etc/zabbix/zabbix_agentd.conf
echo "UserParameter=gpu4.temp, nvidia-smi -q -g 4 2>&1|grep -i \"gpu current temp\"|awk '{print \$5}'| sed s/\%//g" >> /etc/zabbix/zabbix_agentd.conf
echo "UserParameter=gpu5.temp, nvidia-smi -q -g 5 2>&1|grep -i \"gpu current temp\"|awk '{print \$5}'| sed s/\%//g" >> /etc/zabbix/zabbix_agentd.conf
echo "UserParameter=gpu6.temp, nvidia-smi -q -g 6 2>&1|grep -i \"gpu current temp\"|awk '{print \$5}'| sed s/\%//g" >> /etc/zabbix/zabbix_agentd.conf
echo "UserParameter=gpu7.temp, nvidia-smi -q -g 7 2>&1|grep -i \"gpu current temp\"|awk '{print \$5}'| sed s/\%//g" >> /etc/zabbix/zabbix_agentd.conf
service zabbix-agent restart