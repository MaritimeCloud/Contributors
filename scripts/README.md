Scripts
===========
Various utility scripts


Update License headers
======================
Script to update headers in a project. You might need to update the path to the shell script.
> find . -name "*.java" -exec ../Contributors/scripts/update_headers.sh {} \; 


Remove Tabs
======================
Script to replace tabs in a project. You might need to update the path to the shell script.
> find . -name "*.java" -exec ../Contributors/scripts/remove_tabs.sh {} \; 
