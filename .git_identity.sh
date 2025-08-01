#!/bin/bash

# Toggle Git identity in the current repository

# === Define identities ===
PERSONAL_NAME="Nitish Prajapati"
PERSONAL_EMAIL="nitishprajapati180@gmail.com"

WORK_NAME="Nitish Prajapati"
WORK_EMAIL="nitishprajapati.zignuts@gmail.com"

# === Get current Git email ===
CURRENT_EMAIL=$(git config user.email 2>/dev/null)

if [ -z "$CURRENT_EMAIL" ]; then
    echo "⚠️ No Git email is set for this repo."
else
    echo "🔍 Current Git email: $CURRENT_EMAIL"
fi

# === Identity switching logic ===
if [ "$CURRENT_EMAIL" == "$PERSONAL_EMAIL" ]; then
    echo "🔁 Switching to WORK identity..."
    git config user.name "$WORK_NAME"
    git config user.email "$WORK_EMAIL"
    echo "✔️ Now using: $WORK_NAME <$WORK_EMAIL>"

elif [ "$CURRENT_EMAIL" == "$WORK_EMAIL" ]; then
    echo "🔁 Switching to PERSONAL identity..."
    git config user.name "$PERSONAL_NAME"
    git config user.email "$PERSONAL_EMAIL"
    echo "✔️ Now using: $PERSONAL_NAME <$PERSONAL_EMAIL>"

else
    echo "Unknown or unset identity. Choose one to set:"
    echo "1) Work ($WORK_EMAIL)"
    echo "2) Personal ($PERSONAL_EMAIL)"
    read -p "Enter choice (1/2): " choice

    if [ "$choice" == "1" ]; then
        git config user.name "$WORK_NAME"
        git config user.email "$WORK_EMAIL"
        echo "✔️ Switched to: $WORK_NAME <$WORK_EMAIL>"
    elif [ "$choice" == "2" ]; then
        git config user.name "$PERSONAL_NAME"
        git config user.email "$PERSONAL_EMAIL"
        echo "✔️ Switched to: $PERSONAL_NAME <$PERSONAL_EMAIL>"
    else
        echo "Invalid choice. No changes made."
    fi
fi
