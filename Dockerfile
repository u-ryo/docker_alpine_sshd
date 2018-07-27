FROM alpine:latest
MAINTAINER uryooo@gmail.com
ENV GITHUB_USER u-ryo
EXPOSE 80 22
RUN set -x \
    && apk update && apk add --update --no-cache openssh sudo screen libstdc++ curl ca-certificates nginx\
    && sed -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' -i /etc/sudoers \
    && passwd -d root \
    && adduser -D -s /bin/ash ${GITHUB_USER} \
    && passwd -u ${GITHUB_USER} \
    && addgroup ${GITHUB_USER} wheel \
    && mkdir -p /home/${GITHUB_USER}/.ssh/ \
    && curl -s -o /home/${GITHUB_USER}/.ssh/authorized_keys https://github.com/${GITHUB_USER}.keys \
    && chown -R ${GITHUB_USER}:${GITHUB_USER} /home/${GITHUB_USER} \
    && ssh-keygen -A \
    && mkdir -p /run/nginx \
    && sed -i 's|\treturn 404|\tproxy_pass http://walt.mydns.bz:10022/|g' /etc/nginx/conf.d/default.conf \
    && /usr/sbin/nginx \
    && update-ca-certificates

CMD /usr/sbin/sshd -D -e "$@"