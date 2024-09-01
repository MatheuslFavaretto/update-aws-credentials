#!/bin/bash

SCRIPT_NAME="up-awscred"
SCRIPT_URL="https://raw.githubusercontent.com/MatheuslFavaretto/update-aws-credentials/main/up-awscred.sh?token=GHSAT0AAAAAACP2HWY5YI3IDXSSWQH5DUZYZWUYX3A"
DEST_DIR="/usr/local/bin"

SHELL_NAME=$(basename "$SHELL")

if [ "$SHELL_NAME" == "bash" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
elif [ "$SHELL_NAME" == "zsh" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
else
    echo "Unsupported shell. Please configure the alias manually."
    exit 1
fi

echo "Downloading the script $SCRIPT_NAME from $SCRIPT_URL..."
curl -o "$SCRIPT_NAME.sh" "$SCRIPT_URL"

if [ ! -f "$SCRIPT_NAME.sh" ]; then
    echo "Error: Failed to download the script from $SCRIPT_URL"
    exit 1
fi

echo "Installing the script to $DEST_DIR..."
sudo mv "$SCRIPT_NAME.sh" "$DEST_DIR/$SCRIPT_NAME"

echo "Making the script $SCRIPT_NAME executable..."
sudo chmod +x "$DEST_DIR/$SCRIPT_NAME"

if ! grep -q "alias $SCRIPT_NAME=" "$SHELL_CONFIG"; then
    echo "Adding alias to $SHELL_CONFIG..."
    echo "alias $SCRIPT_NAME='$DEST_DIR/$SCRIPT_NAME'" >> "$SHELL_CONFIG"
    echo "Alias successfully added."
else
    echo "Alias already exists in $SHELL_CONFIG. No changes made."
fi

echo "Reloading $SHELL_CONFIG to apply the alias..."
source "$SHELL_CONFIG"

if [ -f "$DEST_DIR/$SCRIPT_NAME" ]; then
    echo "Installation completed successfully! You can now use the command '$SCRIPT_NAME' from anywhere in the terminal."
else
    echo "An error occurred during the installation."
fi
