#!/bin/bash

VAULT_DIR=${1:-"/Documents/Obsidian\ Vault"}
cd "$VAULT_DIR" || { echo "Vault directory not found: $VAULT_DIR"; exit 1; }

# Check for uncommitted changes
if [[ -n $(git status --porcelain) ]]; then
    echo "Saving uncommitted changes..."
    git add .
    git commit -m "Auto-save: $(date)"
fi

git pull --rebase
git add .
git commit -m "Auto-sync: $(date)"
git push
