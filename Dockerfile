FROM alpine:latest
MAINTAINER uryooo@gmail.com
EXPOSE 80 22
RUN set -x \
    && apk update && apk add --update --no-cache openssh sudo screen ca-certificates nginx\
    && sed -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' -i /etc/sudoers \
    && passwd -d root \
    && ssh-keygen -A \
    && mkdir -p /run/nginx \
    && update-ca-certificates
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
