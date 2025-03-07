ARG HELM_S3_PLUGIN_VERSION="commit.9e87a73-helm3.15.2"
FROM hypnoglow/helm-s3:${HELM_S3_PLUGIN_VERSION}

ARG HELM_VERSION="v3.15.2"
ARG KUBECTL_VERSION="v1.29.0"

ENV HELM_TAR_URL=https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz

RUN apk add --update \
    --no-cache \
    curl \
  # install kubectl
  && curl -LO https://storage.googleapis.com/kubernetes-release/release/"$KUBECTL_VERSION"/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \
  && mv ./kubectl /usr/local/bin/kubectl \
  # add bash and other deps
  && apk --no-cache add bash \
  # get tiller, as the root alpine/helm image doesn't expose it
  #&& curl -L ${HELM_TAR_URL} | tar xvz \
  #&& mv linux-amd64/tiller /usr/bin/tiller \
  #&& chmod +x /usr/bin/tiller \
  #&& rm -rf linux-amd64 \
  # remove build deps
  && rm -f /var/cache/apk/*
