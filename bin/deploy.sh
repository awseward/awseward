#!/bin/bash

DOTENV_FILE=".env"
if [ ! -f $DOTENV_FILE ]; then
  >&2 echo "Could not find \`$(pwd)/${DOTENV_FILE}\`"
  exit 1
fi
source "$DOTENV_FILE"

./bin/build.sh

echo "------"
echo "Deploy"
echo "------"

case "$1" in
  production)
    S3_BUCKET="$S3_PRODUCTION_BUCKET"
    ;;
  staging)
    S3_BUCKET="$S3_STAGING_BUCKET"
    ;;
  *)
    >&2 echo "No valid release stage specified"
    exit 1
    ;;
esac

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION

aws s3 cp "$DIST_DIR" "s3://${S3_BUCKET}/" --recursive

echo
