URL="http://eclipse.mirror.triple-it.nl/eclipse/downloads/drops4/R-4.4-201406061215/eclipse-platform-4.4-macosx-cocoa-x86_64.tar.gz"

rm -fr eclipse
curl -o eclipse.tar.gz $URL
tar -xvzf eclipse.tar.gz

#Install Java Development Environment
eclipse/eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/luna/ -installIU org.eclipse.jdt.feature.group

#Install Git Support
eclipse/eclipse -nosplash -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/luna/ -installIU org.eclipse.jgit.feature.group -installIU org.eclipse.egit.feature.group

#Install JadClipse Decompiler
eclipse/eclipse -nosplash  -application org.eclipse.equinox.p2.director -repository http://jd.benow.ca/jd-eclipse/update -installIU jd.ide.eclipse.feature.feature.group

#Install EasyShell (http://marketplace.eclipse.org/content/easyshell)
eclipse/eclipse -nosplash  -application org.eclipse.equinox.p2.director -repository http://pluginbox.sourceforge.net -installIU com.tetrade.eclipse.plugins.easyshell.feature.feature.group

#Install Google Terminal plugin (https://code.google.com/p/elt/)
eclipse/eclipse -nosplash  -application org.eclipse.equinox.p2.director -repository http://elt.googlecode.com/git/update-site -installIU com.google.eclipse.elt.feature.group
