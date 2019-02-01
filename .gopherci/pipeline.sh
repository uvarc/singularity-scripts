#!/bin/bash

source $GOPHER_INSTALLDIR/lib/gopherbot_v1.sh

FailTask dmnotify khs3z "singularity-scripts pipeline failed, emailing job history..."
FailCommand builtin-history "send history $GOPHER_JOB_NAME:$GOPHER_NAMESPACE_EXTENDED/$GOPHERCI_BRANCH $GOPHER_RUN_INDEX to khs3z@virginia.edu"

CHILDREN=$(echo *)

mkdir -p github
AddTask ssh-scan github.com

for CHILD in $CHILDREN
do
    [ -d $CHILD ] && AddTask exec .gopherci/update.sh $CHILD
done
