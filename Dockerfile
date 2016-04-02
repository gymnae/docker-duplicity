FROM gymnae/alpine-base
MAINTAINER Gunnar Falk <docker@grundstil.de>

# install base packages
RUN apk-install duply py-boto openssl py-crypto py-pip  \
 && adduser -D -u 1999 duplicity \
 && chmod -R go+rwx /home/duplicity/

ENV HOME=/home/duplicity
#VOLUME /home/duplicity/.cache/duplicity
#VOLUME /home/duplicity/.gnupg

# prepare init script for start
ADD init.sh /init.sh
RUN chmod +x /init.sh & chown duplicity /init.sh
#CMD ["/init.sh"]
USER duplicity
CMD ["duply"]
