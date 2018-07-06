FROM golang:alpine

ENV PS1 "\n\n> \W \$ "
ENV TERM=linux
ENV PACKAGES bash git

RUN apk --no-cache add $PACKAGES

WORKDIR /app

COPY files/home/* /root/

RUN go get github.com/yudai/gotty

ENTRYPOINT ["gotty"]
CMD ["--permit-write", "--reconnect", "bash"]

EXPOSE 3000