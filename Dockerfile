FROM gymnae/alpine-base
MAINTAINER Gunnar Falk <docker@grundstil.de>

# install base packages
RUN apk-install duplicity openssl py-crypto py-pip  \
 && pip install pydrive==1.0.1 \
 && apk del --purge py-pip \
 
 #create the user and folders
 
 && adduser -D -u 1999 duplicity \
 && mkdir -p /home/duplicity/.cache/duplicity \
 && mkdir -p /home/duplicity/.gnupg \
 && chmod -R go+rwx /home/duplicity/
 
ENV HOME=/home/duplicity
VOLUME /home/duplicity/.cache/duplicity
VOLUME /home/duplicity/.gnupg

USER duplicity
CMD ["duplicity"]
