FROM hypnoglow/helm-s3:0.9.2-helm2.16

ENV BASE_URL=https://get.helm.sh
ENV TAR_FILE=helm-v2.16.3-linux-amd64.tar.gz

ARG KUBECTL_VERSION="v1.18.0"
RUN apk add --update \
    --no-cache \
    --virtual \
    .build-deps \
    curl \
  # install kubectl
  && curl -LO https://storage.googleapis.com/kubernetes-release/release/"$KUBECTL_VERSION"/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \
  && mv ./kubectl /usr/local/bin/kubectl \
  # add bash and other deps
  && apk --no-cache add bash \
  # get tiller, as the root alpine/helm image doesn't expose it
  && curl -L ${BASE_URL}/${TAR_FILE} | tar xvz \
  && mv linux-amd64/tiller /usr/bin/tiller \
  && chmod +x /usr/bin/tiller \
  && rm -rf linux-amd64 \
  # remove build deps
  && apk del .build-deps && rm -f /var/cache/apk/*
