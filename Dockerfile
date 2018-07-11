FROM alpine:latest
MAINTAINER uryooo@gmail.com
ENV USER user
EXPOSE 22 8080 80 443 9000
RUN apk update && apk add --no-cache openssh
RUN passwd -d root && adduser -D -s /bin/ash ${USER} && passwd -u ${USER} && chown -R ${USER}/${USER} /home/${USER} && ssh-keygen -A
ADD https://github.com/${USER}.keys /home/${USER}/.ssh/authorized_keys
CMD /usr/sbin/sshd -D -e "$@"