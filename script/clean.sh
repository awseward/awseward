#!/bin/bash

DOTENV_FILE=".env"
if [ ! -f $DOTENV_FILE ]; then
  >&2 echo "Could not find \`$(pwd)/${DOTENV_FILE}\`"
  exit 1
fi
source "$DOTENV_FILE"


echo "-----"
echo "Clean"
echo "-----"

rm -frv "$DIST_DIR"

echo
