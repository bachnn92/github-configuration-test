#!/bin/bash

# List all remote branches and save to branch.log
git branch -r | grep -v '\->' | sed 's/origin\///' > branch.log

# Delete each remote branch listed in branch.log
while read branch; do
    if [ "$branch" != "HEAD" ] && [ -n "$branch" ]; then
        git push origin --delete "$branch"
    fi
done < branch.log