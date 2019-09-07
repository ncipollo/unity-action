#!/usr/bin/env bash

echo 'attempting to run unity!'
echo $INPUT_USERNAME
echo 'there should be a user name...'

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
/opt/Unity/Editor/Unity \
-logFile /dev/stdout \
-batchmode \
-username "$INPUT_USERNAME" -password "$INPUT_PASSWORD"
