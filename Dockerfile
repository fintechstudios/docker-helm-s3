ARG HELM_VERSION="latest"

FROM alpine/helm:${HELM_VERSION}

RUN mkdir -p $(helm home)/plugins
RUN apk add --update --no-cache --virtual .build-deps \
  git \
  bash

ARG HELM_S3_VERSION=""
ARG S3_PLUGIN_REPO="https://github.com/hypnoglow/helm-s3.git"
RUN helm plugin install ${S3_PLUGIN_REPO} --version ${HELM_S3_VERSION}

RUN apk del .build-deps && rm -f /var/cache/apk/*

ENTRYPOINT ["helm"]
CMD ["--help"]
