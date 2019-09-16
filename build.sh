#!/usr/bin/env bash

set -x

echo 'Creating build!'

cd $GITHUB_WORKSPACE
TEST_PLATFORM=linux
TEST_RESULTS=$(pwd)/$TEST_PLATFORM-results.xml

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity \
-batchmode \
-projectPath $(pwd) \
-runEditorTests \
-testResults $TEST_RESULTS \
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

cat $TEST_RESULTS | grep test-case 
exit $UNITY_TEST_EXIT_CODE
