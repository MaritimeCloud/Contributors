Cloudbees
==============
We use Cloudbees for two things:
1. As a continuous integration server, constantly verifying checkins and running tests
2. For storing maven artifacts


Adding a new project to Cloudbees
===============
The easiest way to add a new maven based project to cloudbees is to clone an existing project.


Settings.xml for Cloudbees
===============
In order to deploy files to cloudbees you need to have set up ~/.m2/settings.xml correctly.
In should contain the following lines, replacing USERNAME and PASSWORD
```xml
<servers>
  <server>
    <id>dma-release-repository</id>
    <username>USERNAME</username>
    <password>PASSWORD</password>
  </server>
  <server>
    <id>dma-snapshot-repository</id>
    <username>USERNAME</username>
    <password>PASSWORD</password>
  </server>
</servers>
```
you should now be able to deploy your files, either snapshots or releases.

Deploying 3rd party jars to Cloudbees
===============
Sometimes it will be necessary to deploy an artifact to your release or snapshot repository manually so 
that your builds can access it.  You may need to do this if you depend on artifacts that are not available on 
public repositories, or ones you build outside of your Jenkins instance.  
First make sure you have read the "Settings.xml for Cloudbees" paragraph.

Maven 3.x don't have a webdav connector by default, which means we have to do a little trick.
In the directory where the files you want to upload are located. Create this pom.xml file:
```xml
<project>
   <modelVersion>4.0.0</modelVersion>
   <groupId>fake</groupId>
   <artifactId>fake</artifactId>
   <version>1</version>
   <build>
      <extensions>
         <extension>
            <groupId>org.apache.maven.wagon</groupId>
            <artifactId>wagon-webdav-jackrabbit</artifactId>
            <version>2.2</version>
         </extension>
      </extensions>
   </build>
</project>
```
Now you can deploy the actual file by invoking this command, replacing FILENAME, GROUP_ID, ARTIFACTNAME and version

    mvn deploy:deploy-file -Durl=dav:https://repository-dma.forge.cloudbees.com/release/\
                       -DrepositoryId=dma-release-repository\
                       -Dfile=FILENAME.jar \
                       -DgroupId=GROUP_ID \
                       -DartifactId=ARTIFACTNAME \
                       -Dversion=VERSION \
                       -Dpackaging=jar



