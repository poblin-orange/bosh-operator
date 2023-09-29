FROM ghcr.io/flant/shell-operator:latest
ADD hooks /hooks

#--- Clis versions
ENV BOSH_VERSION="7.4.0" \
    BOSH_COMPLETION_VERSION="1.2.0" \
    CREDHUB_VERSION="2.9.21" \

RUN installBinary() { printf "\n=> Add $1 CLI\n" ; curl -sSLo /usr/local/bin/$2 "$3" ; } && \
    printf '\n=====================================================\n Install clis and tools\n=====================================================\n' && \
    installBinary "BOSH" "bosh" "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-${BOSH_VERSION}-linux-${OS_ARCH_2}" && \