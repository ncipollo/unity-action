#!/usr/bin/env bash

set -x

echo "Creating build! Calling build method: $INPUT_BUILD_METHOD"

cd $GITHUB_WORKSPACE

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity \
-batchmode \
-nographics \
-quit \
-projectPath=$(pwd)$INPUT_PROJECT_PATH \
-executeMethod $INPUT_BUILD_METHOD \
-logFile /dev/stdout

UNITY_EXIT_CODE=$?

if [ $UNITY_EXIT_CODE -eq 0 ]; then
  echo "Run succeeded, no failures occurred";
elif [ $UNITY_EXIT_CODE -eq 2 ]; then
  echo "Run succeeded, some tests failed";
elif [ $UNITY_EXIT_CODE -eq 3 ]; then
  echo "Run failure (other failure)";
else
  echo "Unexpected exit code $UNITY_EXIT_CODE";
fi

exit $UNITY_EXIT_CODE
