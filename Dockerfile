FROM        alpine:3.4
MAINTAINER  Codecov <enterprise@codecov.io>

RUN         apk update
RUN         apk add --upgrade python-dev postgresql-dev supervisor nginx
RUN         mkdir /config
COPY        docker/cacert.pem /etc/ssl/cert.pem
COPY        docker/run /bin/run
COPY        docker/config /bin/config
COPY        docker/http.nginx.conf /http.nginx.conf
COPY        docker/https.nginx.conf /https.nginx.conf
COPY        docker/mime.types /mime.types
COPY        docker/codecov /codecov

EXPOSE      80 443
CMD         ["/bin/run"]
