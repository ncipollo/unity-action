#!/usr/bin/env bash

if [ -z "$INPUT_LICENSE" ]
then
      sh license.sh
else
      echo "do normal stuff here"
      env 
      echo $GITHUB_WORKSPACE
      ls $GITHUB_WORKSPACE
fi
