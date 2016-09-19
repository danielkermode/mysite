FROM golang

ENV PORT 80

RUN go get github.com/danielkermode/mysite

ADD public public

EXPOSE 80

ENTRYPOINT mysite
