#!/usr/bin/env bash

if [ -z "$INPUT_LICENSE" ]; then
       ./license.sh
else
      ./setup.sh
      if [ "$INPUT_MODE" == "build" ]; then
            ./build.sh
      else 
            ./test.sh
      fi
fi
