FROM busybox:latest
ENV PORT=80
LABEL maintainer="VP <howdy@vpetkovic.info>"

ADD index.html /www/index.html

# EXPOSE $PORT

HEALTHCHECK CMD nc -z localhost $PORT

# Create a basic webserver and run it until the container is stopped
CMD trap "exit 0;" TERM INT; httpd -p $PORT -h /www -f & wait
