# docker_alpine_sshd

Dockerfile of the nginx reverse proxy and sshd image for [arukas](https://arukas.io).

You can get a docker machine of the reverse proxy and ssh only for you on the Arukas Cloud.

### Environments

1. `GITHUB_USER` If you have registered your SSH Key on GitHub you can specify this environment variable then the container can be accessed only by yourself.
1. `PROXY_PASS` nginx reverse proxy URL. The default value is `https://arukas.io/`.

### Settings
In your app settings on the `arukas.io`, plase set the `Ports` as below.

1. First, `80 TCP`
1. Second, `22 TCP`
1. Only 2 ports should be set.

![Settings on Arukas](https://raw.githubusercontent.com/wiki/u-ryo/docker_alpine_sshd/image/arukas_settings.png)
