#!/bin/bash

PROFILE="default"
DEFAULT_REGION="us-east-1"
AWS_CREDENTIALS_FILE="$HOME/.aws/credentials" 

CREDENTIALS=$(xclip -o -selection clipboard)

if [ -z "$CREDENTIALS" ]; then
    echo "Error: The clipboard is empty."
    exit 1
fi

CREDENTIALS=$(echo "$CREDENTIALS" | tr -d '\r')

CREDENTIALS=$(echo "$CREDENTIALS" | sed '1 s/^\[.*\]/['"$PROFILE"']/')

CREDENTIALS=$(echo -e "$CREDENTIALS\nregion=$DEFAULT_REGION")

echo "$CREDENTIALS" > "$AWS_CREDENTIALS_FILE"

echo "Successfully updated credentials in profile [$PROFILE]!"

cat "$AWS_CREDENTIALS_FILE"
