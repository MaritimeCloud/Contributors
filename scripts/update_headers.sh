#!/bin/bash
SOURCE_DIR=`dirname $0`
if [ $# != 1 ]; then
    echo "Usage: replace_header.sh <file>"
    exit 1
fi

cat $SOURCE_DIR/../mc-build-tool/src/main/resources/mc-build-tool/LICENSE.txt > $SOURCE_DIR/tmp
echo "" >> $SOURCE_DIR/tmp
cat $1 | awk -f $SOURCE_DIR/update_headers.awk >> $SOURCE_DIR/tmp
mv $SOURCE_DIR/tmp $1
echo "Updated $1"
