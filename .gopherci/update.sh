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
if git commit -m "Automated updates from Gir"
then
    git push -u origin master
else
    echo "(no updates)"
fi
