#!/usr/bin/env bash

set -x

echo "Creating build! Target: $INPUT_BUILD_TARGET"

cd $GITHUB_WORKSPACE

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity \
-batchmode \
-projectPath $(pwd) \
-buildTarget $INPUT_BUILD_TARGET \
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

exit $UNITY_TEST_EXIT_CODE
