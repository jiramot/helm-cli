FROM alpine

ARG TARGETOS
ARG TARGETARCH
ARG VERSION

ENV VERSION="${VERSION:-v3.10.0}"
ENV DOWNLOAD_URL="https://get.helm.sh/helm-${VERSION}-${TARGETOS}-${TARGETARCH}.tar.gz"
RUN apk add --update --no-cache wget git bash curl yq && \
    wget ${DOWNLOAD_URL} -O - | tar -xz && \
    mv ${TARGETOS}-${TARGETARCH}/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf ${TARGETOS}-${TARGETARCH}

RUN chmod +x /usr/bin/helm
RUN helm plugin install https://github.com/chartmuseum/helm-push
WORKDIR /apps

