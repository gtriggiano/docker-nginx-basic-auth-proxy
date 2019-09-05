FROM nginx:1.17.3-alpine

ENV PORT 5000
ENV CLIENT_MAX_BODY_SIZE 1m
ENV WORKER_PROCESSES auto
ENV SERVER_NAME example.com
ENV PROXY_READ_TIMEOUT 60s

RUN apk add apache2-utils
ADD nginx.conf.tmpl nginx.conf.tmpl
ADD start.sh start.sh
RUN chmod +x /start.sh

ENTRYPOINT [ "/start.sh" ]