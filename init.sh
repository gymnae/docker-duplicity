#!/bin/sh
duplicity \
	 --verbosity 8 \
	 --s3-use-ia \
	 --s3-use-new-style  \
	 --s3-use-server-side-encryption \
	 --s3-european-buckets \
	 --allow-source-mismatch \
	 --ssl-no-check-certificate \
	 --s3-unencrypted-connection \
	 --volsize 150 \
	 --gpg-options "--yes --batch --no-tty" \
	 --encrypt-key $ENCRYPT_KEY \
	 --sign-key $ENCRYPT_KEY \
	$SOURCE_PATH \
	$REMOTE_URL
