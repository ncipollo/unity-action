#!/usr/bin/env bash

if [ -z "$INPUT_LICENSE" ]
then
      sh license.sh
else
      sh setup.sh
      sh test.sh
fi
