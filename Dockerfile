FROM alpine:latest
MAINTAINER uryooo@gmail.com
ENV GITHUB_USER="u-ryo"
ENV PROXY_PASS="http://walt.mydns.bz:10022/"
EXPOSE 80 22
COPY entrypoint.sh /
ENTRYPOINT /entrypoint.sh
