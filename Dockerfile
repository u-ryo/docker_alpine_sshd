FROM alpine:latest
MAINTAINER uryooo@gmail.com
ENV GITHUB_USER=github PROXY_PASS=https://google.com/
EXPOSE 80 22
COPY entrypoint.sh /
ENTRYPOINT /entrypoint.sh
