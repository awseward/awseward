#!/bin/bash

DOTENV_FILE=".env"
if [ ! -f $DOTENV_FILE ]; then
  >&2 echo "Could not find \`$(pwd)/${DOTENV_FILE}\`"
  exit 1
fi
source "$DOTENV_FILE"

./script/clean.sh

echo "-----"
echo "Build"
echo "-----"

mkdir "$DIST_DIR"
cp -Rv "$SRC_DIR"/* "$DIST_DIR"

echo
