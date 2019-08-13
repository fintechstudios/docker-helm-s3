# Docker Helm S3

Docker image for using K8s Helm with [the helm-s3 plugin from `@hypnoglow`](https://github.com/hypnoglow/helm-s3).

Built on [`alpine/helm`](https://hub.docker.com/r/alpine/helm).

Tagged by both the helm version and plugin version in the form:

`{helm version}_{plugin version}`

Ex: `2.14.1_0.8.0` would be for helm version `2.14.1` and helm-s3 plugin version `0.8.0`.

`latest` will always include the latest version of both.
