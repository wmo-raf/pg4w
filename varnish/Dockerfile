FROM varnish:6.5.1

LABEL maintainer="otenyo.erick@gmail.com"


RUN apt-get update && apt-get -y install netcat

COPY ./custom-entrypoint.sh ./custom-entrypoint.sh

ENTRYPOINT ["./custom-entrypoint.sh"]

CMD [ "docker-varnish-entrypoint" ]