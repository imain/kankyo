#!/bin/bash

echo "ALL	ALL=(ALL)	NOPASSWD: ALL" >> /etc/sudoers

# Add the user whose home directory exists.
adduser -M `ls -1 /home | head -n1`

