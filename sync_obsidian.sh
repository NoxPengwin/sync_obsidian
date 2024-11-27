#!/bin/bash

VAULT_DIR=${1:-"$HOME/Documents/Obsidian Vault"}
cd "$VAULT_DIR" || { echo "Vault directory not found: $VAULT_DIR"; exit 1; }

# Check for uncommitted changes
if [[ -n $(git status --porcelain) ]]; then
    echo "Saving uncommitted changes..."
    git add .
    git commit -m "Auto-save: $(date)"
fi

git pull --rebase || { echo "Rebase failed. Resolve conflicts manually."; exit 1; }

# Commit only if there are changes
if [[ -n $(git status --porcelain) ]]; then
    echo "Syncing changes..."
    git add .
    git commit -m "Auto-sync: $(date)"
fi

git push
