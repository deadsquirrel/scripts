#!/bin/bash

USER_NAME=`whoami`

if [ "$USER_NAME" != "root" ]; then
	USER_NAME="$USER_NAME"
	echo "hello, ${USER_NAME}!"
	echo "       "
fi

