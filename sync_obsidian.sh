#!/bin/bash

VAULT_DIR="/path/to/ObsidianVault"
cd $VAULT_DIR

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
