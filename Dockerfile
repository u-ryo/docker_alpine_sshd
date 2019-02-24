FROM alpine:latest
MAINTAINER uryooo@gmail.com
ENV GITHUB_USER=github PROXY_PASS=https://arukas.io/
EXPOSE 80 22
COPY entrypoint.sh /
ENTRYPOINT /entrypoint.sh
