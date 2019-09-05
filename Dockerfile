FROM nginx:1.17.3-alpine

ENV CLIENT_MAX_BODY_SIZE 1m
ENV WORKER_PROCESSES auto
ENV SERVER_NAME example.com
ENV PROXY_READ_TIMEOUT 60s

ADD nginx.conf.tmpl nginx.conf.tmpl
ADD start.sh start.sh
RUN chmod +x /start.sh

ENTRYPOINT [ "/start.sh" ]