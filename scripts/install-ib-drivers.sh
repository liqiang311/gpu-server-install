set -e
if ibstat >/dev/null 2>&1; then
    echo -e "\033[32m ib drivers have been already installed \033[0m"
    exit 0
fi
tar zxf MLNX_OFED_LINUX-4.2-1.0.0.0-ubuntu14.04-x86_64.tgz
rm MLNX_OFED_LINUX-4.2-1.0.0.0-ubuntu14.04-x86_64.tgz
apt-get update -qq
apt-get install -y -qq perl dpkg autotools-dev autoconf libtool automake1.10 automake m4 dkms debhelper tcl tcl8.4 chrpath swig graphviz tcl-dev tcl8.4-dev tk-dev tk8.4-dev bison flex dpatch zlib1g-dev curl libcurl4-gnutls-dev python-libxml2 libvirt-bin libvirt0 libnl-dev libglib2.0-dev libgfortran3 automake m4 pkg-config libnuma-dev libnuma1 logrotate ethtool lsof gfortran quilt
./MLNX_OFED_LINUX-4.2-1.0.0.0-ubuntu14.04-x86_64/mlnxofedinstall --force
rm -rf MLNX_OFED_LINUX-4.2-1.0.0.0-ubuntu14.04-x86_64
/etc/init.d/openibd restart
/etc/init.d/opensmd start