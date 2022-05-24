FROM varnish:7.0.2

LABEL maintainer="otenyo.erick@gmail.com"

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

ENTRYPOINT /wait && /usr/local/bin/docker-varnish-entrypoint