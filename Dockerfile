FROM alpine:latest
MAINTAINER uryooo@gmail.com
ENV USER user
EXPOSE 22 8080 80 443 9000
RUN apk update && apk add --no-cache openssh
# RUN passwd -d root
RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN adduser -D -s /bin/ash ${USER}
RUN passwd -u ${USER}
RUN chown -R ${USER}:${USER} /home/${USER}
RUN ssh-keygen -A
ADD https://github.com/${USER}.keys /home/${USER}/.ssh/authorized_keys
CMD /usr/sbin/sshd -D -e "$@"