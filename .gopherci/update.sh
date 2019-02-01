#!/bin/bash -e

REPO=$1

echo "Cloning $REPO"
git clone git@github.com:arcsUVA/$REPO.git github/$REPO
echo "Cleaning out $REPO and updating contents"
rm -f github/$REPO/Singularity.*
cp -a $REPO/Singularity.* github/$REPO
cd github/$REPO
echo "Pushing updates (if any)"
git add .
git commit -m "Automated updates from Gir" && git push || echo "(no updates)"
