#!/bin/bash

if [ "$1" = "release-root-pom" ]; then
   mvn -f rootpom/pom.xml -DperformRelease clean deploy
   echo "Now follow these steps:"
   echo ""
   echo "* Open https://oss.sonatype.org/index.html#stagingRepositories and login using username/password from https://issues.sonatype.org/
   echo "* select staging repository and find net.maritimecloud-xxxx verify that all files are present.
   echo "* Select 'close' followed by 'release'"
   echo ""
   echo "If you make a mistake select 'drop' to start over"
   echo ""
   echo "It might take a couple of hours until the pom file has been replicated"
   exit
elif [ -z "$1" ]; then 
	echo Usage: $0 target
	echo where target is:
else
	echo Unknown target: "$1"
	echo Valid targets are:

fi

echo "  release-root-pom  Deploys the root pom to the staging area"
