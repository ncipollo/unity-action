#!/usr/bin/env bash

set -e
set -x
mkdir -p /root/.cache/unity3d
mkdir -p /root/.local/share/unity3d/Unity/
set +x
# echo 'Writing license to license file /root/.local/share/unity3d/Unity/Unity_lic.ulf'
# echo "$INPUT_LICENSE" | tr -d '\r' > /root/.local/share/unity3d/Unity/Unity_lic.ulf

cp $GITHUB_WORKSPACE/Unity_v2019.ulf /root/.local/share/unity3d/Unity/Unity_lic.ulf

set -x

