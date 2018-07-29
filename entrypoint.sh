#!/bin/sh
set -e
if [ !${GITHUB_USER} ]; then
    GITHUB_USER=u-ryo
fi

adduser -D -s /bin/ash ${GITHUB_USER}
passwd -u ${GITHUB_USER}
addgroup ${GITHUB_USER} wheel
mkdir -p /home/${GITHUB_USER}/.ssh/ \
wget -q -O /home/${GITHUB_USER}/.ssh/authorized_keys https://github.com/${GITHUB_USER}.keys
chown -R ${GITHUB_USER}:${GITHUB_USER} /home/${GITHUB_USER}

if [ !${PROXY_PASS} ]; then
    PROXY_PASS=http://google.com
fi

sed -i 's|\treturn 404|\tproxy_pass '${PROXY_PASS}'|g' /etc/nginx/conf.d/default.conf

/usr/sbin/nginx
/usr/sbin/sshd
tail -f /var/log/nginx/access.log
