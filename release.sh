#!/bin/bash
#Any command that fails will exit the script
set -e
 
#declare -a arr=("../MaritimeCloud" "../MaritimeCloudMMS")

declare -a arr=("../MaritimeCloud_V0_2" "../MaritimeCloudMMS_V0_2")

##cd ..
## now loop through the above array
for i in "${arr[@]}"
do
   cd $i
   echo "Checking for changes in $i"
   git status
   if ! git diff-index --quiet HEAD --; then
     echo "There are uncommitted changes to $i"
     exit 1
   fi
done

###Make sure we can compile
for i in "${arr[@]}"
do
   cd $i
   mvn -DperformRelease=true clean source:jar javadoc:jar install
done


echo "Initial checks are okay"
read -p "Enter release version: " release
read -p "Enter Next release version (without snapshot): " next

next="$next-SNAPSHOT"
echo ""
echo "Release version: $release"
echo "Next version: $next"
read -p "Press enter to start release process: " enter


for i in "${arr[@]}"
do
  cd $i
  ######Lets bump the version counter

  mvn versions:set -DnewVersion=$release
  mvn -DperformRelease=true clean source:jar javadoc:jar install deploy
  mvn versions:commit

  ###### Push changes to git

  git add '*pom.xml'

  git commit -m "Releasing $release  [ci skip]"
  git push

  ###### Create a tag in git
  git tag -a v$release -m 'Version $release'
  git push origin v$release


  ##### Preparing next development version
  mvn versions:set -DnewVersion=$next
  mvn clean source:jar javadoc:jar install deploy
  mvn versions:commit
  git add '*pom.xml'

  git commit -m "Preparing next development iteration $next"
  git push
done

##TODO builder server docker