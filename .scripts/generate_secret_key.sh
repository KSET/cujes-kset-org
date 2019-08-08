#!/bin/bash

FLASK_OVERRIDE_FILE="$1"

source "$FLASK_OVERRIDE_FILE"

if [ -z "$SECRET_KEY" ]; then
  echo "Secret key does not exist! Generating..."
  echo "" >>"$FLASK_OVERRIDE_FILE"
  printf "SECRET_KEY=" >>"$FLASK_OVERRIDE_FILE"
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 256 | head -n 1 >>"$FLASK_OVERRIDE_FILE"
else
  echo "Secret key already exists. Skipping..."
fi
