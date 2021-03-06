MaritimeCloud Contributors
==========================
This repositories contains various development tools. Useful when working with any of the dma-dk repositories.

Github source code organization
========================
https://github.com/MaritimeCloud is split into the following repositories

MaritimeCloud         :
MaritimeCloudMMS      : Contains the implementation of the Maritime Messaging Service
MaritimeCloudMSDL     : 
MaritimeCloudServices :
MaritimeCloudStore    :


GettingStarted        : 
Developers            : This repository

The script folder contains various small shell scripts to
+ Replace license headers in files
+ Replace tabs in files

Scripts
========================
The script folder contains various small shell scripts to

Update License headers
======================
Script to update headers in a project. You might need to update the path to the shell script.
> find . -name "*.java" -exec ../Contributors/scripts/update_headers.sh {} \; 


Remove Tabs
======================
Script to replace tabs in a project. You might need to update the path to the shell script.
> find . -name "*.java" -exec ../Contributors/scripts/remove_tabs.sh {} \; 


+ Replace license headers in files
+ Replace tabs in files

Rootpom
=========================
The rootpom folder contains the pom that all Maritime Cloud projects inherit from.
Whenever updates are made to it. The version is incremented by 1.

./mc.sh release-root-pom

Coding conventions
===============================
Coding conventions are defined by Checkstyle (see section below). The convention
on whitespace, text file encoding and line endings is:
  * UTF-8 text file encoding
  * Tab policy: spaces only
  * Indentation size 4 and tab size 8
  * LF line endings

##### Eclipse formatter
The project contains an Eclipse formatter that can be used
    
    resources/dma_eclipse_formatter.xml

Import in Eclipse

    Preferences -> Java -> Code Style -> Formatter -> Import

##### Line endings
To handle line endings issues between Windows and Linux/Mac it is recommended to configure
Eclipse or other IDE to always use LF. In Eclipse:

    Preferences -> General -> Workspace -> New text file line delimiter -> Other: Unix

Alternatively Git can be configured to convert line endings on Windows

    git config --global core.autocrlf true

##### Text file encoding
Configure IDE to use UTF-8. For Eclipse

    Preferences -> General -> Workspace -> Text file encoding -> Other: UTF-8


Checkstyle
===============================
Checkstyle is a development tool to help programmers write Java code that adheres to a coding standard.
Currently all of our projects adheres to the standard we have set up.

The configuration files of checkstyle is located in 
dma-developers/dma-build-tool/src/main/resources/dma-build-tool
and is being built into a single jar file. So can we reference it
from other maven projects.

Checkstyle can be run in 2 ways:

##### CLI
At the command line it can be invoked by calling "mvn checkstyle:check". It will fail if
there are any violations in the project. 

##### Eclipse
It can also be set up in Eclipse. By following this short guide:
+ Install the checkstyle plugin
+ Go to Preferences->Checkstyle
+ Select New 
+ Choose External Configuration
+ Name = DMA
+   Location = the full path to dma-developers/dma-build-tool/src/main/resources/dma-build-tool/checkstyle.xml
+   Choose Addition properties and add this property:
+     name = checkstyle.header.file
+     value = dma-developers/dma-build-tool/src/main/resources/dma-build-tool/LICENSE.txt
+   (Replace the above path with the full correct one)
+   Press OK a 3 times

Now right click any project and select Activate Checkstyle

Modifying the checkstyle configuratino is a bit involved.
Whenever the checkstyle configuration is updated you need to increment the version by one and deploy it to cloudbees
(see the above section on howto). After that you need to update the root pom to point at the new version and upload a new
version of the root pom. Finally you need to point all the projects at the new root pom.

