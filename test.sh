#!/bin/bash
# initialize all slipstream sub-repos with a main branch + README

ORG="slipstream-ethglobal"
REPOS=("slipstream-proxy" "slipstream-sdk" "slipstream-docs" "slipstream-contract" "slipstream-relayer")

for repo in "${REPOS[@]}"; do
  echo "Initializing $repo..."

  # clone repo
  gh repo clone $ORG/$repo
  cd $repo || exit

  # create README and commit
  echo "# $repo" > README.md
  git add README.md
  git commit -m "Initial commit"

  # create and push main branch
  git branch -M main
  git push -u origin main

  # back out
  cd ..
done

echo "✅ All repos initialized with README and main branch."
