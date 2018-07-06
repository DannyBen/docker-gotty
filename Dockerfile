FROM alpine:edge

ENV PS1 "\n\n> \W \$ "
ENV TERM=linux
ENV PACKAGES bash

RUN apk --no-cache add $PACKAGES

WORKDIR /app

COPY files/gotty-386 /usr/local/bin/gotty
COPY files/home/* /root/
RUN chmod +x /usr/local/bin/gotty

ENTRYPOINT ["gotty"]
CMD ["--permit-write", "--reconnect", "bash"]

EXPOSE 3000