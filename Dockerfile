FROM alpine:3.16.1

RUN apk add --update --no-cache \
    bash \
    curl && \
    rm -rf /root/.cache /var/cache

COPY entrypoint.sh /home/

WORKDIR /home/

CMD ["/home/entrypoint.sh"]

