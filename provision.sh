#!/bin/sh
set -x

export DEBIAN_FRONTEND=noninteractive
sed -i 's/us.archive.ubuntu.com/nl.archive.ubuntu.com/g' /etc/apt/sources.list
apt-get update
apt-get dist-upgrade -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y
apt-get autoremove --purge -y
apt-get install --download-only -y -t trusty-backports lxc
apt-get install -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y bridge-utils libc6 dnsmasq locales ca-certificates rsync cron redir ruby-dev build-essential
apt-get install -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y -t trusty-backports lxc
CURRENT_HOSTNAME=$(hostname)
echo "127.0.0.1 localhost ${CURRENT_HOSTNAME}" > /etc/hosts

invoke-rc.d apparmor stop
update-rc.d -f apparmor remove

cp /vagrant/lxc-net /etc/init.d/lxc-net
chmod 755 /etc/init.d/lxc-net
service lxc-net restart
update-rc.d lxc-net defaults

locale-gen --purge en_US.UTF-8
/bin/echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale
