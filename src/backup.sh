#!/bin/bash
set -e

# Switch to main branch
git checkout main

# Force create (reset) new branch named 'default' from main
git branch -f default main

# Switch to 'default' branch
git checkout default

# Force push 'default' branch to remote
git push origin default --force