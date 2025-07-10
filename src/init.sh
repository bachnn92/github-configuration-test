#!/bin/bash
rm -rf .git  # Remove existing git history if any

set -e
REMOTE_URL="https://github.com/bachnn92/github-configuration-test.git" # Change this to your remote repo

# Initialize a new git repository if not already initialized
if [ ! -d ".git" ]; then
    git init
    git remote add origin "$REMOTE_URL"
    git config user.name "Bach Nguyen Ngoc"
    git config user.email "bachnn92@gmail.com"
fi

git checkout -b main

git add README.md
git commit -m "Add Readme"

git add LICENSE
git commit -m "Add License"

git add .gitignore
git commit -m "Add gitignore"

git push -u origin main --force


git checkout -b develop main
git push -u origin develop --force

git checkout -b feature/GCT-001-add-init-script develop
git push -u origin feature/GCT-001-add-init-script --force

git add src/init.sh
git commit -m "Add init.sh"

git push --force

git checkout -b feature/GCT-002-add-cleanup-script develop
git push -u origin feature/GCT-002-add-cleanup-script --force

git add src/cleanup.sh
git commit -m "Add cleanup.sh"

git push --force

# Merge feature/GCT-001 into develop
git checkout develop
git merge --no-ff feature/GCT-001-add-init-script -m "Merge feature/GCT-001-add-init-script into develop"
git push --force

# Create release branch from develop
git checkout -b release/v1.0.0 develop
mkdir -p doc
echo "# Release Notes v1.0.0" > doc/RELEASE-v1.0.0.md
echo "Initial release with init script functionality" >> doc/RELEASE-v1.0.0.md
git add doc/RELEASE-v1.0.0.md
git commit -m "Release v1.0.0"
git tag v1.0.0
git push -u origin release/v1.0.0 --force
git push origin v1.0.0 --force

# Merge release into main
git checkout main
git merge --no-ff release/v1.0.0 -m "Merge release v1.0.0 into main"
git push --force

# Merge feature/GCT-002 into develop
git checkout develop
git merge --no-ff feature/GCT-002-add-cleanup-script -m "Merge feature/GCT-002-add-cleanup-script into develop"
git push --force

# Create release branch for v1.1.0 from develop
git checkout -b release/v1.1.0 develop
mkdir -p doc
echo "# Release Notes v1.1.0" > doc/RELEASE-v1.1.0.md
echo "Add cleanup script functionality" >> doc/RELEASE-v1.1.0.md
git add doc/RELEASE-v1.1.0.md
git commit -m "Release v1.1.0"
git tag v1.1.0
git push -u origin release/v1.1.0 --force
git push origin v1.1.0 --force

# Merge release/v1.1.0 into main
git checkout main
git merge --no-ff release/v1.1.0 -m "Merge release v1.1.0 into main"
git push --force


# Create feature/GCT-003 for backup script
git checkout -b feature/GCT-003-add-backup-script develop
git push -u origin feature/GCT-003-add-backup-script --force

git add src/backup.sh
git commit -m "Add backup.sh"

git push --force

# Merge feature/GCT-003 into develop
git checkout develop
git merge --no-ff feature/GCT-003-add-backup-script -m "Merge feature/GCT-003-add-backup-script into develop"
git push --force

# Create release branch for v1.2.0 from develop
git checkout -b release/v1.2.0 develop
mkdir -p doc
echo "# Release Notes v1.2.0" > doc/RELEASE-v1.2.0.md
echo "Add backup script functionality" >> doc/RELEASE-v1.2.0.md
git add doc/RELEASE-v1.2.0.md
git commit -m "Release v1.2.0"
git tag v1.2.0
git push -u origin release/v1.2.0 --force
git push origin v1.2.0 --force

# Merge release/v1.2.0 into main
git checkout main
git merge --no-ff release/v1.2.0 -m "Merge release v1.2.0 into main"
git push --force