#!/bin/bash
set -e

cd dist
git init
git add .
git commit -m "deploy: $(date)"
git push --force git@github.com:radious-subsystems/zfs.rent master:frontend-live
rm -rf .git
