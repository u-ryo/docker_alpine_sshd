FROM alpine:latest
MAINTAINER uryooo@gmail.com
ENV GITHUB_USER u-ryo
EXPOSE 22 8080 80 443 9000
RUN apk update && apk add --no-cache openssh
RUN passwd -d root
# RUN echo 'root:root' |chpasswd
# RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
## RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN adduser -D -s /bin/ash ${GITHUB_USER}
RUN passwd -u ${GITHUB_USER}
ADD https://github.com/${GITHUB_USER}.keys /home/${GITHUB_USER}/.ssh/authorized_keys
RUN chown -R ${GITHUB_USER}:${GITHUB_USER} /home/${GITHUB_USER}
RUN ssh-keygen -A
CMD /usr/sbin/sshd -D -e "$@"