ARG ALPINE_VERSION

FROM docker.io/alpine:${ALPINE_VERSION} AS builder
ARG POLARIS_VERSION
COPY container /polaris/build
ADD https://github.com/agersant/polaris/releases/download/${POLARIS_VERSION}/Polaris_${POLARIS_VERSION}.tar.gz /polaris/src/polaris.tar.gz
RUN /polaris/build/build.sh

FROM alpine:${ALPINE_VERSION}
RUN adduser -S -D -H -h /var/lib/polaris -s /sbin/nologin -G users -g polaris polaris && \
    install -d -m0755 -o100 -g100 /var/cache/polaris && \
    install -d -m0755 -o100 -g100 /var/lib/polaris && \
    install -d -m0755 -o100 -g100 /var/log/polaris
COPY --from=builder /polaris/pkg /
EXPOSE 5050
VOLUME [ "/music", "/var/cache/polaris", "/var/lib/polaris" ]
USER polaris
ENTRYPOINT [ "/bin/run-polaris" ]
