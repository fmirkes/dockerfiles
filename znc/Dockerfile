FROM alpine

VOLUME /znc

ADD build-assets/docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh \
    && apk --no-cache add znc

ENTRYPOINT ["/docker-entrypoint.sh"]
