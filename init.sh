#!/bin/sh
#copy the config file
cp /tmp/conf /home/duplicity/.duply/$CONFNAME/conf

#gpg config
sed -i.bak "s;GPGKEY;$GPGKEY;g" /home/duplicity/.duply/$CONFNAME/conf
sed -i.bak "s;GPGPW;$GPGPW;g" /home/duplicity/.duply/$CONFNAME/conf

#backend config
sed -i.bak "s;_backend_username_;$BACKENDUSERNAME;g" /home/duplicity/.duply/$CONFNAME/conf
sed -i.bak "s;_backend_password_;$BACKENDPASSWORD;g" /home/duplicity/.duply/$CONFNAME/conf

#source
sed -i.bak "s;source;$SOURCE_PATH;g" /home/duplicity/.duply/$CONFNAME/conf

#scheme
sed -i.bak "s;backuptarget;$SCHEME;g" /home/duplicity/.duply/$CONFNAME/conf

#extra param
sed -i.bak "s;duply_extra;$DUPLY_EXTRA_PARAM;g" /home/duplicity/.duply/$CONFNAME/conf

#do the backup
duply $CONFNAME backup
