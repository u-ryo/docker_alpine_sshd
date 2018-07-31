# docker_alpine_sshd

Dockerfile of the nginx reverse proxy and sshd image for [arukas](https://arukas.io).

You can get a docker machine of the reverse proxy and ssh only for you on the Arukas Cloud.

### Environments

1. `GITHUB_USER` If you have registered your SSH Key on GitHub you can specify this environment variable and the container can be accessed only by you.
1. `PROXY_PASS` nginx reverse proxy URL. The default value is `https://google.com/`.
