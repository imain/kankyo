#!/bin/bash

rm -f public_config.tar.gz

for f in `cat public_filelist.conf`; do
    PUB_FILES+="`eval echo "$f"` "
done
tar fchvz public_config.tar.gz $PUB_FILES

rm -f private_config.tar.gz.gpg

rm -f private_config.tar.gz
for f in `cat private_filelist.conf`; do
    PRIV_FILES+="`eval echo "$f"` "
done
tar fchvz private_config.tar.gz $PRIV_FILES

rm -f private_config.tar.gz.gpg
gpg --symmetric --cipher-algo aes256 private_config.tar.gz

# Clean up so its not lying around.
rm -f private_config.tar.gz
