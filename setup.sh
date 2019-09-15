#!/usr/bin/env bash

set -e
set -x
mkdir -p /root/.cache/unity3d
mkdir -p /root/.local/share/unity3d/Unity/
set +x
echo 'Writing license to license file /root/.local/share/unity3d/Unity/Unity_lic.ulf'
echo "$INPUT_LICENSE" | tr -d '\r' > /root/.local/share/unity3d/Unity/Unity_lic.ulf

set -x

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity \
-batchmode \
-quit \
-manualLicenseFile /root/.local/share/unity3d/Unity/Unity_lic.ulf \
-logFile /dev/stdout
