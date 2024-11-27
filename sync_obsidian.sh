#!/bin/bash

VAULT_DIR="/path/to/ObsidianVault"
cd $VAULT_DIR

git pull --rebase
git add .
git commit -m "sync"
git push
