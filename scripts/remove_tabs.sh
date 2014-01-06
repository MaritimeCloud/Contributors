#!/bin/bash
SOURCE_DIR=`dirname $0`
if [ $# != 1 ]; then
    echo "Usage: remove_tabs.sh <file>"
    exit 1
fi

cat $1 | sed 's/	/    /g' > $SOURCE_DIR/tmp
mv $SOURCE_DIR/tmp $1
echo "Updated $1"
#sed 's/tab/spacespacespace/g' "${iter}" > filename.notabs && mv filename.notabs "${iter}"
