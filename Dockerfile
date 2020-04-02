FROM hypnoglow/helm-s3:0.9.2-helm2.16

ARG KUBECTL_VERSION="v1.18.0"
RUN apk add --update \
  --no-cache \
  --virtual \
  .build-deps \
  curl \
  && curl -LO https://storage.googleapis.com/kubernetes-release/release/"$KUBECTL_VERSION"/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \
  && mv ./kubectl /usr/local/bin/kubectl \
  # add bash
  && apk add bash \
  # remove other deps
  && apk del .build-deps && rm -f /var/cache/apk/*
