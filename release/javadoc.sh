#!/bin/bash
#Any command that fails will exit the script
set -e
VER="MASTER"
             
            
rm -fr MaritimeCloud src target

git clone https://github.com/MaritimeCloud/MaritimeCloud.git 
cd MaritimeCloud
git checkout $VER
cd ..


mkdir src
cp -r MaritimeCloud/mc-core/src/main/java src
cp -rf MaritimeCloud/mc-msdl/mc-msdl-core/src/main/java src
cp -rf MaritimeCloud/mc-mms/mc-mms-client-api/src/main/java src
rm -fr src/java/net/maritimecloud/internal

javadoc -link http://docs.oracle.com/javase/8/docs/api/ -d javadoc -sourcepath src/java -subpackages net.maritimecloud

rm -fr MaritimeCloud src 