# Releasing

Images are published to the public Docker Hub repo
[`fintechstudios/helm-s3`](https://hub.docker.com/repository/docker/fintechstudios/helm-s3).

The images are published manually from a local machine with the following commands.

The most basic build looks like:
```shell
TAG=fintechstudios/helm-s3:${PUT A VERSION HERE}

# Build the image
docker build -t "$TAG" .

# Then push it to docker hub
docker push "$TAG"
```

The base can also be customized through [build args](https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables---build-arg)
with specific versions of Helm, the Helm S3 plugin, and kubectl. It is important to make sure
the Helm version and plugin version are compatible.

To find versions of the plugin, check the Docker Hub [`hypnoglow/helm-s3` tags](https://hub.docker.com/r/hypnoglow/helm-s3/tags).

```shell
TAG=fintechstudios/helm-s3:${PUT A VERSION HERE}

# Build the image
docker build -t "$TAG" \
    --build-arg HELM_S3_PLUGIN_VERSION="0.9.2-helm2.16" \
    --build-arg HELM_VERSION="v2.16.3" \
    --build-arg KUBECTL_VERSION="v1.18.0" \
    .

# Then push it to docker hub
docker push "$TAG"
```

For tags, usually just using the Helm major version is sufficient.
