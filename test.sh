#!/usr/bin/env bash

set -x

echo 'Running tests!'

cd $GITHUB_WORKSPACE
TEST_PLATFORM=linux

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity \
-batchmode \
-quit \
-manualLicenseFile /root/.local/share/unity3d/Unity/Unity_lic.ulf \
-logFile /dev/stdout

xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity \
-batchmode \
-projectPath $(pwd) \
-runEditorTests \
-editorTestsResultFile $(pwd)/$TEST_PLATFORM-results.xml \
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

cat $(pwd)/$TEST_PLATFORM-results.xml
cat $(pwd)/$TEST_PLATFORM-results.xml | grep test-run | grep Passed
exit $UNITY_TEST_EXIT_CODE
