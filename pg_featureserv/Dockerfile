FROM pramsey/pg_featureserv:20200408

USER root

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

USER 1001

ENTRYPOINT /wait && ./pg_featureserv

CMD []