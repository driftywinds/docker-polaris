FROM alpine:3.11
COPY scripts /polaris/scripts
ADD https://github.com/agersant/polaris/releases/download/v0.11.0/polaris-0.11.0.tar.gz /polaris/src/polaris.tar.gz
RUN /polaris/scripts/build.sh

FROM alpine:3.11
RUN apk -U --no-progress upgrade && apk --no-progress add libgcc sqlite-libs
COPY --from=0 /polaris/pkg /
EXPOSE 5050
VOLUME [ "/music", "/var/lib/polaris" ]
USER polaris
ENTRYPOINT [ "/bin/run-polaris" ]
