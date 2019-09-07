#!/usr/bin/env bash

echo 'No license provided! Assuming one needs to be generated for unity personal...'
echo 'Step1: Look for xml dump in output'
echo 'Step2: Copy this into a file called unity3d.alf'
echo 'Step3: Upload this file to https://license.unity3d.com/manual'
echo 'Step4: Download .ulf file'
echo 'Step5: Copy contents of .ulf into a secret then provide this as the license argument'


xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' \
/opt/Unity/Editor/Unity \
-logFile /dev/stdout \
-batchmode \
-username "$INPUT_USERNAME" -password "$INPUT_PASSWORD"