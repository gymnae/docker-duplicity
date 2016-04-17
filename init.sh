#copy the config file
/tmp/conf /home/duplicity/.duply/$CONFNAME/conf

#gpg config
sed -i.bak "s;GPGKEY;$GPGKEY;g" /home/duplicity/.duply/$CONFNAME/conf
sed -i.bak "s;GPGPW;$GPGPW;g" /home/duplicity/.duply/$CONFNAME/conf

#backend config
sed -i.bak "s;_backend_username_;$BACKENDUSERNAME;g" /home/duplicity/.duply/$CONFNAME/conf
sed -i.bak "s;_backend_password_;$BACKENDPASSWORD;g" /home/duplicity/.duply/$CONFNAME/conf

#source
sed -i.bak "s;source;$SOURCE_PATH;g" /home/duplicity/.duply/$CONFNAME/conf

#target
sed -i.bak "s;target;$REMOTE_URL;g" /home/duplicity/.duply/$CONFNAME/conf

