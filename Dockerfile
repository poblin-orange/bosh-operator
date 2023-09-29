FROM ghcr.io/flant/shell-operator:latest
ADD hooks /hooks

#--- Clis versions
ENV BOSH_VERSION="7.4.0" \
    CREDHUB_VERSION="2.9.21"

RUN printf '\n=====================================================\n Install clis and tools\n=====================================================\n' && \
    wget https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-${BOSH_VERSION}-linux-amd64 -O /usr/local/bin/bosh && \
    chmod 755 /usr/local/bin/bosh