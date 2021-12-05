FROM gymnae/alpine-base:latest
MAINTAINER Gunnar Falk <docker@grundstil.de>

# install base packages
RUN apk add --no-cache \
 duply \
 py3-boto3 \
 openssl \
 py3-cryptography \
 py3-pip  \
 grep \
 && adduser -D -u 1999 duplicity \
 && chmod -R go+rwx /home/duplicity/
 
# workaround for alpine linux missing py-fasterners
RUN pip3 install fasteners future
 
ENV HOME=/home/duplicity
#VOLUME /home/duplicity/.cache/duplicity
#VOLUME /home/duplicity/.gnupg

# prepare init script for start
ADD init.sh /init.sh
ADD conf /tmp/conf
RUN chmod +x /init.sh
CMD ["/init.sh"]
