FROM alpine:latest
MAINTAINER uryooo@gmail.com
ENV GITHUB_USER u-ryo
EXPOSE 22 8080 80 443 9000
RUN set -x \
    && apk update && apk add --update --no-cache openssh sudo screen nodejs-npm libstdc++ curl ca-certificates bash zip unzip openssl openjdk8 gradle git mysql yarn \
    && sed -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' -i /etc/sudoers \
    && passwd -d root \
    && adduser -D -s /bin/bash ${GITHUB_USER} \
    && passwd -u ${GITHUB_USER} \
    && addgroup ${GITHUB_USER} wheel \
    && mkdir -p /home/${GITHUB_USER}/.ssh/ \
    && curl -s -o /home/${GITHUB_USER}/.ssh/authorized_keys https://github.com/${GITHUB_USER}.keys \
    && chown -R ${GITHUB_USER}:${GITHUB_USER} /home/${GITHUB_USER} \
    && ssh-keygen -A \
    && update-ca-certificates
#    && npm i -g npm \
#    && npm i -g yarn \
#    && npm i -g generator-jhipster
# RUN echo 'root:root' |chpasswd
# RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
## RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

CMD /usr/sbin/sshd -D -e "$@"