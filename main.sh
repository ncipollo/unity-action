#!/usr/bin/env bash

echo 'attempting to run unity!'

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
/opt/Unity/Editor/Unity \
-logFile /dev/stdout \
-batchmode \
-username "$username" -password "$password"
