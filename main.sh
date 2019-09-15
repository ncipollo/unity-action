#!/usr/bin/env bash

if [ -z "$INPUT_LICENSE" ]; then
       ./license.sh
else
      ./setup.sh
      if [ "$INPUT_MODE" == "build" ]; then
            echo "would run build here"
      else 
            ./test.sh
      fi
fi
