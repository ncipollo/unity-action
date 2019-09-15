#!/usr/bin/env bash

if [ -z "$INPUT_LICENSE" ]; then
      sh license.sh
else
      echo "$INPUT_MODE"
      sh setup.sh
      if [ "$INPUT_MODE" == build ]; then
            echo "would run build here"
      else 
            sh test.sh
      fi
fi
