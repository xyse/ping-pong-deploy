FROM alpine:3.20

ARG USERNAME
ARG PASSWORD

RUN apk add --update ttyd docker openrc
RUN rc-service docker start
RUN rc-service docker status

RUN docker pull docker.io/panifie/pingpong-precomp-interactive

EXPOSE 8080

CMD ["sh", "-c", "ttyd -W -p 8080 -c $USERNAME:$PASSWORD sh"]
